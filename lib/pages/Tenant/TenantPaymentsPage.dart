import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/widgets/side_menu_widget.dart';
import 'package:rental/widgets/tenant_payments_content.dart';

class TenantPaymentsPage extends StatelessWidget{

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
                child: TenantPaymentsContent()
              ),
            ],
          )
          )
      );
  }
}