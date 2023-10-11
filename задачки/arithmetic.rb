# Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil.

arr = [2, 4, 6, 8, 10]
# arr = [2, 4, 7, 8, 10]

def arithmetic(arr)
  znamenatel = arr[-1] - arr[-2]

  arr.each_index do |i|
    break if arr[i + 1] == nil
    next if arr[i + 1] - arr[i] == znamenatel
    return 'не арифмитическая прогрессия'
  end
  "арифмитическая прогрессия с знаменателем = #{znamenatel}"
end

p arithmetic(arr)