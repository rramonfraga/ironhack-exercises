require 'pry'

class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
		@name = name
		@city = city
		@capacity = capacity
		@price = price
	end
end

class FakeBNB
	attr_reader(:houses)

	def initialize()
		@houses = []
	end

	def addHouse(house)
		@houses.push(house)
	end

	def printHouses(array)
		array.each { |home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night\n\n" }
	end
end

fakebnb = FakeBNB.new
fakebnb.addHouse(Home.new("Nizar's place", "San Juan", 2, 42))
fakebnb.addHouse(Home.new("Fernando's place", "Seville", 5, 47))
fakebnb.addHouse(Home.new("Josh's place", "Pittsburgh", 3, 41))
fakebnb.addHouse(Home.new("Gonzalo's place", "Málaga", 2, 45))
fakebnb.addHouse(Home.new("Ariel's place", "San Juan", 4, 49))
fakebnb.addHouse(Home.new("Virgilios's place", "Málaga", 6, 39))
fakebnb.addHouse(Home.new("Raul's place", "Menorca", 4, 38))
fakebnb.addHouse(Home.new("Lluis' place", "Menorca", 4, 41))
fakebnb.addHouse(Home.new("Rafa's place", "Madrid", 2, 51))
fakebnb.addHouse(Home.new("Roberto's place", "Seville", 4, 49))

fakebnb.printHouses(fakebnb.houses)

=begin
homes = [
	Home.new("Nizar's place", "San Juan", 2, 42),
	Home.new("Fernando's place", "Seville", 5, 47),
	Home.new("Josh's place", "Pittsburgh", 3, 41),
	Home.new("Gonzalo's place", "Málaga", 2, 45),
	Home.new("Ariel's place", "San Juan", 4, 49),
	Home.new("Virgilios's place", "Málaga", 6, 39),
	Home.new("Raul's place", "Menorca", 4, 38),
	Home.new("Lluis' place", "Menorca", 4, 41),
	Home.new("Rafa's place", "Madrid", 2, 51),
	Home.new("Roberto's place", "Seville", 4, 49)
]

homes.each { |home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night\n\n" }

puts "1. Order by price (low to high)"
puts "2. Order by price (high to low)"
puts "3. Order by capacity (low to high)"
puts "4. Order by capacity (high to low)"
print "Choose an option: "
order_by = gets.downcase.chomp

case order_by
	when "1"
		sorted = homes.sort do |home1, home2|
			home1.price <=> home2.price
		end
	when "2"
		sorted = homes.sort do |home1, home2|
			home2.price <=> home1.price
		end
	when "3"
		sorted = homes.sort do |home1, home2|
			home1.capacity <=> home2.capacity
		end
	when "4"
		sorted = homes.sort do |home1, home2|
			home2.capacity <=> home1.capacity
		end
end

sorted.each { |home| puts "#{home.name}" }

print "\nIntroduce the city you are visiting: "
filter_city = gets.chomp

filtered_by_city = homes.select do |home|
	home.city.downcase == filter_city.downcase
end

puts "\nFiltered homes by city '#{filter_city}'"
filtered_by_city.each { |home| puts "#{home.name}" }

average = filtered_by_city.reduce(0.0) {|sum, home| sum + home.price } / filtered_by_city.size
puts "Average price: $#{average}"

puts "\nWhich amount of money do you want to spend?"
max_money = gets.to_i

house_money = homes.find do |home|
	home.price == max_money
end

puts "\nHouse for $#{max_money}"
puts house_money.name

house_money_less = homes.select do |home|
	home.price <= max_money
end

puts "\nHouses for less than $#{max_money}"
house_money_less.each { |home| puts "#{home.name}" }
=end