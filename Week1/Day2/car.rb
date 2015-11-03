
=begin
	Si dentro de un método de la clase hay una variable sin "@", la propiedad no es de instancia, sino de método (solo puede accederse a ella desde dentro del método que la contiene)
	Hay dos formas de llamar a un método. La clásica, instanciando un objeto y llamando a la propiedad, o así: Car.new().nombre_de_metodo

=end

class Car
	@@cities_file = "cities.txt"

	def initialize(noise="MUAHAHAHAHAHAAAAA")
		@noise = noise
		clear_cities
	end

	def make_noise
		puts @noise
	end

	def clear_cities
		File.open(@@cities_file, "w") { |f| f.write "" }
	end

	def visit_city(city)
		File.open(@@cities_file, "a") { |f| f.puts city }
	end

	def show_visited_cities
		puts "Visited cities:"
		File.open(@@cities_file, "r") { |f| f.each_line { |line| puts line } }
	end

	def self.make_noise_twice(car)
		car.make_noise
		car.make_noise
	end
end

class RacingCar < Car
	def initialize noise
		super(noise)
	end
end

=begin
car = Car.new()
car.visit_city("Madrid")
car.visit_city("Barcelona")
car.visit_city("Bilbao")
car.visit_city("Coruña")

car.show_visited_cities
=end

car = RacingCar.new("BROOOOM")
car.make_noise

