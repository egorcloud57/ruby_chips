# Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на три позиции.

arr = 10.times.map { rand(-50..50) }

p arr

func = -> (arr, position) do 
  j = 0
  while j < position
    last = arr[-1]
    i = arr.length - 1
    while i > 0
      arr[i] = arr[i - 1]
      i -= 1
    end
    arr[0] = last
    j += 1
  end
  arr
end

p func.(arr, 3)

def circle_shift(arr, position)
  for i in 0..position - 1
    last = arr[-1]
    for j in 0..arr.length - 1
      arr[-1-j] = arr[-j - 2]
    end
    arr[0] = last
  end
  arr
end

p circle_shift(arr, 3)

# Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на три позиции.

def circle_shift_2(arr, position)
  0.upto(position - 1) do |i|
    first = arr[0]
    0.upto(arr.length - 1) do |j|
      arr[j] = arr[j + 1]
    end
    arr[-1] = first
  end
  arr
end

p circle_shift_2(arr, 3)