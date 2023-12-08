const mysql = require('mysql2');

const db= mysql.createConnection({
    host: 'databasedelaguila.c2tjwfs9qgc8.sa-east-1.rds.amazonaws.com',
    user: 'admin',
    password: 'delaguila_root',
    database: 'delivery_'
});

db.connect(function(err){
    if(err) throw err;
    console.log('DATABASE CONNECTED!');
});

module.exports = db;

