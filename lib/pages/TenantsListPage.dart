import 'package:flutter/material.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/widgets/tenant_list_content.dart';
import 'package:rental/widgets/side_menu_widget.dart';
import 'package:provider/provider.dart';
class TenantListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TenantListPageState();
  }
}

class _TenantListPageState extends State<TenantListPage>{
  Widget build(BuildContext context){
   String userType = context.read<UserProvider>().type;
    return Scaffold(
      body: SafeArea(
        child:
          Row(children: [
              Expanded(
                flex: 2,
                child: SideMenuWidget(userType:userType),
              ),
             const Expanded(
                flex: 10,
                child:  SingleChildScrollView(child: TenantListContent())
              ),
            ],
          )
          )
      );
  }
}