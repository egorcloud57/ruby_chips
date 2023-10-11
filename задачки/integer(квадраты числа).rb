# 20 = 4 в квадрате плюс 2 в квадрате ? написать алгоритм

def algoritm(number)
  j = 0
  arr = *(1..number) # преобразование в массив ренджа
  arr.each do |i|
    j += 1 if i.even?
    return "При i = #{i} и j = #{j} мы получили = #{number}" if number == i**2 + j**2
  end
  "для данного числа = #{number}, нельзя подобрать комбинацию"
end

p algoritm(20)