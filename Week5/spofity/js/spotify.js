function doRequest(requestUri, functionOnSuccess){
  var request = $.get(requestUri);

  function onSuccess(response){
    functionOnSuccess(response);
  }

  function onFailure(error){
    console.error(error.responseJSON);
  }

  request.done(onSuccess);
  request.fail(onFailure);
}

function searchArtists(event){
  event.preventDefault();
  
  var inputSearch = $(".txt").val();
  var requestUri = "https://api.spotify.com/v1/search?q=" + inputSearch + "&type=artist";

  doRequest(requestUri, showArtistsInfo);
}

function searchArtistAlbums(event){
  event.preventDefault();

  var id = $(event.currentTarget).attr("data-id");
  var requestUri = "https://api.spotify.com/v1/artists/" + id + "/albums";

  var request = $.get(requestUri);

  function onSuccess(response){
    showArtistAlbums(response);
    searchRelatedArtists(id);
  }

  function onFailure(error){
    console.error(error.responseJSON);
  }

  request.done(onSuccess);
  request.fail(onFailure);
}

function searchAlbumTracks(event){
  event.preventDefault();

  var albumId = $(event.currentTarget).attr("data-id");
  var requestUri = "https://api.spotify.com/v1/albums/" + albumId + "/tracks";

  doRequest(requestUri, showAlbumTracks);
}

function searchRelatedArtists(artistId){
  event.preventDefault();
  
  var requestUri = "https://api.spotify.com/v1/artists/" + artistId + "/related-artists";

  doRequest(requestUri, showRelatedArtists);
}

function showArtistsInfo(response){
  var artists = response["artists"]["items"];

  $("#artists article").remove();

  artists.forEach(function(artist){
    var html = "<article class='clearfix pull-left col-md-3 col-xs-3'><figure data-id='" + artist.id + "' class='col-md-12 col-xs-12 pull-left'>";
    html = html + "<img src='" + getArtistImage(artist.images) + "' class='col-md-12 col-xs-12'>";
    html = html + "<figcaption>" + artist.name + "</figcaption></figure>";
    html = html + "<div class='songs-list col-md-9 col-xs-9 pull-right'></div>";

    $("#artists").append(html);
  });
}

function showArtistAlbums(response){
  var albums = response["items"];

  var modalbody = $("#albums").find(".modal-body");
  modalbody.html("");

  var html = "";
  albums.forEach(function(album){
    html = html + "<div><a data-id='" + album.id + "'>" + album.name + "</a></div>";
  });
  
  modalbody.append(html);
  $("#albums").modal("show");
}

function showRelatedArtists(response){
  var relatedArtists = response["artists"];
  
  if(relatedArtists.length > 5) {
    relatedArtists = relatedArtists.slice(0, 5);
  }

  var html = "<h3>Related artists</h3>";
  relatedArtists.forEach(function(artist){
    html = html + "<div>" + artist.name + "</div>";
  });

  $("#albums div:last").append(html);
}

function showAlbumTracks(response){
  var tracks = response["items"];

  var modalbody = $("#tracks").find(".modal-body");
  modalbody.html("");

  var html = "";
  tracks.forEach(function(track){
    html = html + "<div><a href='" + track.preview_url + "' target='_blank'>" + track.name + "</a></div>";
  });
  
  modalbody.append(html);
  $("#tracks").modal("show");
}

function getArtistImage(imageArray){
  if(imageArray.length > 0) {
    return imageArray[0].url;
  } else {
    return "./images/empty-artist.jpg";
  }
}

$(".btn").on("click", searchArtists);
$("#artists").on("click", "figure", searchArtistAlbums);
$("#albums").find(".modal-body").on("click", "a", searchAlbumTracks);
