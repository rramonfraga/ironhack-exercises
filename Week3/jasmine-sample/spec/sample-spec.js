describe("The calculator", function(){
  var calculator;
  beforeEach(function(){
    calculator = new Calculator();
  });

  it("adds two numbers", function(){
    var result = calculator.add(2,2);
    expect(result).toEqual(4);
  });

  it("adds three numbers", function(){
    var result = calculator.add(2, 3, 4);
    expect(result).toEqual(9);
  });

  it("multiplies two numbers", function(){
    var result = calculator.multiply(2, 3);
    expect(result).toEqual(6);
  });

  it("multiplies three numbers", function(){
    var result = calculator.multiply(2, 3, 4);
    expect(result).toEqual(24);
  });

  it("subsctracts two numbers", function(){
    var result = calculator.substract(2, 1);
    expect(result).toEqual(1);
  });

  it("substracts three numbers", function(){
    var result = calculator.substract(10, 4, 2);
    expect(result).toEqual(4);
  });

  it("divides two numbers", function(){
    var result = calculator.divide(20, 2);
    expect(result).toEqual(10);
  });

  it("divides three numbers", function(){
    var result = calculator.divide(20, 2, 2);
    expect(result).toEqual(5);
  });
});