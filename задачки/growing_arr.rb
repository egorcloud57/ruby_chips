# Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают и падают.

arr = [33, 1, 4, 17, 65, 43, 27, 4, 10, 25, 50, 2]

def growing(arr)
  temporary = []
  arr.each_index do |i|
    break if arr[i + 1] == nil
    temporary.push(1) if arr[i] < arr[i + 1] && temporary.last != 1
    temporary.push(-1) if arr[i] > arr[i + 1] && temporary.last != -1
  end
  "кол-во участков где элементы растут и падают = #{temporary.length}"
end

p growing(arr)