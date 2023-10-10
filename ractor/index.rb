require 'securerandom'
require 'json'
require 'time'

class Order
  def initialize
    @time = Time.new + rand(10..30)
    @uuid = SecureRandom.uuid
  end

  def to_h
    { time: @time, id: @uuid }
  end
end

module OrderJson
  class << self
    def json_reader(path)
      JSON.parse(File.read(path))
    end

    def json_writer(path, record)
      File.open(path, 'w') do |f|
        f.write(JSON.pretty_generate(record))
      end
    end
  end
end

orders = Ractor.new name: 'orders' do
  loop do
    read = OrderJson.json_reader('ractor/orders.json')
    done_orders = read.select { |order| Time.new >= Time.parse(order['time']) }
    filtered_orders = read - done_orders

    Ractor.yield(done_orders) unless done_orders.empty?

    OrderJson.json_writer('ractor/orders.json', filtered_orders << Order.new.to_h)
  end
end

done_orders = Ractor.new orders do |done_orders|
  loop do
    read = OrderJson.json_reader('ractor/done_orders.json')
    result = done_orders.take - read

    OrderJson.json_writer('ractor/done_orders.json', read += result) unless result.empty?
  end
end

l = Ractor.new name: 'left_ractor' do
  loop do
    sleep 5
    p "#{Ractor.receive} world"
  end
end

loop do
  orders
  l.send 'hello' # для отображения парраллелизма
end
