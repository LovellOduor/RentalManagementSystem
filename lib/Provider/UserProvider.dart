import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/models/RentalUser.dart';

class UserProvider extends ChangeNotifier{

  RentalUser? user;
  XFile? selectedImage;
  String? photoUrl;

  String ID = "";
  String type = "";


  Future<String?> uploadProfilePic() async{
    if(selectedImage!= null){
      var file = File(selectedImage!.path);
        //Upload to Firebase
      TaskSnapshot snapshot;
      if(kIsWeb){
        snapshot  = await FirebaseStorage.instance.ref().child('profile_photos/'+"rental"+selectedImage!.name).putData(await selectedImage!.readAsBytes());
      }else{
        snapshot  = await FirebaseStorage.instance.ref().child('profile_photos/'+"rental"+selectedImage!.name).putFile(file);
      }
      photoUrl = await snapshot.ref.getDownloadURL();
    }

    if(user!=null && photoUrl==null){
      photoUrl = user?.photoUrl;
    }

    if(photoUrl==null){
      return "";
    }
    
    return photoUrl;
  }

  Future<http.Response> userExists() async {
    print("The user id is $ID");
    const path = "/userExists";
    var headers = { "Content-Type": "application/x-www-form-urlencoded" };
    var uri = Uri.parse(baseUrl+path);
    Map body = {"ID":ID};
    final response = await http.post(uri ,headers: headers, body: body, encoding:Encoding.getByName('utf-8'));
    return response;
  }

  Future<http.Response> getCurrentUser() async {
    const path = "/getUser";
    var headers = { "Content-Type": "application/x-www-form-urlencoded" };
    var uri = Uri.parse(baseUrl+path);
    Map body = {"ID":ID,"type":type};
    final response = await http.post(uri ,headers: headers, body: body, encoding:Encoding.getByName('utf-8'));
    return response;
  }

   Future<bool> setLandlord(String landlordID, String? photoUrl, String userName, String email, String contact) async {
    bool success = false;
    final path = user!=null?"/updateLandlord":"/createLandlord";
    var headers = { "Content-Type": "application/x-www-form-urlencoded" };
    var uri = Uri.parse(baseUrl+path);
    Map body = {
      "ID":landlordID, 
      "photoUrl":photoUrl,
      "userName":userName,
      "email":email,
      "type":UserType.landlord,
      "contact":contact,
    };

    final response = await http.post(uri ,headers: headers, body: body, encoding:Encoding.getByName('utf-8'));
    
    if(response.statusCode == 200){
       final res = jsonDecode(response.body) as Map;
       if(res["result"]=="success"){
        if(res["data"]!=null){
          Map data = res["data"] as Map;
          user = Landlord(ID:data["ID"],userName:data["userName"],photoUrl:data["photoUrl"],email: data["email"],contact:data["contact"]);
          print(photoUrl);
        }
       }
       success = true;
       return success;
    }
    return success;
  }

  Future<bool> setAgent(String agentID,String landlordID, String IDNumber, double earningRate, String? photoUrl, String userName, String email, String contact) async {
    bool success = false;
    final path = user!=null?"/updateAgent":"/createAgent";
    var headers = { "Content-Type": "application/x-www-form-urlencoded" };
    var uri = Uri.parse(baseUrl+path);

    Map body = {
      "userName":userName,
      "ID":agentID,
      "contact":contact,
      "email":email,
      "landlordID":landlordID,
      "type":UserType.agent,
      "IDNumber":IDNumber,
      "earningRate":earningRate.toString(),
      "photoUrl":photoUrl
    };

    // print(body.toString());
    print("sending data");
    final response = await http.post(uri ,headers: headers, body: body, encoding:Encoding.getByName('utf-8'));
    if(response.statusCode == 200){
       final res = jsonDecode(response.body) as Map;
       if(res["result"]=="success"){
        if(res["data"]!=null){
          Map data = res["data"] as Map;
          user = Agent(ID:data["ID"],userName:data["userName"],photoUrl:data["photoUrl"],email: data["email"],contact:data["contact"],landlordID:data["landlordID"],earningRate: double.parse(data["earningRate"]),IDNumber:data["IDNumber"]);
          print(photoUrl);
        }
       }
       success = true;
       return success;
    }
    return success;
  }

}


/**
 * 
 * Future<http.Response> postRequest () async {
  var url ='https://pae.ipportalegre.pt/testes2/wsjson/api/app/ws-authenticate';
  
  Map data = {
    'apikey': '12345678901234567890'
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
*/