# Две команды, А и Б, играют в футбол.
# Некто делает свою ставку на результат матча, например счет 1:2.
# По окончании матча становится известен настоящий счет, и нам надо выдать тот или иной приз.
# Если некто угадал точный счет — он получает большой приз.
# Если некто угадал исход матча (выйгрыш той или иной команды, или же ничью) — он получает маленький приз.
# Если же он не угадал — он не получает приза


class Game
  BIG, MIN, MID = 1, 0, 2

  attr_reader :score
  attr_accessor :game_over

  def initialize(score)
    @score = score
  end

  def result
    return BIG if @score == @game_over
    return MID if res_mid or res_mid_2
    MIN
  end

  private

  def res_mid_2
    (@game_over[0] > @game_over[1] and @score[0] > @score[1]) or (@game_over[1] > @game_over[0] and @score[1] > @score[0])
  end

  def res_mid
    @game_over[0] == @game_over[1] and @score[0] == @score[1]
  end
end

game = Game.new([123, 122])
game.game_over = [22, 22]
p game.result