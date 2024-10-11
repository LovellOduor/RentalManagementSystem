import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rental/models/Property.dart';
import 'package:rental/const/constants.dart';

class PropertyProvider extends ChangeNotifier{

  Property? property;

  List<Property> properties = [];

  XFile? selectedImage;
  String? photoUrl;
  
  Future<bool> selectProperty(Property? prpty) async{
    property = prpty;
    print(property?.propertyName);
    notifyListeners();
    return true;
  }

  Future<String?> uploadPropertyPic() async{

    if(selectedImage!= null){
      var file = File(selectedImage!.path);
        // Upload to Firebase
      TaskSnapshot snapshot;
      if(kIsWeb){
        snapshot  = await FirebaseStorage.instance.ref().child('property_photos/'+"rental"+selectedImage!.name).putData(await selectedImage!.readAsBytes());
      }else{
        snapshot  = await FirebaseStorage.instance.ref().child('property_photos/'+"rental"+selectedImage!.name).putFile(file);
      }
      photoUrl = await snapshot.ref.getDownloadURL();
    }

    return photoUrl;
  }

    Future<bool> setProperty(String propertyName, String location, String landlordID, String? photoUrl) async {
    bool success = false;
    final path = property!=null?"/updateProperty":"/createProperty";
    var headers = { "Content-Type": "application/x-www-form-urlencoded" };
    var uri = Uri.parse(baseUrl+path);

    Map body = {
      "ID":property?.ID??"",
      "propertyName":propertyName,
      "location":location,
      "landlordID":landlordID,
      "photoUrl":photoUrl??""
    };

    final response = await http.post(uri ,headers: headers, body: body, encoding:Encoding.getByName('utf-8'));
    
    if(response.statusCode == 200){
       final res = jsonDecode(response.body) as Map;
       if(res["result"]=="success"){
        if(res["data"]!=null){
          Map data = res["data"] as Map;
          property = Property(ID:data["ID"],propertyName:data["propertyName"],photoUrl:data["photoUrl"],location: data["location"],landlordID:data["landlordID"]);
        }
       }
       success = true;
       return success;
    }
    return success;
  }

  Future<bool> getProperties(String landlordID)async{
    bool success = false;
    const path = "/getProperties";
    var headers = { "Content-Type": "application/x-www-form-urlencoded" };
    var uri = Uri.parse(baseUrl+path);

    Map body = {
      "landlordID":landlordID,
    };

    final response = await http.post(uri ,headers: headers, body: body, encoding:Encoding.getByName('utf-8'));
    
    if(response.statusCode == 200){
       final res = jsonDecode(response.body) as Map;
       if(res["result"]=="success"){
        if(res["data"]!=null){
          List<Map> data =  List<Map>.from(res["data"]);
          for(Map p in data){
            properties.add(Property(ID: p["ID"], propertyName: p["propertyName"], location: p["location"], landlordID: p["landlordID"],photoUrl: p["photoUrl"]));
          }
        }
       }
       notifyListeners();
       success = true;
       return success;
    }
   
    return success;
    
  }

}