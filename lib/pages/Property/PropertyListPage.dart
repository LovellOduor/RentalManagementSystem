import 'package:flutter/material.dart';
import 'package:rental/Provider/PropertyProvider.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/models/RentalUser.dart';
import 'package:rental/widgets/property_list_content.dart';
import 'package:rental/widgets/side_menu_widget.dart';
import 'package:rental/Provider/UserProvider.dart';
import "package:provider/provider.dart";
class PropertyListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PropertyListPageState();
  }
}

class _PropertyListPageState extends State<PropertyListPage>{
 
  Widget build(BuildContext context){
    String userType = context.read<UserProvider>().type;

    return 
    
    Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<PropertyProvider>().property = null;
        Navigator.of(context).pushNamed("/property_detail");
      },
      child: const Text(" + "),
      ),
      body:
      SafeArea(
        child:
          Row(children: [
            Expanded(
              flex: 2,
              child: SideMenuWidget(userType: userType,),
            ),
            const Expanded(
              flex: 7,
              child: PropertyListContent(),
            )
          ],
          )
          )
      );
  }
}