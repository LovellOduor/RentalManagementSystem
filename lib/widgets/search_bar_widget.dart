import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return 
    TextField(
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color:Theme.of(context).primaryColor)),
        contentPadding: const EdgeInsets.symmetric(vertical:10),
        hintText: "search",
        prefixIcon: const Icon(Icons.search)
      ),
      
    )
    ;
  }
}