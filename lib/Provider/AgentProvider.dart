import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rental/const/constants.dart';
import 'package:rental/models/RentalUser.dart';

class AgentProvider extends ChangeNotifier{

  Agent? agent;
  List<Agent> agents = [];

  Future<bool> getAgents(String landlordID)async{
    
    bool success = false;
    const path = "/getAgents";
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
          for(Map agent in data){
            agents.add(Agent(ID:agent["ID"],userName: agent["userName"],email:agent["email"],contact:agent["contact"],IDNumber: agent["IDNumber"],earningRate: agent["earningRate"], landlordID: agent["landlordID"],photoUrl:agent["photoUrl"]));
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