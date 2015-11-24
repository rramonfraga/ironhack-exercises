function onSubmit(event){
  event.preventDefault();
  
  var artistSearch = {
    type: 'artist',
    q: $(".txt").val()
  }

  var request = $.get("https://api.spotify.com/v1/search", artistSearch);

  function onSuccess(response){
    console.log("Response OK");
    showArtistsInfo(response);
  }

  function onFailure(error){
    console.error(error.responseJSON);
  }

  request.done(onSuccess);
  request.fail(onFailure);
}

function searchArtistAlbums(event){
  event.preventDefault();

  var id = $(event.currentTarget).attr("data-id");
  var requestUri = "https://api.spotify.com/v1/artists/" + id + "/albums";

  var request = $.get(requestUri);

  function onSuccess(response){
    console.log("Response OK");
    showArtistAlbums(response);
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

  var request = $.get(requestUri);

  function onSuccess(response){
    console.log("Response OK");
    showAlbumTracks(response);
  }

  function onFailure(error){
    console.log(error.responseJSON);
  }

  request.done(onSuccess);
  request.fail(onFailure);
}

function showArtistsInfo(response){
  var artists = response["artists"]["items"];

  artists.forEach(function(artist){
    var html = "<article class='clearfix'><figure data-id='" + artist.id + "' class='col-md-3 col-xs-3 pull-left'>";
    html = html + "<img src='" + getArtistImage(artist.images) + "' class='col-md-12 col-xs-12'>";
    html = html + "<figcaption>" + artist.name + "</figcaption></figure>";
    html = html + "<div class='songs-list col-md-9 col-xs-9 pull-right'></div>";

    $("#artists").append(html);
  });
}

function showArtistAlbums(response){
  var albums = response["items"];

  var html = "";
  albums.forEach(function(album){
    html = html + "<div><a data-id='" + album.id + "'>" + album.name + "</a></div>";
  });

  var body = $("#albums").find(".modal-body");
  body.html("");
  body.append(html);
  $("#albums").modal("show");
}

function showAlbumTracks(response){
  var tracks = response["items"];

  var html = "";
  tracks.forEach(function(track){
    html = html + "<div><a href='" + track.preview_url + "' target='_blank'>" + track.name + "</a></div>";
  });

  var body = $("#tracks").find(".modal-body");
  body.html("");
  body.append(html);
  $("#tracks").modal("show");
}

function getArtistImage(imageArray){
  if(imageArray.length > 0) {
    return imageArray[0].url;
  } else {
    return "./images/empty-artist.jpg";
  }
}

$(".btn").on("click", onSubmit);
$("#artists").on("click", "figure", searchArtistAlbums);
$("#albums").find(".modal-body").on("click", "a", searchAlbumTracks);
