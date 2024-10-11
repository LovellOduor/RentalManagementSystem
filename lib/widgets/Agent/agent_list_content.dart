import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental/Provider/AgentProvider.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/models/RentalUser.dart';
import 'package:rental/widgets/Agent/agent_card_widget.dart';
import 'package:rental/widgets/search_bar_widget.dart';
import 'package:rental/widgets/page_title_widget.dart';
import 'package:provider/provider.dart';

class AgentListContent extends StatefulWidget{
  const AgentListContent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AgentListContentState();
  }
}

class _AgentListContentState extends State<AgentListContent>{
   String landlordID = "";

  @override
  void initState() {
     RentalUser? currentUser = context.read<UserProvider>().user;
    if(currentUser!=null){
      if(currentUser.type == UserType.agent){
        currentUser = currentUser as Agent;
        landlordID = currentUser.landlordID;
      }else if(currentUser.type == UserType.landlord){
        currentUser = currentUser as Landlord;
        landlordID = currentUser.ID;
      }
    }
    context.read<AgentProvider>().getAgents(landlordID);
    super.initState();
  }

  Widget build(BuildContext context){
    return
        SingleChildScrollView(child: 
     Container(
      margin: const EdgeInsets.all(40),
      child: 
      Consumer<AgentProvider>(builder: (context,agentProvider,child)=>
      Column(children: [
          const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [PageTitle(title:"Agents")]
          ),
          SearchBarWidget(),
          const SizedBox(height: 10),
          Container(
                width: 1000,
                height: 1000,
                child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 0.85,
                children: agentProvider.agents.map((agent){
                  return AgentCard(userName:agent.userName,photoUrl: agent.photoUrl);
                  }).toList()
              )
          )
          ])
      )
        ));
  }
}