const Map userTypes = {"agent":"agent","tenant":"tenant","landlord":"landlord"};

abstract class RentalUser{
  abstract String ID;
  abstract String userName;
  abstract String email;
  abstract String contact;
  abstract String type;
  abstract String? photoUrl;
}

class Tenant extends RentalUser{
  @override 
  String ID;

  @override
  String contact;

  @override
  String email;

  @override
  String? photoUrl;

  @override
  String type = userTypes["tenant"];

  @override
  String userName;

  String landlordID;

  String IDNumber;

  String? propertyID;

  String? apartmentName;

  Tenant({required this.ID, required this.userName, required this.email, required this.contact,required this.IDNumber,required this.landlordID, this.photoUrl,this.apartmentName, this.propertyID});

}

class Landlord extends RentalUser{

  @override 
  String ID;

  @override
  String contact;

  @override
  String email;

  @override
  String? photoUrl;

  @override
  String type = userTypes["landlord"];

  @override
  String userName;


  Landlord({required this.ID, required this.userName, required this.email, required this.contact, this.photoUrl});
   
}


class Agent extends RentalUser{

  @override 
  String ID;

  @override
  String contact;

  @override
  String email;

  @override
  String? photoUrl;

  String IDNumber;

  double? earningRate = 0;

  String landlordID;

  @override
  String type = userTypes['agent'];

  @override
  String userName;

  Agent({required this.ID, required this.userName, required this.email, required this.contact,required this.IDNumber, this.earningRate, required this.landlordID, this.photoUrl});
  
}
