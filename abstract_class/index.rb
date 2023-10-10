# class Abstract
#   private_class_method :new

#   class << self
#     def inherited(const)
#       const.class_eval do
#         public_class_method :new
#       end
#     end
#   end
# end

# class A < Abstract
#   def hello
#     p 'hello world'
#   end
# end

# begin
#   Abstract.new
# rescue => e
#   p e.message
#   A.new.hello
# end

class ApplicationService
  module Abstract
    def abstract!
      self.class_eval do
        private_class_method :new

        class << self
          def inherited(const)
            const.class_eval do
              public_class_method :new
            end
          end
        end
      end
    end
  end

  def self.inherited(const)
    const.extend Abstract
  end

  def call
    puts "#{self.class.name} CALLED!"
  end
end

class SomeAbstractService < ApplicationService
  abstract!
end

class UsualFromAbstractService < SomeAbstractService

end

class UsualService < ApplicationService

end

begin
  SomeAbstractService.new.call
rescue => e
  p e.message
  UsualFromAbstractService.new.call
end