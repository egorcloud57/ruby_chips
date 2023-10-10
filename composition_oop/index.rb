# Композиция в отличие от наследования позволяет разбить код без иерархии на маленькие переиспользуемые фрагменты. В нашем случае велосипед владеет запчастями из которого он состоит, сама запчасть инкапсулирована от клиента (создается как OpenStruct).

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

require 'forwardable'

class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each

  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    select { |part| part.needs_spare }
  end
end

require 'ostruct'

module PartsFactory
  def self.build(config, parts_class = Parts)
    parts_class.new(
      config.map { |part_config| create_part(part_config) }
    )
  end

  def self.create_part(part_config)
    OpenStruct.new(
      name: part_config[0],
      description: part_config[1],
      needs_spare: part_config.fetch(2, true)
    )
  end
end

mountain_config = [
  ['chain', '10-speed'],
  ['tire_size', '2.1'],
  ['front_shock', 'Manitou', false],
  ['rear shock', 'FOX']
]

mountain_bike = Bicycle.new(size: 'L', parts: PartsFactory.build(mountain_config))
mountain_bike.spares
mountain_bike.parts.each { |p| puts p }