//console.log("Hello world");

/*
function eat(food) {
  if(food.toLowerCase() === "pizza") {
    console.log("Yay Pizza");
  } else if(food.toLowerCase() === "cookies") {
    console.log("Cookies are good too");
  } else {
    console.log("Ok, enjoy eating " + food);
  }
}

eat("Pizza")
eat("Cookies")
eat("Brussel Sprouts")
*/
/*
function averageColon(numbers) {
  array_number = numbers.split(":").map(function(number) {
    return parseInt(number);
  });
  
  min = array_number[0];
  max = 0;
  sum = array_number.reduce(function(pre, number) {
    if(number > max) {
      max = number;
    }

    if(min == -1 || number < min) {
      min = number;
    }

    return pre + number;
  });
  
  console.log("Average: " + (sum / array_number.length));
  console.log("Max number: " + max);
  console.log("Min number: " + min);
}

var numbers = "80:70:90:100:110:60";
averageColon(numbers);
*/

function ticketBuilder(transport) {
  var passengerNumber = 0;
  return function(name) {
    passengerNumber++;
    console.log("Welcome, " + name + ". Here is your ticket for the " + transport + ". You are passenger #" + passengerNumber);
  }
}

/*
var getPlaneTicket = ticketBuilder("plane");
var getTrainTicket = ticketBuilder("train");

getPlaneTicket("John Smith");
getTrainTicket("Sheldon Cooper");
*/

ticket = {
  "plane": ticketBuilder("plane"),
  "train": ticketBuilder("train"),
  "boat": ticketBuilder("boat")
};

ticket.train("Sheldon Cooper");
ticket.train("Leonard Hofstader");
ticket.train("Howard Wollowitz");
ticket.train("Raj Koothrapaly");
ticket.plane("John Smith");
ticket.boat("Jeremy Loya");
