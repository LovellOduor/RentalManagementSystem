import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/widgets/Agent/agent_profile_widget.dart';
import 'package:rental/widgets/side_menu_widget.dart';

class AgentProfile extends StatefulWidget{
  const AgentProfile({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AgentProfileState();
  }
}

class _AgentProfileState extends State<AgentProfile>{
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child:
          Row(children: [
            Expanded(
              flex: 2,
              child: SideMenuWidget(userType: UserType.agent,),
            ),
            Expanded(
              flex: 10,
              child: AgentProfileWidget(),
            ),
          ],)
          )
      );
  }
}