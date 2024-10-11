import 'package:flutter/material.dart';
import 'package:rental/widgets/page_title_widget.dart';

class TenantPaymentsContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        // Page title
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ PageTitle(title:"Tenant Payments") ]
        ),
        // Tenant profile picture, name , house no. rent
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Container(
              margin: const EdgeInsets.all(20),
              child:  ClipRRect(
              borderRadius: BorderRadius.circular(80),
                    child:
                Container(
                  width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child:Icon(Icons.person,size:100),
                )),
           ),
           Text("Tenant name"),
           Text("House no."),
           Text("Rent Amount."),
        ],),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Text("Current balance"),
           Text("Next payment due date"),
           Container(
              margin: EdgeInsets.only(bottom: 20),
              child:
              SizedBox(
                width: 300,
                child: TextButton(
                      onPressed: (){
                      },
                      style: const  ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),),
                      child: const Text("Download",style:
                    TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                      )
                  )
              )
            )
          ]
        ),
         const SizedBox(height: 20,),
        Expanded(child: 
        GridView.count(crossAxisCount: 5,children: [
          Text("TransactionID"),
          Text("Amount"),
          Text("Due Date"),
          Text("Balance"),
          Text("Payment Date"),
        ],)
        )
      ],
    );
  }
}