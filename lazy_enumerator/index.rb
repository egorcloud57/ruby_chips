# Ленивые инумераторы используются когда мы хотим не забегая вперед ограничится опр обходом и обработкой данных.
# Например в файле из миллиона текст данных полностью его не пробегая сделать опр операцию данных удовлетворящих
# нашим условиям и успокиться)
result = (1..2_000).lazy.select { |i| p i; i.even? }.take(100).force
p result

# Найти только 10 троп длинною больше 300
require 'oj'

class ParserTrip
  @@counter = 0
  @@counter_bad = 0

  def self.trip_count?(count, str, long)
    Oj.load(File.open(str, "r")).lazy.select { |h| @@counter += 1 if h["long"] > long }.take(count).force
    p @@counter
    @@counter == count
  end

  def self.bad_trip_count?(str, long)
    Oj.load(File.open(str, "r")).select { |h| @@counter_bad += 1 if h["long"] > long }
    p @@counter_bad
  end
end

ParserTrip.trip_count?(10, './lazy_enumerator/trip.json', 300)
ParserTrip.bad_trip_count?('./lazy_enumerator/trip.json', 300)