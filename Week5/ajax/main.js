function onSubmit (event) {
  event.preventDefault();
  console.debug('SUBMITTED');
  var newCharacter = {
    name: $("#name").val(),
    weapon: $("#weapon").val(),
    occupation: $("#occupation").val()
  }

  request = $.post('https://ironhack-characters.herokuapp.com/characters', newCharacter);

  function onSaveSuccess (response) {
    console.debug('BOOM', response);
    fetchCharacters();
  }

  function onSaveFailure (err) {
    console.error(err.responseJSON);
  }

  request.done(onSaveSuccess);
  request.fail(onSaveFailure);
}

function fetchCharacters () {
  var request = $.get('https://ironhack-characters.herokuapp.com/characters');

  function handleCharacters (characters) {
    $(".js-character-list").find("li").remove();
    characters.forEach(function(chr){
      var html = "<li>" + chr.name + ": weapon - " + chr.weapon + ", occupation - " + chr.occupation + "</li>";
      $('.js-character-list').append(html);
    });
  }

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }

  request.done(handleCharacters);
  request.fail(handleError);
}

$(document).on("ready", function(){
  $('.js-submit').on('click', onSubmit);
  $('.js-characters').on('click', fetchCharacters);  
});

