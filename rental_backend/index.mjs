import express from "express";
import bodyParser from "body-parser";
import { createLandlord, getUser, updateLandlord, userExists, updateAgent, getAgents, createAgent } from "./UserManagent/UserManagement.mjs";
import { createApartment, createProperty,getProperties,getApartments } from "./PropertyManagement/PropertyManagement.mjs";
import result from "./constants.mjs";
import cors from "cors";

const port = 3000;
const app = express();
app.use(cors());
// create application/json parser
var jsonParser = bodyParser.json()

// create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.get("/",(req,res)=>{
    res.send("Hello from express");
});

app.post("/createProperty",urlencodedParser,async(req,res)=>{
    
    const property = req.body;
    let response = "";

    try{
        response = {result:result.success,data:null};
        await createProperty(null,property.propertyName,property.location,property.landlordID,property?.photoUrl).then((data)=>{
            response = {result:result.success,data:data};
        }).catch(
        (errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }

    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));

});

app.post("/getProperties",urlencodedParser,async(req,res)=>{
    const landlordID = req.body.landlordID;
    let response = "";
    try{
        response = {result:result.success,data:null};
        await getProperties(landlordID).then((data)=>{
            response = {result:result.success,data:data};
        }).catch(
        (errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }

    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));
    
});

app.post("/setApartments",urlencodedParser,async(req,res)=>{
    
    const apartments = req.body.apartments;
    let response;


    console.log(apartments);
    /* 
    try{
        response = {result:result.failure,data:null};
        await createApartment(null,apartment.propertyID,apartment.apartmentName,apartment.totalUnits,
            apartment.occupiedUnits,apartment.cost).then((data)=>{
            response = {result:result.success,data:data};
        }).catch(
        (errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }
    */ 
    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));

});

app.post("/getApartments",urlencodedParser,async(req,res)=>{
    const propertyID = req.body.propertyID;
    let response = "";
    try{
        response = {result:result.success,data:null};
        await getApartments(propertyID).then((data)=>{
            response = {result:result.success,data:data};
        }).catch(
        (errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }

    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));
    
});

app.post("/createLandlord",urlencodedParser,async(req,res)=>{
    
    const landlord = req.body;
    let response = "";

    try{
        response = {result:result.success,data:null};
        await createLandlord(landlord.ID,landlord.userName,landlord.contact,landlord.email,landlord.type,landlord.photoUrl).then((data)=>{
            response = {result:result.success,data:data};
        }).catch(
        (errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }

    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));

});

app.post("/updateLandlord",urlencodedParser,async(req,res)=>{
    const landlord = req.body;
    let response = "";
    try{
        response = {result:result.success,data:null};
        await updateLandlord(landlord.ID,landlord.userName,landlord.contact,landlord.email,landlord.type,landlord.photoUrl).then((data)=>{
            response = {result:result.success,data:data};
        }).catch(
        (errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }

    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));
});


app.post("/getAgents",urlencodedParser,async(req,res)=>{
    const landlordID = req.body.landlordID;
    let response = "";
    try{
        response = {result:result.success,data:null};
        await getAgents(landlordID).then((data)=>{
            response = {result:result.success,data:data};
        }).catch((errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }
    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));
});

app.post("/createAgent",urlencodedParser,async(req,res)=>{
    const agent = req.body;
    let response = "";

    try{
        response = {result:result.success,data:null};
        await createAgent("agent",agent.userName,agent.ID,agent.contact,agent.email,agent.landlordID,agent.IDNumber,agent.earningRate,agent.photoUrl).then((data)=>{
            response = {result:result.success,data:data};
        }).catch(
        (errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }

    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));

});

app.post("/updateAgent",urlencodedParser,async(req,res)=>{
    const agent = req.body;
    let response = "";

    try{
        response = {result:result.success,data:null};
        await updateAgent("agent",agent.userName,agent.ID,agent.contact,agent.email,agent.landlordID,agent.IDNumber,agent.earningRate,agent.photoUrl).then((data)=>{
            response = {result:result.success,data:data};
        }).catch(
        (errorMessage)=>{
            response = {result:result.failure,data:errorMessage};
        });
    }catch(e){
        console.log(e);
        response = {result:result.failure,data:e};
    }

    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));
});

app.post("/getUser",urlencodedParser,async (req,res)=>{
    const user = req.body;
    let response = "";
    let data;
    try{
        data = await getUser(user.ID,user.type);
        console.log(user.ID);
        response = {result:result.success,data:data};
        console.log(data);
    }catch(e){
        console.log(e);
        res.setHeader("Content-Type","application/json");
        response = {result:result.failure,data:e};
    }
    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));
});


app.post("/userExists",urlencodedParser,async (req,res)=>{
    const landlord = req.body;
    let response = "";
    let data;
    try{
        let data = await userExists(landlord.ID);
        response = {result:result.success,data:data};
        console.log(data);
    }catch(e){
        console.log(e);
        res.setHeader("Content-Type","application/json");
        response = {result:result.failure,data:e};
    }
    res.setHeader("Content-Type","application/json");
    res.send(JSON.stringify(response));
});


app.listen(port,()=>{
    console.log(`Rental Management System backend running on port ${port}`);
});