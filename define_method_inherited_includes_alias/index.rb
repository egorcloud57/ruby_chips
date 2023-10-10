module Library
  module Trace
    class << self

      def hook(const, method)
        const.class_eval do
          alias_method("untraced_#{method}", "#{method}")
          define_method(method) do |*args|
            puts "вызван метод #{method} с параметрами (#{args.join(', ')})"
            send("untraced_#{method}", *args)
          end
        end
      end

      def included(const)
        if const.is_a?(Class)
          def const.inherited(name)
            puts "class #{name} унаследован от #{self}"
          end
        end
    
        if const.is_a?(Module)
          def const.extended(name)
            puts "class #{name} расширен с помощью #{self}"
          end
    
          def const.included(name)
            puts "class #{name} включил в себя #{self}"
          end
        end

        def const.method_added(method)
          return if @disable_method_added
          puts "Метод #{method} добавлен в класс #{self}"
          @disable_method_added = true
          Library::Trace.hook(self, method)
          @disable_method_added = false
        end

        def const.singleton_method_added(name)
          return if @disable_singleton_method_added
          return if name == :singleton_method_added
          puts "Метод класса #{name} добавлен в класс #{self}"
          @disable_singleton_method_added = true
          singleton_class = (class << self; self; end)
          Library::Trace.hook(singleton_class, name)
          @disable_singleton_method_added = false
        end

        # Данный вариант не работает ибо методыф при включении еще не определены
        # const.instance_methods(false).each do |m| # false - без методов родителей
        #   hook(const, m)
        # end

        # const.singleton_methods(false).each do |m| # false - без методов родителей
        #   hook(const, m)
        # end
      end
    end
  end
end

module ModuleA
  include Library::Trace
end

class ClassA
  extend ModuleA
  include ModuleA
end

class ClassB
  include Library::Trace

  def self.b
    'a'
  end

  def b
    'a'
  end
end

class Z < ClassB
  def self.z
    'a'
  end

  def z
    'a'
  end
end

ClassB.new.b
ClassB.b
