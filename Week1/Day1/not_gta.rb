
def not_gta
	puts "What's your name?"
	name = gets.chomp
	
	secret_number = rand(1..100)
	attempts = 1
	lives = 7

	puts "Which is the secret number?"
	user_number = gets.to_i
	while(secret_number != user_number && lives > 0)
		if(user_number > secret_number)
			puts "The secret number is lower"
		else(user_number < secret_number)
			puts "The secret number is bigger"
		end

		attempts += 1
		lives -= 1
		user_number = gets.to_i
	end

	if(lives == 0)
		puts "Sorry, you have no more lives. The correct number was #{secret_number}"
	else 
		puts "Congratulations #{name}, the correct number is #{secret_number}!! You just needed #{attempts} attempts"
	end
end

puts not_gta