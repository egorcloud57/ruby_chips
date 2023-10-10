class Beast
  private def arr
    ' arr'
  end

  protected def arr_2
    ' arr 2'
  end
end

class Cat < Beast
  def arr_3(cat)
    p arr + cat.arr # нельзя
  end

  def arr_4(cat)
    p arr + cat.arr_2 # можно
  end
end

Cat.new.arr_4(Cat.new)
Cat.new.arr_3(Cat.new)