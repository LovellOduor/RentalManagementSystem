import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rental/Provider/ApartmentProvider.dart';
import 'package:rental/models/Apartment.dart';

class ApartmentDetailSection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ApartmentDetailSectionState();
  }  
}

TableRow blankRow = TableRow(
  children:[
    TableCell(child: SizedBox(height: 30,)),
    TableCell(child: SizedBox(height: 30,)),
    TableCell(child: SizedBox(height: 30,)),
    TableCell(child: SizedBox(height: 30,)),
    TableCell(child: SizedBox(height: 30,)),
    TableCell(child: SizedBox(height: 30,)),
    TableCell(child: SizedBox(height: 30,)),
  ]
);

class ApartmentDetailSectionState extends State<ApartmentDetailSection>{

  TextEditingController apartmentNameController =  TextEditingController();
  TextEditingController costController =  TextEditingController();
  TextEditingController totalUnitsController =  TextEditingController();
  TextEditingController occupiedUnitsController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ApartmentProvider apartmentProvider = context.read<ApartmentProvider>();
    return 
    SafeArea(child: 
     Container(
        width: double.infinity,
        child: 
        
        Consumer<ApartmentProvider>(
          builder:(context,provider,child)=> 
        Table(
          children: [
            TableRow(
            children: [
                TableCell(child: 
                TextFormField(
                     controller: apartmentNameController,
                      decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'ApartmentName',
                    ),
                  ) 
                ),
                TableCell(child: TextFormField(
                  controller: costController,
                      decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Cost',
                    ),
                  )
                ),              
                TableCell(child: TextFormField(
                  controller: totalUnitsController,
                      decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Total Units',
                  ),
                ) ),
                TableCell(child: TextFormField(
                     controller: occupiedUnitsController,
                      decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Occupied Units',
                  ),
                )),
                TableCell(child: Text("")),
                TableCell(child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[ElevatedButton(onPressed:(){
                    apartmentProvider.addApartment(Apartment(apartmentName: apartmentNameController.text, cost: int.parse(costController.text), occupiedUnits: int.parse(occupiedUnitsController.text), totalUnits: int.parse(totalUnitsController.text)));
                  }, child: Text("Save"))])),
                TableCell(child: Text("")),
            ]
          ),
          blankRow,
          TableRow(
            children: [
                TableCell(child: Text("Apartment Name")),
                TableCell(child: Text("Cost")),
                TableCell(child: Text("Total Units")),
                TableCell(child: Text("Occupied Units")),
                TableCell(child: Text("Vacant Units")),
                TableCell(child: Text("")),
                TableCell(child: Text("")),
            ]
          ),
          ...provider.apartmentList.map((apartment) => TableRow(
            children: [
              TableCell(child: Text(apartment.apartmentName)),
              TableCell(child: Text(apartment.cost.toString())),
              TableCell(child: Text(apartment.totalUnits.toString())),
              TableCell(child: Text(apartment.occupiedUnits.toString())),
              TableCell(child: Text(apartment.vacantUnits.toString())),
              TableCell(child: Text("")),
              TableCell(child: Text("")),
            ]
          )).toList()
        ],)            
      )
    ));
  }
}