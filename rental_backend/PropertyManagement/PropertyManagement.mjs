import { v4 } from "uuid";
import connection from "../DBConnection.mjs";
import { Apartment, Property } from "../DataModels/PropertyModel.mjs";

// CREATE PROPERTY
async function createProperty(ID=null,propertyName=null,location=null,landlordID=null,photoUrl=null){
    return new Promise((resolve,reject)=>{
        ID = v4();
        connection.query(`INSERT INTO properties(ID,propertyName,location,landlordID,photoUrl) VALUES('${ID}','${propertyName}','${location}','${landlordID}','${photoUrl}');`,
            (err,result)=>{
                if(err){
                    console.log(err);
                    reject(err.message);
                }
                console.log(result);
                resolve(new Property(ID,propertyName,location,landlordID,photoUrl).toObject());
            });
    });
}

// CREATE PROPERTY
async function createApartment(ID=null,propertyID=null,apartmentName=null,totalUnits=null,occupiedUnits=null,cost=null){
    return new Promise((resolve,reject)=>{
        ID = v4(); 
        connection.query(`INSERT INTO apartments(ID,propertyID,apartmentName,totalUnits,occupiedUnits,cost) VALUES('${ID}','${propertyID}','${apartmentName}',${totalUnits},${occupiedUnits},${cost});`,
            (err,result)=>{
                if(err){
                    console.log(err);
                    reject(err.message);
                }
                console.log(result);
                resolve(new Apartment(ID,propertyID,apartmentName,totalUnits,occupiedUnits,cost).toObject());
            });
    });
}
async function getApartments(propertyID){

    return new Promise((resolve,reject)=>{
    let data = null;
    let query;

    query = `SELECT * FROM apartments WHERE propertyID='${propertyID}';`

    connection.query(query,
        (err,result)=>{
            if(err){
                console.log(err);
                reject(err.message);
            }
            resolve(result);
        });
    });
}
async function getProperties(landlordID){

    return new Promise((resolve,reject)=>{
    let data = null;
    let query;

    query = `SELECT * FROM properties WHERE landlordID='${landlordID}';`

    connection.query(query,
        (err,result)=>{
            if(err){
                console.log(err);
                reject(err.message);
            }
            resolve(result);
        });
    });
}

export {createProperty,createApartment,getProperties,getApartments};