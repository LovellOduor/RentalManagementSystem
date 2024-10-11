import 'package:flutter/material.dart';
import 'package:rental/Provider/ApartmentProvider.dart';
import 'package:rental/Provider/PropertyProvider.dart';
import 'package:rental/widgets/profile_summary_widget.dart';
import 'package:rental/widgets/side_menu_widget.dart';
import 'package:rental/widgets/property_detail_widget.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:provider/provider.dart';

class PropertyDetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PropertyDetailPageState();
  }
}

class _PropertyDetailPageState extends State<PropertyDetailPage>{
  Widget build(BuildContext context){
           String userType = context.read<UserProvider>().type;

    return Scaffold(
      body: SafeArea(child:
          Row(children: [
            Expanded(
              flex: 2,
              child: SideMenuWidget(userType: userType),
            ),
            Expanded(
              flex: 7,
              child: 
              PropertyDetailWidget(),             
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