def quicksort(arr)
  return arr if arr.size <= 1

  pivot = arr.last

  left = []
  right = []
  arr[0...-1].each do |x|
    if x < pivot
      left << x
    else
      right << x
    end
  end

  return quicksort(left) + [pivot] + quicksort(right)
end

arr = [7, 2, 9, 4, 1, 8, 5, 6, 3]
p quicksort(arr)