import 'package:flutter/material.dart';

class SearchFiltersWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  _StateSearchFiltersWidget();
  }
}

class _StateSearchFiltersWidget extends State<SearchFiltersWidget>{
@override
  Widget build(BuildContext context) {
    return Row(children: [
       Container(
         margin: EdgeInsets.all(20),
         child:
         SizedBox(
          width: 200,
          child: TextButton(
                onPressed: (){
                },
                style: const  ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),),
                child: const Text("With balances",style:
               TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                )
            )
        )
      ),
       Container(
         
         margin: EdgeInsets.all(20),
         child:
         SizedBox(
          width: 200,
          child: TextButton(
                onPressed: (){
                },
                style: const  ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),),
                child: const Text("Without balances",style:
               TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                )
            )
        )
      ),
       Container(
         margin: EdgeInsets.all(20),
         child:
         SizedBox(
          width: 200,
          child: TextButton(
                onPressed: (){
                },
                style: const  ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),),
                child: const Text("all",style:
               TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                )
            )
        )
      )
    ]);
  }
}
