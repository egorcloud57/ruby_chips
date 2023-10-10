# Замечательный способ убрать жирные конструкторы
class Library
  attr_accessor :bla, :bla_bla

  def initialize(&block)
    instance_eval(&block) # передать контекст
  end

  class << self
    attr_accessor :x, :i # переменные класса
    def config # удобный паттерн настройки поведения класса Library.config do self.x = ... end
      yield self
    end
  end
end

obj = Library.new do
  self.bla = 'bla'
  self.bla_bla = 'bla bla'
end

p obj

# замечательный способ инициализации чз структуры
Customer = Struct.new('Customer', :name, :address) do |new_class|
  def greeting
    "Hello #{name} at #{address}"
  end
end

p Customer.instance_methods(false) # показать методы конкретного класса без унаследованных