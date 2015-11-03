require 'pry'

fruits = { :banana => Banana,
           :apple => Apple }

class Product
  attr_reader :name, :price

  def initialize name, price
    @name = name
    @price = price
  end
end

class Apple > Product
  def initialize
    super 'apple', 10
  end
end

class Banana > Product
  def initialize
    super 'banana', 20
  end
end

class ShoppingCart
  def initialize
    @products = []
  end

  def add_item_to_cart item
    binding.pry
    @products << fruits[item]
  end

  def show
    puts @products
  end
end

cart = ShoppingCart.new
cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana

cart.show