class Array
  def my_each(&prc)
    x = 0
    while x < self.length
      prc.call(self[x])

      x += 1
    end

    self
  end

  def my_select(&prc)
    return_array = []

    self.my_each do |num|
      # return_array << prc.call(num)
      if prc.call(num) == true
        return_array << num
      end
    end
    return_array
  end

  def my_reject(&prc)
    return_array = []

    self.my_each do |num|
      if prc.call(num) == false
        return_array << num
      end
    end

    return_array
  end

  def my_any?(&block)
    self.my_each do |num|
      return true if block.call(num)
    end

    false
  end

  def my_all?(&block)
    self.my_each do |num|
      return false if !block.call(num)
    end

    true
  end

  def my_flatten
    new_arr = []
    self.my_each do |el|

      if el.is_a? Array
        new_arr.concat(el.my_flatten)
      else
        new_arr << el
      end
    end
    new_arr
  end

  def my_zip(*arg)
    return_array = Array.new(self.length) {Array.new(self.length)}


    (0...self.length).each do |i|
      return_array[i][0] = self[i]

      (0...arg.length).each do |j|
        return_array[i][j+1] = arg[j][i]
      end
    end

    return_array

  end

  def my_rotate(n = 1)
    number = n % self.length
    self.drop(number) + self.take(number)
  end

  def my_join(str = "")
    new_str = ""
    (0...self.length).each do |i|
      if self[i] == self[-1]
        new_str += self[i]
      else
        new_str += self[i] + str
      end
    end
    new_str
  end

  def my_reverse
    new_arr = []
    until self.length == 0
      new_arr << self.pop
    end
    p new_arr
  end

end

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value
# # => 1
#      2
#      3
#      1
#      2
#      3

# p true if  return_value  # => [1, 2, 3]

# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse
