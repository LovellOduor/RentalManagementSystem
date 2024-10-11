import 'package:flutter/material.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/widgets/payment_content_widget.dart';
import 'package:rental/widgets/side_menu_widget.dart';
import 'package:provider/provider.dart';

class PaymentsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PaymentsPageState();
  }
}

class _PaymentsPageState extends State<PaymentsPage>{
  @override
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
              flex:  10,
              child: PaymentContentWidget(),
            ),
          ],)
          )
      );
  }
}