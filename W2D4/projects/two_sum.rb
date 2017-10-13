def bad_two_sum?(arr, target_sum)

  arr.each_index do |x|
    arr.each_index do |y|
      next if x == y || y < x
      return true if arr[x] + arr[y] == target_sum
    end
  end
  false
end

arr = [-1, 0, 2, 5, 7]


def okay_two_sum?(arr, target_sum)

  sorted = arr.sort

  until sorted.length == 1
    #p sorted
    if sorted.first + sorted.last > target_sum
      sorted.pop
    elsif sorted.first + sorted.last < target_sum
      sorted.shift
    elsif sorted.first + sorted.last == target_sum
      #p sorted.first + sorted.last
      return true
    end
  end
  false
end

def two_sum?(arr, target_sum)

end

# p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
