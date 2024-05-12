const express = require('express');
const path = require('path');
const app = express();



app.get("/login",(req , res) =>{
    res.sendFile(path.join(__dirname+'/login.html'));
})
app.get("/register",(req , res) =>{
    res.sendFile(path.join(__dirname+'/registration.html'));
})
app.get("/voter",(req , res) =>{
    res.sendFile(path.join(__dirname+'/voter.html'));
})
app.get("/addelecteur",(req , res) =>{
    res.sendFile(path.join(__dirname+'/addelecteur.html'));
})
app.get("/getelecteurs",(req , res) =>{
    res.sendFile(path.join(__dirname+'/geteleteurs.html'));
})
const server = app.listen(5000);
const portNumber = server.address().port;
console.log("port: " ,portNumber);