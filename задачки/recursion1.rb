# Есть массив хешей, выбрать только те хеши в значениях которых есть часть строки "Муз"
str = "Муз"

arr = [
  { one: 'one', two: ['two', 'Музыка'] },
  { one: 'Музыкант', two: ['two', 'Мурка'] },
  { one: 'one', two: ['two', 'Мурзилка', ['дама', ['Муа']]] },
  { one: 'one', two: [['басня', 'радио'], 'Мускат'] },
  { one: 'one', two: ['two', ['dsds', ['sds', 'dsds', ['dssd', ['Муза']]]]] }
]

def find_str(arr, str)
  return arr =~ /#{str}/ if arr.instance_of? String # или arr.include?(str)
  arr.find { |el| find_str(el, str) } if arr.instance_of? Array
end

res = arr.find_all do |h|
  h.values.find { |v| find_str(v, str) }
end

p res