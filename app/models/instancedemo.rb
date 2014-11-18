class Instancedemo
  def initialize
    @v =1
  end
end

Instancedemo.class_eval do
  def test
    p @v
    p "test"
  end
end
obj = Instancedemo.new
obj.instance_eval do
  self
  @v = 2
  puts @v
end
obj.test
