class Apartment{

   String? ID;
   String? propertyID;
   String apartmentName;
   int cost = 0;
   int totalUnits = 0;
   int occupiedUnits = 0;
   int get vacantUnits => totalUnits - occupiedUnits;

   Apartment({this.ID, this.propertyID, required this.apartmentName, required this.cost, required this.occupiedUnits, required this.totalUnits});

   Map toObject(){
    return {"ID":ID,"propertyID":propertyID,"apartmentName":apartmentName,"cost":cost,"totalUnits":totalUnits,"occupiedUnits":occupiedUnits};
   }

}