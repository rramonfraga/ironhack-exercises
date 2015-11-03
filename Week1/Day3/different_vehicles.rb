require 'pry'

class Bycicle
  attr_reader :wheels, :noise

  def initialize
    @wheels = 2
    @noise = "Ring, ring!!"
  end
end

class Car
  attr_reader :wheels, :noise

  def initialize
    @wheels = 4
    @noise = "Brruummmm"
  end
end

class Motorbike
  attr_reader :wheels, :noise

  def initialize
    @wheels = 2
    @noise = "Brrrrrrrr"
  end
end

class Skateboard
  attr_reader :wheels, :noise

  def initialize
    @wheels = 4
    @noise = "(skateboard noise)"
  end
end

class CountWheels
  def self.total array
    total = array.reduce(0) do |sum, x| 
      sum + x.wheels
    end

    puts "Total number of wheels: #{total}"
  end
end

class PrintNoises
  def self.noises array
    puts "\nNoises of the vehicles: "
    array.each { |vehicle| puts vehicle.noise }
  end
end

b = Bycicle.new
c = Car.new
m = Motorbike.new
s = Skateboard.new

vehicles = [b, c, m, s]

CountWheels.total vehicles
PrintNoises.noises vehicles
