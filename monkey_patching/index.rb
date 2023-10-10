# Bad

class Array
  def my_map
    arr = []
    self.each { |e| arr << yield(e) }
    arr
  end

  def my_map!
    self.each_with_index { |e, i| self[i] = yield(self[i]) }
    self
  end

  def my_group_by
    hash = Hash.new { |hash, key| hash[key] = [] }
    self.each { |el| hash[yield(el)] << el }
    hash
  end
end

arr = [1, 2, 3, 4].my_map { |el| el**2 }
p arr

arr2 = [1, 2, 3, 4]
arr2.my_map! { |el| el**2 }
p arr2

arr3 = [2, 4, 8, 9].my_group_by(&:even?)
p arr3

# Good

module Monkey
  refine Array do
    def my_map
      arr = []
      self.each { |e| arr << yield(e) }
      arr
    end
  
    def my_map!
      self.each_with_index { |e, i| self[i] = yield(self[i]) }
      self
    end
  
    def my_group_by
      hash = Hash.new { |hash, key| hash[key] = [] }
      self.each { |el| hash[yield(el)] << el }
      hash
    end
  end
end

class MyArray
  using Monkey

  def use_my_map(arr)
    arr.my_map! { |el| el**2 }
  end
end

p MyArray.new.use_my_map([1, 2, 3])