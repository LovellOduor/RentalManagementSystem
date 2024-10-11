import 'package:flutter/material.dart';
import 'package:rental/widgets/my_textfield_widget.dart';
import 'package:rental/widgets/page_title_widget.dart';
import 'package:rental/widgets/profile_picture_picker.dart';

class SettingsContent extends StatelessWidget{
  Widget build(BuildContext context){
    return
   Container(
       margin: const EdgeInsets.symmetric(horizontal: 50),
       width: double.infinity,
       child:SingleChildScrollView(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.start,children: [
        const PageTitle(title: "Settings")
      ],),
      const SizedBox(height: 20),
      const Text("M-Pesa Payment API settings"),
     // Username textfield
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child:  MyTextField(text: "", sectionName: "Process Request URL"),
         )
     ),
    // Email textfield
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "", sectionName: "Base URL"),
         )
     ),
     Container(
         margin: EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: MyTextField(text: "", sectionName: "Pass key"),
         )
     ),
    Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "", sectionName: "Business Short Code"),
         )
     ),  
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "", sectionName: "Account Refrence"),
         )
     ),     
     
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
                child: const Text("Save",style:
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