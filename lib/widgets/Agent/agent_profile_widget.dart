import 'package:flutter/material.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/widgets/my_textfield_widget.dart';
import 'package:rental/widgets/page_title_widget.dart';
import 'package:rental/widgets/profile_picture_picker.dart';
import 'package:provider/provider.dart';
import 'package:rental/models/RentalUser.dart';

class AgentProfileWidget extends StatelessWidget{

  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController(); 
  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController contactController = TextEditingController(); 
  final TextEditingController landlordIDController = TextEditingController(); 
  final TextEditingController earningRateController = TextEditingController(); 
  final TextEditingController IDNumberController = TextEditingController(); 

  Future<void> uploadData(BuildContext context)async{

   String? photoUrl = await context.read<UserProvider>().uploadProfilePic();
   if(photoUrl!=null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile picture uploaded successfuly')),
      );
   }
   
   print(photoUrl);

   bool uploadSuccess = await context.read<UserProvider>().setAgent(context.read<UserProvider>().ID, landlordIDController.text, IDNumberController.text, (earningRateController.text.isNotEmpty?double.parse(earningRateController.text.toString()): 0.0), photoUrl, usernameController.text, emailController.text, contactController.text);
   if(uploadSuccess){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile uploaded successfuly')),
      );
   }else{
     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile upload failure')),
      );
   }
   
  }

  Widget build(BuildContext context){

    var currentUser = context.read<UserProvider>().user;

    if(currentUser!=null){
      currentUser = currentUser as Agent;
      usernameController.text = currentUser.userName;
      emailController.text = currentUser.email;
      contactController.text = currentUser.contact;
      landlordIDController.text = currentUser.landlordID; 
      earningRateController.text = currentUser.earningRate.toString(); 
      IDNumberController.text = currentUser.IDNumber; 
    }

    return  Form(
      key: formKey,
    child: Container(
       margin: const EdgeInsets.symmetric(horizontal: 50),
       width: double.infinity,
       child:SingleChildScrollView(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [

    const SizedBox(height: 5),
    const Row(mainAxisAlignment: MainAxisAlignment.start, children: [PageTitle(title: "Profile")],),
    const SizedBox(height: 20),
    
    // Profile Picture
    Container(
      margin: const EdgeInsets.all(20),
      child: ProfilePicturePicker(defaultPic: currentUser?.photoUrl),
    ),

     // Username textfield
     Container(
         margin: EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child:  MyTextField(text: "Lovell Oduor", sectionName: "Username",fieldTextController: usernameController),
         )
     ),

    // Email textfield
     Container(
         margin: const EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "lovelloduor123@gmail.com", sectionName: "Email",fieldTextController: emailController),
         )
     ),

     Container(
         margin: const EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: MyTextField(text: "07 XXX XXX", sectionName: "Contact",fieldTextController: contactController),
         )
     ),

     Container(
         margin: const EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: MyTextField(text: "", sectionName: "Landlord ID",fieldTextController: landlordIDController),
         )
     ),
      
     Container(
         margin: const EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: MyTextField(text: "", sectionName: "ID Number",fieldTextController: IDNumberController),
         )
     ),

     Container(
         margin: EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: MyTextField(text: "", sectionName: "Earning Rate",fieldTextController: earningRateController),
         )
     ),

     Container(
         margin: EdgeInsets.only(bottom: 20),
         child:
         SizedBox(
          width: 300,
          child: ElevatedButton(
                  onPressed: ()async {
                  // Validate returns true if the form is valid, or false otherwise.
                      if (formKey.currentState!.validate()) {
                          uploadData(context);
                      }
                  },
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
    ));
  }
}