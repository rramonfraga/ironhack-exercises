// To run the script on local, you should start a Ruby server:
// ruby -run -ehttpd . -p8000
// We will access to the page with http://localhost:8000

if ("geolocation" in navigator) {
  var button = $('#where-am-i');
  button.on('click', getLocation);
} else {
  alert("Geolocation is not available")
}

function getLocation() {
  console.log('Getting location...');
  navigator.geolocation.getCurrentPosition(onLocation, onError, options);
}

var options = {
  enableHighAccuracy: true 
};

function onLocation (position) {
  displayMap(position.coords.latitude, position.coords.longitude);
}

function onError(error) {
  console.log("Getting location failed: " + error);
}

function displayMap(lat, lon) {
  var url = "https://maps.googleapis.com/maps/api/staticmap?" +
            "markers=color:blue%7Clabel:I%7C" + 
            lat + "," + lon + "&zoom=16&size=400x300";
  $("#map").attr("src", url);
}