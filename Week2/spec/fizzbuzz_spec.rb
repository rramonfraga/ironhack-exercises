require 'rspec'
require_relative '../fizzbuzz.rb'

RSpec.describe "Fizzbuzz test" do 
  it "return n for n" do
    expect(Fizzbuzz.new.check(1)).to eq(1)
  end
  
  it "returns 'fizz' if n / 3 == 0" do
    expect(Fizzbuzz.new.check(3)).to eq("Fizz")
  end

  it "returns 'buzz' if n / 5 == 0" do
    expect(Fizzbuzz.new.check(5)).to eq("Buzz")
  end

  it "returns 'fizzbuzz' if n / 3 == 0 && n / 5 == 0" do
    expect(Fizzbuzz.new.check(15)).to eq("FizzBuzz")
  end

  it "return 'nike' if n is divisible by 7" do
    expect(Fizzbuzz.new.check(7)).to eq("Nike")
  end

  it "return 'vodafone' if n starts with 2" do
    expect(Fizzbuzz.new.check(20)).to eq("Vodafone")
  end
end