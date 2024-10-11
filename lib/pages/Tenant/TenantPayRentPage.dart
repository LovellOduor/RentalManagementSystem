import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/widgets/side_menu_widget.dart';
import 'package:rental/widgets/Tenant/tenant_payrent_content.dart';
import 'package:rental/widgets/Tenant/tenant_profile_widget.dart';

class TenantPayRentPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TenantPayRentPageState();
  }
}

class _TenantPayRentPageState extends State<TenantPayRentPage>{
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
                  child: TenantPayRentContent(),
                ),
              ],
            )
          )
      );
  }
}