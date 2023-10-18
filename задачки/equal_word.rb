# Дано слово и набор символов который может быть можно с ним сопоставить. Написать метод который позволит вернуть слово из набора символов если их можно сопоставить с этим словом.

word = 'zrdqwefrtb'
equal = 'brqfwertdz'

# можно сделать проще через O(n)**2 что бы не нагружать процессор методом подбора чз шафл

def word_equal(word, equal, callback)
  if word.chars.sort == equal.chars.sort
    while true
      temp = equal.chars.shuffle.join
      return temp if callback.(temp, word) # return позволяет вылезти из вечного цикла
    end
  else
    'нельзя сопоставить'
  end
end

p word_equal(word, equal, -> (eq, word) { eq == word })

def word_equal_2(word, equal, callback)
  if word.chars.sort == equal.chars.sort
    while true
      t = equal.chars.shuffle.join
      callback.(t, word)
    end
  else
    'нельзя сопоставить'
  end
end

def res_word(word, equal)
  word_equal_2(word, equal, Proc.new { |eq, word| return eq if eq == word }) # Прок когда return из себя и из метода в котором он вызывается теряет данные если он еще не обернут в какой нибудь другой метод.
end

p res_word(word, equal)

def word_equal_3(word, equal)
  if word.chars.sort == equal.chars.sort
    while true
      if temp = yield(equal.chars.shuffle.join, word)
        return temp
      end
    end
  else
    'нельзя сопоставить'
  end
end

# p word_equal_3(word, equal) { |eq, word| eq if eq == word }