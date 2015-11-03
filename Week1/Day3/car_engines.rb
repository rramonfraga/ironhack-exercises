class Engine
  def initialize noise
    @noise = noise
  end

  def make_noise
    puts @noise
  end
end

class ElectricEngine < Engine
  
end

class OldEngine < Engine
  
end

class Car
  attr_accessor :engine

  def initialize noise, engine
    @noise = noise
    @engine = engine
  end

  def make_noise
    puts @noise
    puts @engine.make_noise
  end
end

engine = Engine.new("Brrrummmmmm")
electric_engine = ElectricEngine.new("Popopopopooommm")
old_engine = OldEngine.new("Rrrrrrrrrr-plof")

c = Car.new("Brrrrrrr", engine)
c.make_noise

c.engine = electric_engine
c.make_noise

c.engine = old_engine
c.make_noise
