#написать программу выявляющую палиндром и если есть возможность поменять ближайшие буквы местами и получить его то воспользоваться ей.

func1 = lambda do |str, &block|
  i = 1
  while i < str.length / 2 + 1
    if block.call(str[i - 1], str[-i])
      'palindrome'
    else
      if block.call(str[i], str[-i])
        tmp = str[i - 1]
        str[i - 1] = str[i]
        str[i] = tmp
      else
        return 'ne palindrome'
      end
    end
    i += 1
  end
  return "#{str} - palindrome"
end

p func1.call('zjqwiwqzj'){ |first, last| true if first == last }