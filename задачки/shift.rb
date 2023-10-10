# Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию.

arr = 10.times.map { rand(-50..50) }

p arr

func = ->(arr) do 
  last = arr[-1]
  i = arr.length - 1
  while i > 0
    arr[i] = arr[i - 1]
    i -= 1
  end
  arr[0] = last
  p arr
end

func.(arr)
