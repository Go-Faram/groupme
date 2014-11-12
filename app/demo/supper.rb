require './module2'
require './module1'
class Supper
  attr_accessor :id
  include Module1
  include Module2
  def moduletest
    puts 'moduletest of supper class'
    super
  end

  def id=(param=0)
    @id = param
  end
end

su = Supper.new
su.moduletest
su.id =23
puts su.id