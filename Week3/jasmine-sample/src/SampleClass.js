function Calculator() {
}

Calculator.prototype.add = function(){
  var arguments_array = Array.prototype.slice.call(arguments);

  return arguments_array.reduce(function(total, current){
    return total + current;
  });
}

Calculator.prototype.substract = function(){
  var arguments_array = Array.prototype.slice.call(arguments);

  return arguments_array.reduce(function(total, current){
    return total - current;
  });
}

Calculator.prototype.multiply = function(){
  var arguments_array = Array.prototype.slice.call(arguments);

  return arguments_array.reduce(function(total, current){
    return total * current;
  });
}

Calculator.prototype.divide = function(){
  var arguments_array = Array.prototype.slice.call(arguments);
  
  return arguments_array.reduce(function(total, current){
    return total / current;
  });
}