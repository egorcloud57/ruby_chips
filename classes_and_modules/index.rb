# Удалить константу в рантайме
class Beast
  def voice
    "i beast"
  end
end

p Beast.new.voice

Object.send(:remove_const, :Beast)

begin
  p Beast.new.voice
rescue => exception
  p exception.message
end

module UpBeast
  def new_voice
    "i new beast"
  end
end

class Beast
  prepend UpBeast

  def voice
    "i beast"
  end
end

p BasicObject.class.superclass.superclass.superclass
# p UpBeast.ancestors
# p Beast.ancestors
# beast = Beast.new

# p Object.superclass
# p Class.superclass.superclass
# p beast.class.superclass