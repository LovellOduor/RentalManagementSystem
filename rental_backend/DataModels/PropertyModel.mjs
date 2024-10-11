class Property{
    ID;
    propertyName;
    location;
    landlordID;
    photoUrl;
    constructor(ID,propertyName,location,landlordID,photoUrl){
        this.ID=ID;
        this.propertyName=propertyName;
        this.location=location;
        this.landlordID=landlordID;
        this.photoUrl=photoUrl;
    }

    toObject(){
        return {ID:this.ID,propertyName:this.propertyName,location:this.location,
            landlordID:this.landlordID,photoUrl:this.photoUrl};
    }
}

class Apartment{
    ID;	propertyID;	apartmentName;	totalUnits;	occupiedUnits;	cost;
    constructor(ID,propertyID,apartmentName,totalUnits,occupiedUnits,cost){
        this.ID=ID;
        this.propertyID = propertyID;
        this.apartmentName = apartmentName;
        this.totalUnits = totalUnits;
        this.occupiedUnits = occupiedUnits;
        this.cost = cost; 
    }

    toObject(){
        return {ID:this.ID,	propertyID:this.propertyID,	apartmentName:this.apartmentName,totalUnits:this.totalUnits,occupiedUnits:this.occupiedUnits,cost:this.cost};
    }
}

export {Property, Apartment};