import 'package:flutter/material.dart';
import 'package:rental/widgets/settings_content_widget.dart';
import 'package:rental/widgets/side_menu_widget.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:provider/provider.dart';
class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  Widget build(BuildContext context){
    String userType = context.read<UserProvider>().type;

    return Scaffold(
      body: SafeArea(child:
          Row(children: [
            Expanded(
              flex: 2,
              child: SideMenuWidget(userType: userType,),
            ),
            Expanded(
              flex: 10,
              child: SettingsContent(),
            ),
            
          ],)
          )
      );
  }
}