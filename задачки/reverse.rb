arr = 10.times.map { rand(-50..50) }

p arr

func = ->(arr) do
  i = 0
  for i in 0..arr.length/2
    tmp = arr[i]
    arr[i] = arr[-1-i]
    arr[-1-i] = tmp
  end
  arr
end

p func.call(arr)