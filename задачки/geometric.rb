# Дан целочисленный массив. Проверить, образуют ли элементы геометрическую прогрессию. Если да, то вывести знаменатель прогрессии, если нет - вывести nil.

arr = [3, 9, 27, 81, 243]
# arr = [3, 9, 26, 81, 243]

def arithmetic(arr)
  znamenatel = arr[-1] / arr[-2]
  arr.each_index do |i|
    break if arr[i + 1] == nil
    next if arr[i + 1] / arr[i] == znamenatel
    return 'не геометрическая прогрессия'
  end
  "геометрическая прогрессия с знаменателем = #{znamenatel}"
end

p arithmetic(arr)