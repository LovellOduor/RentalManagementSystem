import 'package:flutter/material.dart';
import 'package:rental/widgets/my_textfield_widget.dart';
import 'package:rental/widgets/page_title_widget.dart';
import 'package:rental/widgets/profile_picture_picker.dart';


class TenantProfileWidget extends StatelessWidget{
  Widget build(BuildContext context){
  return Container(
       margin: const EdgeInsets.symmetric(horizontal: 50),
       width: double.infinity,
       child:SingleChildScrollView(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 20),
      PageTitle(title: "Tenant Profile"),
      const SizedBox(height: 20),
           // Profile Picture
      Container(
        margin: const EdgeInsets.all(20),
        child: ProfilePicturePicker(),
      ),
     // Username textfield
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child:  MyTextField(text: "Lovell Oduor", sectionName: "Username"),
         )
     ),
    // Email textfield
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "lovelloduor123@gmail.com", sectionName: "Email"),
         )
     ),
     Container(
         margin: EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: MyTextField(text: "07 XXX XXX", sectionName: "Contact"),
         )
     ),
    Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "LandlordID", sectionName: "LandlordID"),
         )
     ),  
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "AgentID", sectionName: "AgentID"),
         )
     ),     
      Container(
         margin: EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: 
         MyTextField(text: "House no.", sectionName: "House no.")
         ),
     ), 
     Container(
         margin: EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: 
         MyTextField(text: "ID no.", sectionName: "ID no.")
         ),
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