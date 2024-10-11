import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/widgets/side_menu_widget.dart';
import 'package:rental/widgets/Tenant/tenant_profile_widget.dart';

class TenantProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TenantProfilePageState();
  }
}

class _TenantProfilePageState extends State<TenantProfilePage>{
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child:
          Row(children: [
                Expanded(
                  flex: 2,
                  child: SideMenuWidget(userType: UserType.tenant,),
                ),
                Expanded(
                  flex: 10,
                  child: TenantProfileWidget(),
                ),
              ],
            )
          )
      );
  }
}