arr = 10.times.map { rand(-50..50) }

p arr

def my_reverse(arr)
  n_arr = []
  arr.each_index do |i|
    n_arr << arr[-1-i]
  end
  n_arr
end

p my_reverse(arr)

def my_reverse_2(arr)
  0.upto(arr.length/2) do |i|
    tmp = arr[i]
    arr[i] = arr[-1-i]
    arr[-1-i] = tmp
  end
  arr
end

res = my_reverse_2(arr)
p res