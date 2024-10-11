import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/widgets/Agent/agent_dashboard_widget.dart';
import 'package:rental/widgets/profile_summary_widget.dart';
import 'package:rental/widgets/side_menu_widget.dart';

class TenantDashboard extends StatefulWidget{
  const TenantDashboard({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TenantDashboardState();
  }
}

class _TenantDashboardState extends State<TenantDashboard>{
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child:
          Row(
            children: [
              Expanded(
                flex: 2,
                child: SideMenuWidget(userType:UserType.tenant),
              ),
              Expanded(
                flex: 7,
                child: AgentDashboardWidget(),
              ),
              Expanded(
                flex: 3,
                child: ProfileSummaryWidget(),
              ),
          ],)
          )
      );
  }
}