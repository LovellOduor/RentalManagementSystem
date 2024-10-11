import 'package:flutter/material.dart';

class PaymentsListWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PaymentsListWidgetState();
  }
}

class _PaymentsListWidgetState extends State<PaymentsListWidget>{
  @override
  Widget build(BuildContext context) {
    return 
     Container(
      height: 500,
      width: 1000,
      child: GridView.count(
                crossAxisCount: 6,children:
                [
                  Text("Tenant Name"),
                  Text("TransactionID"),
                  Text("Amount"),
                  Text("Due Date"),
                  Text("Balance"),
                  Text("Payment Date"),
                  Text("Tenant Name"),
                  Text("TransactionID"),
                  Text("Amount"),
                  Text("Due Date"),
                  Text("Balance"),
                  Text("Payment Date"),
                ]
            )
    
    );
  }
}