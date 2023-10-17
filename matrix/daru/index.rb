require 'daru' # матрицы и таблицы(можно так же работать с csv, html, activerecord relation) с построением графиков

df = Daru::DataFrame.new(
  {
    "A" => [1,2,3],
    "B" => [4,5,6],
    "C" => [7,8,9]
  }, 
  index: ["A", "B", "C"]
)

p df
p df["A"]
p df[0] 
p df['A'].describe

df = Daru::DataFrame.new({'Cat Names' => %w(Kitty Leo Felix), 'Weight'   => [2,3,5]})
p df

users = Daru::DataFrame.from_csv("Free_Test_Data_200KB_CSV-1.csv")
p users

sort_users = users.where(
  users['GENDER']
  .eq('Male')
  .and(users['AGE'].gt(25))
  .and(users['COUNTRY'].eq('France'))
)

p sort_users

# sort_users.plot type: :bar, x: 'Name', y: 'Age' do |plot, diagram|
#   plot.x_label "name"
#   plot.y_label "age"
#   plot.yrange [0, 50]
#   diagram.color(Nyaplot::Colors.Pastel1)
# end