import 'package:flutter/material.dart';

class ApartmentDetailCard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ApartmentDetailCardState();
  }  
}


class ApartmentDetailCardState extends State<ApartmentDetailCard>{
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GridView.count(crossAxisCount: 4,children: [
        Text("Apartment Type"),
        Text("Unit Cost"),
        Text("Total Units"),
        Text("Occupied"),
      ],)
    ],);
  }
}