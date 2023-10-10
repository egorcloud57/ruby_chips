# 20 = 4 в квадрате плюс 2 в квадрате ? написать алгоритм
func = ->(n) do
  i = 0
  while i <= n
    j = 0
    while j <= n
      if j * j + i * i == n
        return true
      else
        false
      end
      j += 1
    end
    i += 1
  end
  return false
end

p func.(13)