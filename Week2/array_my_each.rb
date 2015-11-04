require 'pry'

class Array
  def my_each
    i = 0
    
    while i < self.size
      yield(self[i])
      i+=1
    end

    self
  end

  def my_each_with_index
    i = 0

    while i < self.size
      yield(self[i], i)
      i+=1
    end

    self
  end

  def my_select
    i = 0
    new_array = []

    while(i < self.size)
      if yield(self[i])
        new_array << self[i]
      end
      i+=1
    end

    new_array
  end

  def my_select2
    return self unless block_given?
    new_array = []
    my_each { |i| new_array << i if yield(i) }
    new_array
  end

  def my_map my_proc
    new_array = []
    my_each { |i| new_array << my_proc.call(i) }
    new_array
  end
end

# puts [1,2,3].map { |item| item + 1 }
proc = Proc.new { |item| item * 2 }
puts [1,2,3].my_map proc
puts (1..15).to_a.my_map proc


#puts [1,2,3].my_select2 { |item| item == 2 }

# [1,2,3].my_select do |param| 
#   param > 1
# end

# [1,2,3].select do |param|
#   param == 2
# end

# [1,2,3].my_each do |param|
#   puts param
# end

# [1,2,3].my_each_with_index do |param, index|
#   puts "Param: #{param} - Index: #{index}"
# end