class Sinatra
  def initialize
    @blocks = {}
  end

  def exec(url)
    block = @blocks[url]
    block.call if block
  end

  def get(url)
    @blocks[url] = Proc.new { yield('маршрут') } # блоки и процедуры взаимопреобразуемы c помощью & перед лямбдой в параметре функции - тем самым мы преобразуем блок в обьект Proc или в аргументах если мы передаем лямбду тогда мы преобразуем ее в блок.
  end
end

deferred = Sinatra.new

deferred.get '/core' do |arg|
  puts "Корневой #{arg}"
end

deferred.exec '/core'