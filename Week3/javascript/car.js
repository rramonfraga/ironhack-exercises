function Car(model, noise) {
  this.model = model;
  this.noise = noise;
  this.wheels = 4;
}

Car.prototype.makeNoise = function(){
  console.log(this.noise);
}


var car1 = new Car("Citröen C4", "Brrrrrrummm");
var car2 = new Car("Ferrari Testarosa", "Brrrrrrrrrrrrrrrr");
var car3 = new Car("Renault 4L", "Pof pof poffff");

car1.makeNoise();
car2.makeNoise();
car3.makeNoise();
