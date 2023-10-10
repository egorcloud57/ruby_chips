arr = 10.times.map { rand(1..100) }

# Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять.
p arr

func = ->(arr) do 
  new_arr = arr.map do |el|
    if el != arr[0] && el != arr[-1]
      el.even? ? el + arr[0] : el
    else
      el
    end
  end
  new_arr
end

p func.(arr)

