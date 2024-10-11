import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/Provider/SIdeMenuProvider.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/data/side_menu_data.dart';
import 'package:rental/util/responsive.dart';


class SideMenuWidget extends StatefulWidget{
  String? userType;
  SideMenuWidget({super.key,this.userType});
  @override
  State<StatefulWidget> createState() {
    return StateSideMenuWidget();
  }
}

class StateSideMenuWidget extends State<SideMenuWidget>{

  late SideMenuProvider sideMenuProvider;

  Widget build(BuildContext context){

    sideMenuProvider = context.read<SideMenuProvider>();
    SideMenuData data = SideMenuData(userType:widget.userType??"tenant");

    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context,index) => buildMenuEntry(data, index)
        ),
    );
    
  }

  Widget buildMenuEntry(SideMenuData data, int index){
    final isSelected = sideMenuProvider.selectedIndex == index;
  return 
  Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(10),
    child: 
        ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onTap: (){
            setState((){
              sideMenuProvider.selectedIndex = index;
            });
            Navigator.of(context).pushNamed(data.menu[index].path);
          },
          tileColor : isSelected?Colors.blue:Colors.transparent ,
          leading: Icon(data.menu[index].icon),
          title: Text(data.menu[index].title),
        )
    );
  }
}