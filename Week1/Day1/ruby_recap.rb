
=begin
def is_palindrome?(word)
	word = word.downcase.tr(' ', '').tr(',', '')
	palindrome_candidate = word.reverse
	
	return word == palindrome_candidate
end

def is_palindrome_for_words?(palindrome_candidate)
	palindrome_candidate.downcase!					# Algunos métodos aceptan "!" para indicar que realice los cambios sobre ella misma
	words = palindrome_candidate.split				# Split: Por defecto busca los espacios en blanco de la palabra

	return words == words.reverse
end

str = "dad"
str2 = "Anna"
str3 = "step on no pets"
str4 = "On a clover, if alive, erupts a vast pure evil, a fire volcano"
str5 = "Fall leaves as soon as leaves fall"
=end

=begin
puts is_palindrome?(str)
puts is_palindrome?(str2)
puts is_palindrome?(str3)
puts is_palindrome?(str4)
=end

#puts is_palindrome_for_words?(str5)

=begin
def app
	puts "What's your favourite food?"
	favourite_food = gets
	puts "Your favourite food is #{favourite_food}"
end

app
=end
=begin
classmates = ["Raul", "Fernando", "Isaura"]
classmates.each do |alumn|
	puts "Hello #{alumn}!"
end
=end

=begin
require 'pry'
binding.pry
=end
