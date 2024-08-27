const express = require('express');
const app = express();
const port = 3001;
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);
const DATASET = {}

on("rep-weed:register", function(name, data){
    DATASET[name] = data
    io.emit("REGISTER_DATASET", {name, data})
})

on("rep-weed:sync", function(name, index, index2, data){
    if(index2 == 'add') {
        if (!DATASET[name]) {
            DATASET[name] = {}; // Khởi tạo nếu chưa tồn tại
        }
        if (!DATASET[name][index]) {
            DATASET[name][index] = {}; // Khởi tạo nếu chưa tồn tại
        }
        DATASET[name][index] = data
    } else {
        if (!DATASET[name]) {
            console.log(`DATASET[name] không tồn tại: ${name}`);
            return; // Ngắt không cho chạy tiếp
        }
        if (!DATASET[name][index]) {
            console.log(`DATASET[name][index] không tồn tại: ${name}[${index}]`);
            return; // Ngắt không cho chạy tiếp
        }
        if (!DATASET[name][index][index2]) {
            DATASET[name][index][index2] = {}; // Khởi tạo nếu cần
        }
        DATASET[name][index][index2] = data
    }
    io.emit("SYNC_DATASET", {name, index, index2, data})
})

on("rep-weed:remove", function(name, index){
    delete DATASET[name][index]
    io.emit("REMOVE_DATASET", {name, index})
})

on("rep-weed:update", function(data){
    DATASET['Plants'] = data
    io.emit("UPDATE_DATASET", {data})
})

io.on("connection", (socket)=>{
    console.log(`${socket.id} connected`)
    socket.on('disconnect', () => {
        console.log(`${socket.id} disconnected`);
    });
    isConnected = true;
    for(var name in DATASET){
        io.emit("REGISTER_DATASET", {name, data: DATASET[name]})
    }
})

server.listen(port, () => {
    console.log(`REP HYPERDATA HOSTED http://localhost:${port}`)
})
