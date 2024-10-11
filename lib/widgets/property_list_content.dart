import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rental/Provider/ApartmentProvider.dart';
import 'package:rental/Provider/PropertyProvider.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/models/RentalUser.dart';
import 'package:rental/widgets/page_title_widget.dart';
import 'package:rental/widgets/property_card_widget.dart';

class PropertyListContent extends StatefulWidget{
  const PropertyListContent();
  @override
  State<StatefulWidget> createState() {
    return _PropertyListContentState();
  }
}

class _PropertyListContentState extends State<PropertyListContent>{
  String landlordID = "";
  @override
  void initState() {
    super.initState();
     RentalUser? currentUser = context.read<UserProvider>().user;
    if(currentUser!=null){
      if(currentUser.type == UserType.agent){
        currentUser = currentUser as Agent;
        landlordID = currentUser.landlordID;
      }else if(currentUser.type == UserType.landlord){
        currentUser = currentUser as Landlord;
        landlordID = currentUser.ID;
      }
    }
    context.read<PropertyProvider>().getProperties(landlordID);
    super.initState();
  }

  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Consumer<PropertyProvider>(
        builder: (context,propertyProvider,child)=>  
    Column(
    children: [
        const SizedBox(height: 20,),
        const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ PageTitle(title:"Properties") ]
          ),
        const SizedBox(height:20),
        Container(
          width: 1000,
          height: 1000,
          child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
          children:propertyProvider.properties.map((property){
            return GestureDetector(onTap:() async {
              propertyProvider.photoUrl = property.photoUrl;
              propertyProvider.selectProperty(property).then((value){
                  context.read<ApartmentProvider>().getApartments(property.ID);
                  Navigator.of(context).pushNamed('/property_detail');
              });
             },child: PropertyCard(propertyName: property.propertyName,location:property.location,photoUrl: property.photoUrl)
            );}).toList()
          )
        )
    ])));
  }
}