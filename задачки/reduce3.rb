arr = 10.times.map { rand(-50..50) }

# Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального.
p arr

func = ->(arr) do 
  min = arr.min
  res = arr.map{ |el| el.positive? ? el : min }
  res
end

p func.(arr)
