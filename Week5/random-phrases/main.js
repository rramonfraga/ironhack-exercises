var phrases = ['Connecting the dots', 
               'You will never walk alone', 
               'The cats and the cucumbers are not friends', 
               "Let's talk about ruby"];


$(document).ready(function(){
  getRandomPhrase();
  fillList();
  listToggle();
});

$("form").on("submit", function(event){
  event.preventDefault();
  addElementToArray($(this).find("input").val());
  fillList();
  clearInput();
  removeTemporaryListItem();
});

$("#newPhrase").on("keyup", function(event){
  var input = $(event.currentTarget);
  var listItem = getTemporaryListItem();
  listItem.text(input.val());
});

$("#showHide").on("click", function(){
  $("#listContainer").toggle();
});

$("#getPhrase").on("click", function(){
  getRandomPhrase();
  selectCurrentElement();
});

$("#listContainer").on("click", "a", function(event){
  var parent = $(event.currentTarget).parent();
  var index = phrases.indexOf(parent.text());
  phrases.splice(index, 1);
  fillList();
});

function addElementToArray(value){
  phrases.push(value);
}

function clearInput(){
  $("form").find("input").val("");
}

function listToggle(){
  $("#listContainer").toggle();
}

function fillList(){
  var list = $("#listContainer").find("ul");
  list.html("");

  phrases.forEach(function(element, index, array){
    list.append("<li>" + element + "<a class='deleteElement red'><img src='./images/delete.png' /></a></li>");
  });

  selectCurrentElement();
}

function selectCurrentElement(){
  var listElements = $("#listContainer").find("ul").find("li");
  listElements.each(function(index, value){
    var text = $(value).text();
    
    if(isActual(text)) {
      $(value).addClass("current");
    } else {
      $(value).removeClass("current");
    }
  });
}

function isActual(text){
  return $("#phrase").text() === text;
}

function getRandomPhrase(){
  var phrase = phrases[getRandomNumber()];
  $("#phrase").text(phrase);
}

function getRandomNumber(){
  return Math.floor((Math.random() * phrases.length));
}

function getTemporaryListItem(){
  var list = $("#listContainer").find("ul");
  
  if(list.find(".temp").length === 0) {
    list.append("<li class='temp'></li>")
  }

  return list.find(".temp");
}

function removeTemporaryListItem(){
  $("#listContainer").find("ul").find("li.temp").remove();
}