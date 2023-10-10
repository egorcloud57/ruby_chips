require 'benchmark'

arr = ['acb', 'bcf', 'cab', 'bcd', 'cdb']

def annagram(arr)
  arr.group_by do |str|
    str.chars.sort
  end.values
end

# p annagram(arr)

def annagram_2(arr)
  arr.inject(Hash.new []) do |hash, word|
    hash[word.chars.sort] += [word]
    hash
  end.values
end

# p annagram_2(arr)

def annagram_3(arr)
  arr.each_with_object(Hash.new []) do |word, hash|
    hash[word.chars.sort] += [word]
  end.values
end

# p annagram_3(arr)

def annagram_4(arr)
  result = []
  for i in 0..arr.length - 1
    temporary = []
    for j in 0..arr.length - 1
      temporary.push(arr[j]) if arr[j].chars.sort == arr[i].chars.sort
    end
    result.push(temporary)
  end
  result.uniq
end

# p annagram_4(arr)

Benchmark.bm do |x|
  x.report("annagram") { annagram(arr) }
  x.report("annagram_2") { annagram_2(arr) }
  x.report("annagram_3") { annagram_3(arr) }
  x.report("annagram_4") { annagram_4(arr) }
end