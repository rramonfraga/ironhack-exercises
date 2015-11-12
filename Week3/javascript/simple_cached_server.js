var net = require('net');
var port = 11312;
var hash_array = {};

var server = net.createServer(function(connection) {
    console.log('Connection to %s open', port);

    connection.on('data', function(data) {
        data = String(data).trim();
        
        if(data.indexOf("set") >= 0) {
            array_data = data.split(' ');
            hash_array[array_data[1]] = array_data[2];
            connection.write("STORED");
        } else if(data.indexOf("get") >= 0) {
            array_data = data.split(' ');
            connection.write("VALUE " + hash_array[array_data[1]]);
        }
    });
});

server.listen(port);