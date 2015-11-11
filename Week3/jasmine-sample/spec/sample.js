describe("My first Jasmine Test", function(){
  beforeEach(function() {
    sample = new SampleClass();
  });

  it("should return a 1", function() {
    expect(1).toBe(1);
  });

  it("should return a 1", function() {
    expect(2).toBe(1);
  });
});