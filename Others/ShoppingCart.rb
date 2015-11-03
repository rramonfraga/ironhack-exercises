class Product
  attr_reader :name, :price

  def initialize name, price
    @name = name
    @price = price
  end

  def calculate_total amount
    @price * amount
  end
end

class Apple < Product
  def initialize
    super 'apple', 10
  end
end

class Banana < Product
  def initialize
    super 'banana', 20
  end
end

class Orange < Product
  def initialize
    super 'orange', 5
  end
end

class Grape < Product
  def initialize
    super 'grape', 15
  end
end

class Watermelon < Product
  def initialize
    super 'watermelon', 50
  end
end

class ShoppingCart
  def initialize items
    @items = items
    @products = []
  end

  def add_item_to_cart item
    @products << @items[item].new
  end

  def show
    total_products = count_products
    total_products.each do |cart_element|
      product = find_product_in_cart(cart_element[0])
      price = product.calculate_total(cart_element[1])
      puts "#{cart_element[1]} #{cart_element[0]}: $#{price}"
    end
  end

  def count_products
    counts = Hash.new(0)
    @products.each { |product| counts[product.name] += 1 }
    counts
  end

  def find_product_in_cart product
    @items[product.to_sym].new
  end
end

class Discount

end

fruits = { :banana => Banana,
           :apple => Apple,
           :orange => Orange,
           :watermelon => Watermelon,
           :grape => Grape }

cart = ShoppingCart.new fruits
cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :watermelon
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :watermelon

cart.show