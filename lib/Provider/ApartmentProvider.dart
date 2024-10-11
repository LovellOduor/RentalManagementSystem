import 'package:flutter/material.dart';
import 'package:rental/models/Apartment.dart';
import 'package:rental/const/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApartmentProvider extends ChangeNotifier{

  Apartment? selectedApartment;
  List<Apartment> apartmentList = [];

  Future<bool> setApartments(String propertyID) async{

    bool success = false;
    const path = "/setApartments";
    var headers = { "Content-Type": "application/json" };
    var uri = Uri.parse(baseUrl+path);
    try{
    
    Map body = {"apartments": jsonEncode(apartmentList.map((apartment){
      apartment.propertyID = propertyID;
      return jsonEncode(apartment.toObject());
    }).toList())};
    
    final response = await http.post(uri ,headers: headers, body: body, encoding:Encoding.getByName('utf-8'));
    
    if(response.statusCode == 200){
       final res = jsonDecode(response.body) as Map;
       if(res["result"]=="success"){
        apartmentList = [];
        if(res["data"]!=null){
          Map data = res["data"] as Map;
          List receivedApartments = data["apartments"] as List;
          for(Map ap in receivedApartments){
            apartmentList.add(Apartment(apartmentName:ap["apartmentName"], cost: ap["cost"], occupiedUnits: ap["occupiedUnits"], totalUnits: ap["totalUnits"]));
          }
        }
        success = true;
        notifyListeners();
       }
    }
    }catch(e){
      print(e);
    }
    
    return success;
  }
  
  Future<bool> getApartments(String propertyID) async{
    bool success = false;
    const path = "/getApartments";
    var headers = { "Content-Type": "application/x-www-form-urlencoded" };
    var uri = Uri.parse(baseUrl+path);

    Map body = {
      "propertyID":propertyID,
    };

    final response = await http.post(uri ,headers: headers, body: body, encoding:Encoding.getByName('utf-8'));
    
    if(response.statusCode == 200){
       final res = jsonDecode(response.body) as Map;
       if(res["result"]=="success"){
        if(res["data"]!=null){
          List<Map> data = List<Map>.from(res["data"]);
          for(Map ap in data){
            apartmentList.add(Apartment(ID: ap["ID"], apartmentName: ap["apartmentName"], propertyID: ap["propertyID"], cost: ap["cost"], occupiedUnits: ap["occupiedUnits"], totalUnits: ap["totalUnits"]));
          }
        }
       }
       notifyListeners();
       success = true;
       return success;
    }
   
    return success;
  }


  void deleteApartment(int index){

  }
  

  void addApartment(Apartment apartment){
    apartmentList.add(apartment);
    notifyListeners();
  }
}