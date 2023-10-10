# Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на три позиции.

arr = 10.times.map { rand(-50..50) }

p arr

func = ->(arr, position) do 
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
  p arr
end

func.(arr, 3)