import { Agent, Landlord } from "../DataModels/UserModels.mjs";
import connection from "../DBConnection.mjs";

async function userExists(ID=""){
    return new Promise((resolve,reject)=>{
    let data = null;
    connection.query(`SELECT * FROM users WHERE ID='${ID}';`,
        (err,result)=>{
            if(err) throw err;
            resolve(result);
        });
    });
}

// CREATE LANDLORD
async function createLandlord(ID="",userName="",contact="",email="",type="",photoUrl=""){
    return new Promise((resolve,reject)=>{
        connection.query(`INSERT INTO users(ID,type) VALUES('${ID}','${type}'); INSERT INTO landlords(ID,userName,contact,email,photoUrl) VALUES('${ID}','${userName}','${contact}','${email}','${photoUrl}');`,
            (err,result)=>{
                if(err){
                    console.log(err);
                    reject(err.message);
                }
                resolve(new Landlord(ID,userName,email,contact,photoUrl).toObject());
            });
    });
}

// UPDATE LANDLORD
async function updateLandlord(ID="",userName="",contact="",email="",type="",photoUrl=""){
    return new Promise((resolve,reject)=>{
        connection.query(`UPDATE landlords SET userName='${userName}',contact='${contact}',email='${email}',photoUrl='${photoUrl}' WHERE ID='${ID}';`,
            (err,result)=>{
                if(err){
                    console.log(err);
                    reject(err.message);
                }
                console.log("update landlord");
                console.log(result);
                resolve(new Landlord(ID,userName,email,contact,photoUrl).toObject());
            });
    });
}


// CREATE AGENT
async function createAgent(type="agent",userName="",ID="",contact="",email="",landlordID="",IDNumber="",earningRate=0,photoUrl=""){
    return new Promise((resolve,reject)=>{
        // userName	ID	contact	email	landlordID	IDNumber	earningRate	photoUrl	
        connection.query(`INSERT INTO users(ID,type) VALUES('${ID}','${type}'); INSERT INTO agents(userName,ID,contact,email,landlordID,IDNumber,earningRate,photoUrl) VALUES('${userName}','${ID}','${contact}','${email}','${landlordID}','${IDNumber}',${earningRate},'${photoUrl}');`,
            (err,result)=>{
                if(err){
                    console.log(err);
                    reject(err.message);
                }
                resolve(new Agent(userName,ID,contact,email,landlordID,IDNumber,earningRate,photoUrl).toObject());
            });
    });
}

// UPDATE AGENT
async function updateAgent(type="agent",userName="",ID="",contact="",email="",landlordID="",IDNumber="",earningRate=0,photoUrl=""){
    return new Promise((resolve,reject)=>{
        connection.query(`UPDATE agents SET userName='${userName}',contact='${contact}',email='${email}',landlordID='${landlordID}',IDNumber='${IDNumber}',earningRate=${earningRate},photoUrl='${photoUrl}' WHERE ID='${ID}';`,
            (err,result)=>{
                if(err){
                    console.log(err);
                    reject(err.message);
                }
                console.log("update landlord");
                console.log(result);
                resolve(new Agent(userName,ID,contact,email,landlordID,IDNumber,earningRate,photoUrl).toObject());
            });
    });
}

async function getAgents(landlordID){

    return new Promise((resolve,reject)=>{
    let data = null;
    let query;

    query = `SELECT * FROM agents WHERE landlordID='${landlordID}';`

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

async function getUser(ID="",type=""){

    return new Promise((resolve,reject)=>{
    let data = null;
    let query;

    if(type=="landlord"){
       query = `SELECT * FROM landlords WHERE ID='${ID}';`
    }else if(type=="agent"){
       query = `SELECT * FROM agents WHERE ID='${ID}';`
    }else if(type=="tenant"){
       query = `SELECT * FROM tenants WHERE ID='${ID}';`
    }

    connection.query(query,
        (err,result)=>{
            if(err) throw err;
            resolve(result);
        });
    });
}

export {createLandlord, getUser, updateLandlord, userExists, createAgent, updateAgent, getAgents};