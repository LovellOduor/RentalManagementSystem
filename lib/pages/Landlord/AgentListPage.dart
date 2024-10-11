import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/Provider/AgentProvider.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/widgets/Agent/agent_list_content.dart';
import 'package:rental/widgets/side_menu_widget.dart';

class AgentListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AgentListPageState();
  }
}

class _AgentListPageState extends State<AgentListPage>{
  Widget build(BuildContext context){
    return 
    Scaffold(
      body: SafeArea(
        child:
          Row(children: [
              Expanded(
                flex: 2,
                child: SideMenuWidget(userType: UserType.landlord),
              ),
              Expanded(
                flex: 10,
                child:ChangeNotifierProvider<AgentProvider>(create: (context)=>
                 AgentProvider(),child: const AgentListContent(),)
              ),
            ],
          )
        )
      );
  }
}