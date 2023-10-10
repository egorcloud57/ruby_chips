# Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают и падают.

arr = [33, 1, 4, 17, 65, 43, 27, 4, 10, 25, 50, 2]

func = ->(arr) do 
  grow = [0]
  0.upto(arr.length - 2) do |i|
    if arr[i + 1] > arr[i]
      next if grow[-1] == 1
      grow << 1 
    else
      next if grow[-1] == -1
      grow << -1
    end
  end
  growing = 0
  depression = 0
  grow.each { |el| growing += 1 if el == 1; depression += 1 if el == -1; }
  [growing: growing, depression: depression]
end

p func.(arr)