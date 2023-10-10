arr = 10.times.map { rand(1..100) }

# Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].

func = ->(arr) do
  res = nil;
  arr.count.times do |i|
    if arr[0] < arr[i] && arr[i] < arr[-1]
      res = arr[i]
      break
    else
      res = []
    end
  end
  res
end

p func.([10,15,20,30,40])

# Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].

func2 = ->(arr) do
  res = [];
  arr.count.times do |i|
    res << arr[i] if arr[0] < arr[i] && arr[i] < arr[-1]
  end
  res.empty? ? [] : res.pop
end

p func2.([10,15,20,30,40].reverse)