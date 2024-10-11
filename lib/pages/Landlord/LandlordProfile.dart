import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/util/responsive.dart';
import 'package:rental/widgets/Landlord/landlord_profile_widget.dart';
import 'package:rental/widgets/side_menu_widget.dart';

class LandlordProfile extends StatefulWidget{
  const LandlordProfile({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LandlordProfileState();
  }
}

class _LandlordProfileState extends State<LandlordProfile>{
  Widget build(BuildContext context){

    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    bool isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: Drawer(child: SideMenuWidget(userType:UserType.landlord)),
      appBar: ( isMobile || isTablet )?AppBar():null,
      body: SafeArea(child:
          Row(
            children: [
            if(isDesktop)  
            Expanded(
              flex: 2,
              child: SideMenuWidget(userType: UserType.landlord,),
            ),
            Expanded(
              flex: 10,
              child: LandlordProfileWidget(),
            ),
          ],
          )
          )
      );
  }
}