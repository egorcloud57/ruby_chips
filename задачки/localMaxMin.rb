# Дан целочисленный массив. Найти количество его локальных максимумов и минимумов.

arr = [1, 4, 210, 65, 43, 270, 40]

func = ->(arr) do 
  min = 0
  max = 0
  1.upto(arr.length - 2) do |i|
    if arr[i-1] < arr[i] && arr[i] > arr[i + 1]
      max += 1
    end
    if arr[i-1] > arr[i] && arr[i] < arr[i + 1]
      min += 1
    end
  end
  return [min: min, max: max]
end

p func.(arr)

# Дан целочисленный массив. Найти максимальный из его локальных максимумов

arr2 = [1, 4, 210, 65, 43, 270, 40]

func = ->(arr) do 
  max = []
  1.upto(arr.length - 2) do |i|
    if arr[i-1] < arr[i] && arr[i] > arr[i + 1]
      max << arr[i]
    end
  end
  return max.max
end

p func.(arr2)