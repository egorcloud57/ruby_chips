# Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil.

arr = [2, 4, 6, 8, 10]

func = ->(arr) do 
  begin
    len = arr.length
    znamenatel = arr[-1] - arr[-2]
  rescue => e
    p e.message + "\n я добавлю парочку если ты не против"
    arr << 10 << 20
  end
  for i in 0..arr.length - 2
    if arr[i + 1] - arr[i] == znamenatel
      s = ((2 * arr[i] + (len - 1) * znamenatel)/2) * len
      return s
    else
      p "это не арифмитическая пргрессия"
      return nil
    end
  end
end

p func.(arr)

