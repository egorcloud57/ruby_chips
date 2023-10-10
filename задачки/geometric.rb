# Дан целочисленный массив. Проверить, образуют ли элементы геометрическую прогрессию. Если да, то вывести знаменатель прогрессии, если нет - вывести nil.

arr = [3, 9, 27, 81, 243]

func = ->(arr) do 
  begin
    znamenatel = arr[-1] / arr[-2]
    len = arr.length
  rescue => e
    p e.message + "\n я добавлю парочку если ты не против"
    arr << 10 << 20
  end
  for i in 0..arr.length - 2
    if arr[i + 1] / arr[i] == znamenatel
      p true
    else
      p "это не геометрическая пргрессия"
      return nil
    end
  end
  return znamenatel
end

p func.(arr)