class Landlord{
    ID;
    userName;
    email;
    contact;
    type = 'landlord';
    photoUrl;

    constructor(ID,userName,email,contact,photoUrl){
        this.ID = ID;
        this.userName = userName;
        this.email = email;
        this.contact = contact;
        this.photoUrl = photoUrl;
    }

    toObject(){
        return {ID:this.ID,userName:this.userName,email:this.email,type:this.type,contact:this.contact,photoUrl:this.photoUrl};
    }

}

class Agent{
    type="agent";
    userName="";
    ID="";
    contact="";
    email="";
    landlordID="";
    IDNumber="";
    earningRate=0;
    photoUrl="";

    constructor(userName,ID,contact,email,landlordID,IDNumber,earningRate,photoUrl){
        this.userName=userName;
        this.ID=ID;
        this.contact=contact;
        this.email=email;
        this.landlordID=landlordID;
        this.IDNumber=IDNumber;
        this.earningRate=earningRate;
        this.photoUrl=photoUrl;
    }

    toObject(){
        return {
            userName:this.userName,
            ID:this.ID,
            contact:this.contact,
            email:this.email,
            landlordID:this.landlordID,
            IDNumber:this.IDNumber,
            earningRate:this.earningRate,
            photoUrl:this.photoUrl
        };
    }

}


/*TODO*/
class Tenant{
    
}

export {Landlord,Agent};