# В зависимости от примеси super будет работать по разному
class A
  def a
    p 'a class'
  end
end

module Z
  attr_accessor :piu

  def a
    p 'a mod'
    super
  end
end

class B < A
  include Z

  def initialize
    @piu = 'piu' # в инициализаторе к сеттеру мы можем обратиться только чз self.piu или чз экземпляр @piu
  end

  def a
    p "a main #{piu}"
    super
  end
end

b = B.new
p b.piu
p b.a

MAIN = 'main'

module Original
  module Main
    Main = 'main module'
    class ChildMain
      def get_main
        p ::MAIN # Выйти из всей вложенности
      end
    end
  end
end

Original::Main::ChildMain.new.get_main