import mysql from "mysql";
var connection;

try{

    connection = mysql.createConnection({
        multipleStatements:true,
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'rental'
    });
    
    connection.connect();
    
}catch(e){
    console.log(e);
}
    
export default connection;