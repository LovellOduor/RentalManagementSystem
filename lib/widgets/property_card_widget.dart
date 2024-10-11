import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget{
  String propertyName;
  String? photoUrl;
  String location;
  PropertyCard({required this.propertyName,required this.location,this.photoUrl});
  @override
  Widget build(BuildContext context) {
    return  
         Card(child: 
            Column(
                children: [
                if(photoUrl!=null)
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                            image:DecorationImage(
                                image: NetworkImage(photoUrl!),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                  Column(children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft, 
                      child: Text(propertyName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                    ),
                      Container(
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft, 
                      child: Text(location)
                    ),
                  ],)
                ],
              )
         );
  }
}