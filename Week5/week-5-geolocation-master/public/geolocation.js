var map;

if ("geolocation" in navigator){
  navigator.geolocation.getCurrentPosition(onLocation, onError);
}

function onLocation(position){
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };

  var markerObject = {
    coords: myPosition,
    formattedAddress: "Current location"
  };

  createMap(markerObject);
  setAutocomplete();

  drawPath();
}

function onError(err){
  console.log("What are you using, IE 7??", err);
}

function createMap(markerInfo){
  map = new google.maps.Map($('#map')[0], {
    center: markerInfo.coords,
    zoom: 17
  });

  createMarker(markerInfo);

  var storedMarkers = getMarkersPositions();
  if(storedMarkers != null) {
    storedMarkers.forEach(function(position){
      createMarker(position);
    });
  }
}

function createMarker(markerInfo){
  var marker = new google.maps.Marker({
    position: markerInfo.coords,
    map: map
  });

  var address = markerInfo.formattedAddress;
  marker.addListener('click', function(){
    getInfoWindow(address).open(map, marker);
  });
}

function setAutocomplete(){
  var input = $("#get-places")[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function(){
    var place = autocomplete.getPlace();
    if(place.geometry.location){
      map.setCenter(place.geometry.location);
      map.setZoom(17);

      var latitude = place.geometry.location.lat();
      var longitude = place.geometry.location.lng();
      var position = {lat: latitude, lng: longitude};

      var markerObject = {
        coords: position,
        formattedAddress: place.formatted_address
      };

      createMarker(markerObject);
      storeMarkerPosition(markerObject);
    } else {
      alert("The place has no location...?");
    }
  });
}

function getInfoWindow(address){
  return new google.maps.InfoWindow({
    content: address
  });
}

function drawPath(){
  var markerArray = [];
  var markers = getMarkersPositions();
  markerArray = markers.slice(0,3);

  // Instantiate a direction service.
  var directionsService = new google.maps.DirectionsService;

  // Create a render for directions and bind it to the map.
  var directionsDisplay = new google.maps.DirectionsRenderer({ map: map });

  // Instantiate an info window to hold step text.
  var stepDisplay = new google.maps.InfoWindow;

  // Display the route between the initial start and end lists.
  calculateAndDisplayRoute(directionsDisplay, directionsService, markerArray, stepDisplay, map);
}

function calculateAndDisplayRoute(directionsDisplay, directionsService, markerArray, stepDisplay, map){
  // Retrieve the start and end locations and create a DirectionsRequest using WALKING directions.
  directionsService.route({
    origin: markerArray[0].coords,
    destination: markerArray[markerArray.length - 1].coords,
    waypoints: returnWaypoint(markerArray[1]),
    travelMode: google.maps.TravelMode.WALKING
  }, function(response, status){
    // Route the directions and pass the response to a function to create markers for each step
    if(status === google.maps.DirectionsStatus.OK){
      console.log(response.routes[0].warnings);
      directionsDisplay.setDirections(response);
    } else {
      console.error("Directions request failed due to " + status);
    }
  });
}

function returnWaypoint(markerInfo){
  var waypoints = [];
  waypoints.push(
    {
      location: new google.maps.LatLng(markerInfo.coords.lat, markerInfo.coords.lng) 
    }
  );
  return waypoints;
}


var localStorageKey = "mapMarkers";
function storeMarkerPosition(position){
  var markers = getMarkersPositions();
  if(markers == null) {
    markers = [];
  }

  markers.push(position);
  window.localStorage.setItem(localStorageKey, JSON.stringify(markers));
}

function getMarkersPositions(){
  return JSON.parse(window.localStorage.getItem(localStorageKey));
}