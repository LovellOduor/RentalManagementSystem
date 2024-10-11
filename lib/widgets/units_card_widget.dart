import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UnitsCard extends StatelessWidget{

  final String label;
  final int units;
  const UnitsCard({super.key ,required this.label, required this.units});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          // Text
          Text(label,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal ),),
          Text(units.toString(),style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold ),)
          // No
        ],),
        ),
    );
  }

}