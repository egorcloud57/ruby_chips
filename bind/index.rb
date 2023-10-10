# binding привязка - это способность запоминать контекст той или иной области видимости с дальнейшей передачей, очень схоже с замыканием но без анонимных лямбд.

module User
  def full_name
    p "user #{@lname} #{@name}"
  end
end

class Client
  def initialize(name, lname)
    @name = name
    @lname = lname
  end

  def full_name
    p "client #{@lname} #{@name}"
  end

  def get_binding
    binding
  end

  def call_binding(client)
    eval("full_name", client.get_binding)
  end
end

c = Client.new("Sam", "Prise")
c2 = Client.new("Anna", "Prise")

User.instance_method(:full_name).bind(c).() # способность вырезать метод и передавать в него новый контекст с дальнейшим вызовом.

c.call_binding(c2) # относительно разных запомненых областей видимости внутри вызывается свой контекст. Операция схожа с замыканием.