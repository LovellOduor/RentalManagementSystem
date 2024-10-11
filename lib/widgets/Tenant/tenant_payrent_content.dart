import 'package:flutter/material.dart';
import 'package:rental/widgets/my_textfield_widget.dart';
import 'package:rental/widgets/page_title_widget.dart';


class TenantPayRentContent extends StatelessWidget{
  Widget build(BuildContext context){
  return Container(
       margin: const EdgeInsets.symmetric(horizontal: 50),
       width: double.infinity,
       child:SingleChildScrollView(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
     const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        PageTitle(title: "Pay Rent")
      ],),
      const SizedBox(height: 20),
    
     // Username textfield
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child:  MyTextField(text: "", sectionName: "Account No."),
         )
     ),
    // Email textfield
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "", sectionName: "Phone No."),
         )
     ),
     Container(
         margin: const EdgeInsets.only(bottom: 20),
         child:
         SizedBox(
          width: 300,
          child: TextButton(
                onPressed: (){

                },
                style: const  ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),),
                child: const Text("Pay",style:
               TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                )
            )
         )
      )
    ])
    )
    );
  }
}