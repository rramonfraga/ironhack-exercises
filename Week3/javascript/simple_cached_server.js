var net = require('net');
var port = 11312;
var hash_array = {};

var server = net.createServer(function(connection) {
    console.log('Connection to %s open', port);
    connection.write('Hello?\r\n');
    connection.on('data', function(data) {
        data = String(data).trim();
        
        if(data.indexOf("SET") >= 0) {
            array_data = data.split(' ');
            hash_array[array_data[1]] = array_data[2];
        } else if(data.indexOf("GET") >= 0) {
            array_data = data.split(' ');
            connection.write(hash_array[array_data[1]]);
        }
    });
});

server.listen(port);