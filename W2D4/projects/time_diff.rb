require 'benchmark'

def my_min(list)
  min = list.first
  list.each {|i| min = i if i < min }
  min
end

def my_min_1(list)
  list.sort.first
end

start_time = Time.new
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]*10000000

# Benchmark.bm do |b|
#   b.report("my_min  ") {my_min(list)}
#   b.report("my_min_1") {my_min_1(list)}
# end

list = [5, 3, -7] #=> 8
list1 = [2, 3, -6, 7, -6, 7]


def largest_subsum_1(list)
  max = nil
  list.each_index do |x|
    list.each_index do |y|
      next if y < x

      temp_arr = list[x..y]
      added = temp_arr.reduce(:+)
      max = added if max == nil || max < added
    end
  end
  max
end

def largest_subsum_2(list)
  # #[2, 3, -6, 7, -6, 7]
  # reset = list.length-1
  #
  # (0...list.length-1).each do |x|
  #   if list[x+1] - list[x] > 0
  #     reset = x
  #   end
  # end

  # if reset = list.length-1
  #   return list.reduce(:+)
  # elsif list[0...reset] > list[reset+1...list.length]
  #   return list[0...reset].reduce(:+)
  # else
  #   return list[reset+1...list.length].reduce(:+)
  # end

  max = list.first
  current_sum = 0

  list.each do |el|
    current_sum += el

    if current_sum > max
      max = current_sum
    elsif current_sum <= 0
      current_sum = 0
    end
  end

  max
end

list2 = [-5, -1, -3]

p largest_subsum_2(list)
p largest_subsum_2(list1)
p largest_subsum_2(list2)
