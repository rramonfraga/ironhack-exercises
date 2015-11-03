class Fizzbuzz
  def check number
    result = ""

    if number % 7 == 0
      result = "Nike"
    elsif number.to_s[0] == "2"
      result = "Vodafone"
    else
      result += number % 3 == 0 ? "Fizz" : ""
      result += number % 5 == 0 ? "Buzz" : ""  
    end

    result
  end
end