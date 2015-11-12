var simplecached = require('simplecached');

var options = {
  port: 11312,
  host: 'localhost'
};

var client = new simplecached.Client(options, function(error){
  console.log("Connected to the server");

  client.set("name", "Lluis", function(error, result){
    client.get("name", function(error, result){
      console.log(result);
    });
  });

});