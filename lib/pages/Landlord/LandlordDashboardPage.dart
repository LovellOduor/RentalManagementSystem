import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/util/responsive.dart';
import 'package:rental/widgets/Landlord/landlord_dashboard_content_widget.dart';
import 'package:rental/widgets/profile_summary_widget.dart';
import 'package:rental/widgets/side_menu_widget.dart';

class LandlordDashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LandlordDashboardState();
  }
}

class _LandlordDashboardState extends State<LandlordDashboard>{

  @override
  void initState() {
    super.initState();
    // GET LANDLORD DATA
    
  }

  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(child: SideMenuWidget(userType:UserType.landlord)),
      appBar: (Responsive.isMobile(context) || Responsive.isTablet(context))?AppBar():null,
      body: SafeArea(child:
            Row(children: [
             if(Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SideMenuWidget(userType:UserType.landlord,),
              ),
              Expanded(
                flex: 7,
                child: LandlordDashboardContentWidget(),
              ),
            if(Responsive.isDesktop(context) || Responsive.isTablet(context))
              Expanded(
                flex: 3,
                child: ProfileSummaryWidget(),
              ),
          ],)
          )
      );
  }
}