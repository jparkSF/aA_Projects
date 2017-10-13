def first_anagram?(string, word)
  arr = string.chars.permutation.to_a.map(&:join)
  arr.include?(word)
end

def second_anagram?(string, word)
  str = string
  target = word
  string.chars.each do |x|
    if target.index(x)
      str.sub(x, '')
      target.sub(x, '')
    end
  end

  string.length == 0 && word.length == 0
end

def third_anagram?(string, word)
  string.chars.sort == word.chars.sort
end

def fourth_anagram?(string, word)
  string_hash = Hash.new(0)
  word_hash = Hash.new(0)

  string.each_char {|ch| string_hash[ch] += 1 }
  word.each_char {|ch| word_hash[ch] += 1 }

  string_hash == word_hash
end

def fourth_anagram_one_hash?(string, word)
  hash = Hash.new {|h,k| h[k] = 0}

  # source = nil
  # if string.length > word.length
  #   source = string
  # else
  #   source = word
  # end
  #
  # (0...source.size).each do |i|
  #   hash[string[i]][0] += 1
  #   hash[word[i]][1] += 1
  # end


  string.each_char {|ch| hash[ch] += 1 }
  word.each_char {|ch| hash[ch] -= 1 }

  hash.values.reduce(:+) == 0

end

require 'benchmark'

Benchmark.bm do |b|
  b.report("1st:  ") {first_anagram?("llysaaa", "sallyya")}
  b.report("2nd:  ") {second_anagram?("llysaaa"*10000, "sallyya"*9990)}
  b.report("3rd:  ") {third_anagram?("llysaaa"*10000, "sallyya"*9990)}
  b.report("4th:  ") {fourth_anagram?("llysaaa"*10000, "sallyya"*9990)}
  b.report("4th_h:") {fourth_anagram_one_hash?("llysaaa"*10000, "sallyya"*9990)}
end
