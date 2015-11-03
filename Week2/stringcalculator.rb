require 'RSpec'

class StringCalculator
  def add numbers_string
    numbers_string.gsub("\n", ",").split(',').reduce(0) do |sum, x|
      sum + x.to_i
    end
  end
end

# Testing with let => Lo que se incluya dentro de let(:variable) solo se ejecuta si se llama a la :variable
RSpec.describe "String calculator" do
  let(:calculator) { StringCalculator.new }
  it "returns 10 for the sum of 0, 1, 2, 3, 4" do
    expect(calculator.add("0,1,2,3\n4")).to eq(10)
  end

  it "returns 6 for the sum of 0, 1, 2, 3" do
    expect(calculator.add("0,1,2,3")).to eq(6)
  end

  it "returns 3 for the sum of 0,1,2" do
    expect(calculator.add("0,1,2")).to eq(3)
  end

  it "return 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end
end

# Testing with each => Lo que se incluye dentro del before se hace antes de cada test
RSpec.describe "String calculator" do
  before :each do
    @calculator = StringCalculator.new
  end

  it "returns 10 for the sum of 0, 1, 2, 3, 4" do
    expect(@calculator.add("0,1,2,3\n4")).to eq(10)
  end

  it "returns 6 for the sum of 0, 1, 2, 3" do
    expect(@calculator.add("0,1,2,3")).to eq(6)
  end

  it "returns 3 for the sum of 0,1,2" do
    expect(@calculator.add("0,1,2")).to eq(3)
  end

  it "return 0 for an empty string" do
    expect(@calculator.add("")).to eq(0)
  end
end