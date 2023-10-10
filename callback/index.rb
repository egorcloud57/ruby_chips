module AfterCb
  module ClassMethods
    private

    def after_cb(meth, &cb)
      meth.each do |sym|
        str_id = "#{sym}__hooked"

        unless private_instance_methods.include?(str_id)
          alias_method(str_id, sym)

          private str_id

          define_method(sym) do |*args|
            ret = send(str_id, *args)
            cb.call(self, :method => sym, :args => args, :return => ret)
            ret
          end
        end
      end
    end
  end

  class << self 
    def included(const)
      const.extend(ClassMethods)
    end
  end
end

class Pet
  def initialize(args = {}); end

  def voice
    'guf guf'
  end

  def receive_foot
    p 'am am'
  end

  # обязательно определяем ниже ибо интерпритатор еще не знает о существовании методов которые мы собираемся вызвать в блоке.
  include AfterCb

  after_cb([:voice]) do |obj, args| # данную реализацию можно использовать в паре с машинное состояние, наблюдатель, шина событий
    puts args
    obj.receive_foot
  end
end

Pet.new.voice