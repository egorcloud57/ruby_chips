# Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наиболее близок к данному числу.
arr = [121.1, 12134, 1, 1234.34, 25, 17.456, 21, 1.424242424242]
num = 2

func = lambda do |arr, num|
  arr_min = []
  arr_max = []
  for i in 0..arr.length - 1
    if arr[i] < num
      arr_min << arr[i]
    else
      arr_max << arr[i]
    end
  end
  min = arr_max.min
  max = arr_min.max
  if num - max > min - num
    min
  else
    max
  end
end

p func.call(arr, num)

# Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наименее близок к данному числу.

arr2 = [121.1, 121, -1100, 123, 25, 1709, 8000, -1.424242424242, 91000]
num2 = 7000

func2 = lambda do |arr, num|
  arr_min = []
  arr_max = []
  for i in 0..arr.length - 1
    if arr[i] < num
      arr_min << arr[i]
    else
      arr_max << arr[i]
    end
  end
  max = arr_max.max
  min = arr_min.min
  if max - num > num - min
    max
  else
    min
  end
end

p func2.call(arr2, num2)