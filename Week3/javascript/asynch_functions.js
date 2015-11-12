function sleep(seconds, callback) {
  var miliseconds = seconds * 1000;
  console.log(seconds);

  setTimeout(function(){
    callback();
  }, miliseconds);
}

function callback_function() {
  console.log("Que me ha hecho un esguinceee!");
}

sleep(1, callback_function);