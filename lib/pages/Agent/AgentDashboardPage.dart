import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/util/responsive.dart';
import 'package:rental/widgets/Agent/agent_dashboard_widget.dart';
import 'package:rental/widgets/profile_summary_widget.dart';
import 'package:rental/widgets/side_menu_widget.dart';

class AgentDashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AgentDashboardState();
  }
}

class _AgentDashboardState extends State<AgentDashboard>{
  Widget build(BuildContext context){

      return Scaffold(
      drawer: null,
      appBar: null,

      body: SafeArea(child:
          Row(children: [

            if(Responsive.isDesktop(context)) Expanded(flex: 2, child: SideMenuWidget(userType: UserType.agent),),
             Expanded(
              flex: 7,
              child: AgentDashboardWidget(),
            ),

           if(Responsive.isTablet(context) || Responsive.isDesktop(context)) Expanded(
              flex: 3,
              child: ProfileSummaryWidget(),
            ),

          ],)
          )
      );

  }
}