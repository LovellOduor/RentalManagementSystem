import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget{
  final String title;
  const PageTitle({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 30 ),);
  }
}