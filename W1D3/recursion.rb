def range(start_, end_)
  return [] if end_ <= start_

  end_ -= 1
  range(start_, end_) + [end_]
end

# p range(1,5)


def exp(b, n)
  return nil if n < 0
  return 1 if n == 0
  b * exp(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  even_result = exp2(b, n / 2)
  odd_result = exp(b, (n - 1) / 2)
  return even_result * even_result if n % 2 == 0 # even
  b * odd_result * odd_result # odd
end
#
#
# robot_parts = [["nuts", "bolts", "washers"], ["capacitors", "resistors", "inductors"]]
# p robot_parts.object_id
# p robot_parts[1].object_id
#
# robot_parts_copy = robot_parts.dup
# p robot_parts_copy.object_id
# p [robot_parts[1].object_id, robot_parts_copy[1].object_id]
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]


# class Array
#   def deep_dup
#     if self.is_a?(Array) && self.all? { |e| !e.is_a?(Array) }
#       return self.dup
#     end
#     front = self.shift
#     if front.is_a?(Fixnum)
#       [front] + self.deep_dup
#     else
#       front.deep_dup + self.deep_dup
#     end
#   end
# end
#
#
# arr = [1, [2], [3, 4]]
# p arr.last.object_id
#
#
# tmp = arr.deep_dup
# p tmp
# p tmp.last.object_id
#
# # class Array
# # end


class Array
  def deep_dup
    arr = []
    self.each do |el|
      if el.is_a?(Array)
        arr.push(el.dup)
      else
        arr.push(el)
      end
    end
    arr
  end
end

tmp = [1,[2],[3, 4]]
# p tmp.last.object_id
# p tmp.deep_dup.last.object_id

def fib_i(n)
  fin_fib = [0,1]
  until n == fin_fib.length
    fin_fib.push(fin_fib[-2] + fin_fib[-1])
  end
  fin_fib
end

# p fib_i(10)


def fib(n)
  return [0, 1] if n <= 2
  tmp = fib(n-1)
  tmp + [tmp[-1] + tmp[-2]]
end

# p fib(10)


#
# def subsets(arr)
#   return [] if arr.empty?
#   arr.
# end
#
# class Array
#   def subsets
#     return [[]] if self.empty?
#     # curr = self.dup
#     tmp = self.pop
#     p tmp.class
#     p [tmp]
#      [[tmp]] + self.subsets.map { |el| el + [tmp] }
#   end
# end

class Array
  def subsets
    return [[]] if self.empty?
    el = self.pop
    subs = self.subsets
    subs + subs.map do |arr|
      arr + [el]
    end
  end
end

# p [1,2,3].subsets
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def factorial(n)
  return 1 if n == 0
  n * factorial(n - 1)
end

def permutation(array)
  # return [[]] if array.empty?
  return [array] if array.length == 1
  pop = array.pop
  result = []
  permutation(array).each do |arr|
    (0..arr.length).each do |idx|
      arr_copy = arr.dup
      result << arr_copy.insert(idx,pop)
    end
  end
  result
end
#
#
#
# p permutation([1,2,3])

def bsearch(arr, target)
  arr_mid = arr.length / 2

  return nil if arr.length == 1 && arr[0] != target
  return arr_mid if arr[arr_mid] == target
  if arr[arr_mid] < target
    # p "going right #{arr[arr_mid+1..-1]}"
    res = bsearch(arr[arr_mid+1..-1], target)
    if !res.nil?
      res += arr_mid + 1
    end
  else
    # p "going left #{arr[0...arr_mid]}"
    res = bsearch(arr[0...arr_mid], target)
  end
  return res
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# p bsearch([1, 3, 4, 5, 9], 5) # => 3
#
# [1, 3, 4, 5, 9]
# arr_mid = 2
# arr[arr_mid] == 4
#
# bsearch([5,9], 5)
#
# arr_mid = 0
# arr[arr_mid] == 5
# return 0
