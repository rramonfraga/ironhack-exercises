var net = require('net');
var port = 11312;
var hash_array = {};

var server = net.createServer(function(connection) {
    console.log('Connection to %s open', port);
    connection.on('data', function(data) {
        data = String(data).trim();
        
        if(data.indexOf("set") >= 0) {
            array_data = data.split(' ');
            var key = array_data[1];
            var value = array_data[2];

            hash_array[key] = value;
            connection.write("STORED");
        } else if(data.indexOf("get") >= 0) {
            array_data = data.split(' ');
            var value = hash_array[array_data[1];

            connection.write("VALUE " + value]);
        }
    });
});

server.listen(port);