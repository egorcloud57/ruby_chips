#написать программу выявляющую палиндром и если есть возможность поменять ближайшие буквы местами и получить его то воспользоваться ей.

def palindrome(str)
  length_half = str.length/2
  first_half = str.slice(0..length_half)
  last_half = str.slice(length_half..str.length)
  if first_half == last_half.reverse
    return 'палиндром'
  elsif first_half.chars.sort == last_half.chars.sort
    return 'палиндром если изменить порядок букв'
  else
    'не палиндром'
  end
end

p palindrome('zvarvaz')