require 'pry'

class Array
  def check_fizzbuzz proc
    array = []
    self.each { |item| array << proc.call(item) }
    array
  end
end

my_proc = Proc.new do |item|
  text = item
  
  if item % 3 == 0
    text = "Fizz"
  end
  
  if item % 5 == 0
    text = "Buzz"
  end
  
  if item % 3 == 0 && item % 5 == 0
    text = "FizzBuzz"
  end

  text
end

puts (1..100).to_a.check_fizzbuzz my_proc
