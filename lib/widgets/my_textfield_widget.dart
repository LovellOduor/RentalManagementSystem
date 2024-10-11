import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final String text;
  final String sectionName;
  final TextEditingController? fieldTextController;
  MyTextField({super.key,required this.text,required this.sectionName,this.fieldTextController});


  @override
  Widget build(BuildContext context){
    
    return  TextFormField(
      validator: (value){
        if(value==null || value.isEmpty){
          return "Please enter a value";
        }
        return null;
      },
      controller: fieldTextController,
      decoration: InputDecoration(
          labelText: sectionName,
          filled: true,
          //    prefixIcon: Icon(Icons.calendar_today),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)
          )
      ),
    );
  }
}