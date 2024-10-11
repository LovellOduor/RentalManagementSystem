
import 'package:flutter/material.dart';
import 'package:rental/Provider/ApartmentProvider.dart';
import 'package:rental/Provider/PropertyProvider.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/models/Property.dart';
import 'package:rental/models/RentalUser.dart';
import 'package:rental/widgets/apartment_detail_section.dart';
import 'package:rental/widgets/my_textfield_widget.dart';
import 'package:rental/widgets/page_title_widget.dart';
import 'package:rental/widgets/property_picture_picker.dart';
import 'package:provider/provider.dart';

class PropertyDetailWidget extends StatelessWidget{
  
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController landlordIDController = TextEditingController();
  
  Future<void> uploadData(BuildContext context)async{
    final propertyProvider = context.read<PropertyProvider>();

   String? photoUrl = await propertyProvider.uploadPropertyPic();
   if(photoUrl!=null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile picture uploaded successfuly')),
      );
   }

   final bool uploadSuccess = await propertyProvider.setProperty(propertyNameController.text,locationController.text,landlordIDController.text,photoUrl);
  
   if(uploadSuccess){
    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Property uploaded successfuly')), );
    final bool uploadApartmentSuccess = await context.read<ApartmentProvider>().setApartments(propertyProvider.property!.ID);
    if(uploadApartmentSuccess){
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Apartments upload success')),
      );
    }else{
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Apartments upload failure')),
      );
    }
   }else{
     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Property upload failure')),
      );
   }
  }

  @override
  Widget build(BuildContext context) {
    final Property? selectedProperty = context.read<PropertyProvider>().property;
    RentalUser? currentUser = context.read<UserProvider>().user;

    if(selectedProperty!=null){
      propertyNameController.text = selectedProperty.propertyName;
      locationController.text = selectedProperty.location;
    }
    
    if(currentUser!=null){
      if(currentUser.type == UserType.agent){
        currentUser = currentUser as Agent;
        landlordIDController.text = currentUser.landlordID;
      }else if(currentUser.type == UserType.landlord){
        landlordIDController.text = currentUser.ID;
      }
    }

    return Container(
       margin: const EdgeInsets.symmetric(horizontal: 50),
       width: double.infinity,
       child:SingleChildScrollView(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 20),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[PageTitle(title: "Property Details")]),
              const SizedBox(height: 20),
      // Profile Picture
      Container(
        margin: const EdgeInsets.all(20),
        child: PropertyPicturePicker(defaultPic: selectedProperty?.photoUrl),
      ),
     // Username textfield
     Container(
         margin: const EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child:  MyTextField(text: "Property name", sectionName: "Property Name",fieldTextController: propertyNameController,),
         )
     ),
    // Email textfield
     Container(
         margin: const EdgeInsets.all(20),
         child: SizedBox(
          width: 500,
          child: MyTextField(text: "Location", sectionName: "Location",fieldTextController: locationController,),
         )
     ),
     
     Container(
         margin: const EdgeInsets.all(20),
         child: 
         SizedBox(
          width: 500,
          child: MyTextField(text: "LandlordID", sectionName: "LandlordID",fieldTextController: landlordIDController),
         )
     ),
  
     ApartmentDetailSection(),

       Container(
         margin: const EdgeInsets.symmetric(vertical: 20),
         child:
         SizedBox(
          width: 300,
          child: TextButton(
                onPressed: (){
                  uploadData(context);
                },
                style: const  ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),
                ),
                child: const Text("Save",style: TextStyle( fontSize: 20, color: Colors.white ),
              )
          )
        )
      )
    ])
    )
  );
  }
}