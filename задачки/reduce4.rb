# a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1

arr = 20.times.map { rand(1..100) }

# Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.

sort_even = ->(arr) do 
  arr.sort_by { |i| i % 2 }
end

new_arr = sort_even.(arr)
p new_arr

# Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами а затем с четными.
# 0 - в sort by это true,все остальное false
sort_not_even = ->(arr) do 
  arr.sort_by do |i|
    i.odd? ? 0 : 1
  end
end

new_arr = sort_not_even.(arr)
p new_arr
