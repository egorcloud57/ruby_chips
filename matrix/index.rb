require 'matrix'

a = Matrix[[1,2,3], [4,5,6], [7,8,9]]
b = Matrix[[1,2,3], [1,2,3], [7,8,9]]

c = a + b # матрицы можно складывать
p c
p c[0, 1] # первый элемент первого столбца
begin
  с[0, 1] = 10 # нельзя изменять матрицу напрямую
rescue => exception
  p exception.message
end

p c.transpose #  строки становятся столбцами, а столбцы — строками.

arr1 = [1, 2, 3]
arr2 = [4, 5, 6]

p Matrix.rows([arr1, arr2]) # Создание на основе строк. При этом массивы не копируются а ставится ссылка на них
p Matrix.columns([arr1, arr2]) # Создание на основе столбцов. При этом массивы не копируются а ставится ссылка на них
p Matrix.diagonal(0, 0, 0, 0, 0) # Создание квадратной диагональной матрицы
p Matrix.diagonal(1, 2, 3, 4, 5)

m = Matrix[
  [1,2,3], 
  [4,5,6], 
  [7,8,9], 
  [10, 11, 12]
]


p m.column_vectors # возвращают класс Vector/вектора можно делить умножать складывать вычетать
p m.row_vectors # возвращают класс Vector/вектора можно делить умножать складывать вычетать

p m.minor(0, 2, 0, 3) # обрезает матрицу строка с какую по какую и столбцы с какого по какой

mat1 = Matrix[ [1, 1, 5], [4, 1, 5], [11, 2, 12] ]
puts mat1.determinant() # сумма пересечений сверху слева вниз - сумма пересечений снизу вверх направо.

# матрицы можно делить умножать складывать вычетать