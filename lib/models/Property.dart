class Property{
  String ID;
  String propertyName;
  String location;
  String landlordID;
  String? photoUrl;
  Property({required this.ID, required this.propertyName,required this.location,required this.landlordID, this.photoUrl});
  String toJson(){
    
    return "";
  }
}