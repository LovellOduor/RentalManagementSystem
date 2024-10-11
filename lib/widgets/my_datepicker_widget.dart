import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget{
  const MyDatePicker({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDatePickerState();
  }

}

class MyDatePickerState extends State<MyDatePicker>{

  Future<void> _selectDate(context) async{
    DateTime? _picked = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1912),
        lastDate: DateTime.now());

    if( _picked != null){
      setState(() {
        dateController.text =  _picked.toString().split(" ")[0];

      });
    }
  }

  TextEditingController dateController = TextEditingController();

  Widget build(BuildContext context){
    return Container(
      child: TextField(
        controller: dateController,
        readOnly: true,
        onTap:(){ _selectDate(context);},
        decoration: InputDecoration(
            labelText: "Date of Birth",
            filled: true,
            prefixIcon: Icon(Icons.calendar_today),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
            )
        ),
      ),
    );
  }
}