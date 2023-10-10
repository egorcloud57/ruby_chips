# Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале.

func = ->(interval, arr) do
  min = interval.find do |i|
    i == arr.min
  end
  min
end

p func.(0..10, [1,2,3,4,10,16])