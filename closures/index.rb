# замыкания - это способность функции запоминать контекст в том месте где она определена и затем использовать его заменяя например другой контекст.

class Beast
  attr_reader :voice

  def initialize(voice)
    @voice = voice
  end

  def delay_voice
    -> () { p voice }
  end

  def mutation_voice(beast)
    beast.delay_voice.()
  end
end

dog = Beast.new("gaf gaf")
cat = Beast.new("meow meow")

dog.mutation_voice(cat)

x = 0
seconds = -> { x += 1 }

def tester(s)
  x = 100
  p s.call
  p s.call
  p s.call
  p s.call  
end

tester(seconds)