#spread - распаковать
#rest - собрать

def rest1(numbers, a:, b:, **other) # сопоставить с образцом хеша по ключам и плевать что будет после указанных ключей. если помимо хеша мы ожидаем что то еще то надо указать это перед сопоставлением как в аргументах так и  в параметрах. Важен так же порядок ключей. 
  p a
  p b
  p other
  p numbers
end

rest1(10, **{a: 'a', b: 'b', z: ['one']})

def rest2(*arr) # обьединить в массив
  p arr
end

rest2('one', 1, 'two', 2)

def rest3(...) # все равно какие аргументы
  p ... # можно их передать куда то дальше
end

rest3('one', 1, 'two', 2)

def rest4(*b, **c) # **с сопоставляется с хешем, *b будет проигнарировано если там ничего нет или наоборт **с если там ничего нет
  p c
end

rest4(d: 40, e: 50)
rest4(40, 50)

################################# SPREAD

def fake_password
  lowercase_letters = ('a'..'z').to_a
  capital_letters = ('A'..'Z').to_a
  numbers = (0..9).to_a
  special_characters = %w{ $ # * }

  password_matrix = [*lowercase_letters, *capital_letters, *numbers, *special_characters] # пример spread оператора

  password_matrix
    .shuffle
    .sample(20)
    .shuffle
    .join
end

p fake_password

hash = {"a"=>1, "z"=>4, "c"=>3}
arr = *hash #деструктурировать хеш в массив
p arr
p Hash[arr] #деструктурировать массив в хеш