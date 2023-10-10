require 'forwardable'

class Item
  SIZE = { big: 1, small: 2 }

  attr_reader :price, :size, :name

  def initialize(item = {})
    @price, @name, @size = item[:price], item[:name], SIZE[item[:size]]
  end
end

class Inventory
  def initialize(hand)
    @inventory = hand[:inventory] || []
  end
end

item_one = Item.new({price: 300, name: "Клинок Армавгедона", size: :big})
item_two = Item.new({price: 500, name: "Амулет Сандро", size: :small})

inventory = Inventory.new({inventory: [item_one, item_two]})

begin
  inventory.push(Item.new({price: 300, name: "Клинок Армавгедона", size: :big}))
  inventory.size
  inventory.each { |i| p i }
rescue NoMethodError => exception
  p exception

  inventory.class.class_exec do
    extend Forwardable

    def_delegators :@inventory, :each
    # или так
    %i[push size].each do |method_name|
      define_method(method_name) do |*args, &block|
        @inventory.send(method_name, *args)
      end
    end
  end
end

inventory.push(Item.new({price: 300, name: "Клинок Армавгедона", size: :big}))
p inventory.size
inventory.each { |i| p i }

begin
  p inventory.length
rescue NoMethodError => exception
  inventory.class.class_exec do
    alias :length :size
  end
end

p inventory.length