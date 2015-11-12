var simplecached = require('simplecached');

var options = {
  port: 11312,
  host: 'localhost'
};

var client = new simplecached.Client(options, function(error){
  console.log("Connected to the server");

  client.set("name", "Lluis", function(error, response){
    client.get("name", function(error, response){
      console.log(response);
    });
  });

});