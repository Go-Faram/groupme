# module ActAsActivable
#   def self.included(base)
#     base.send(:include, InstanceMethods)
#     base.extend ClassMethods
#     base.class_eval do
#       def  testclass
#         p self
#         p "i am #{base}"
#       end
#     end
#     # p base
#   end
#
#   def testself
#     p self
#   end
#   module InstanceMethods
#     def active?
#       is_active
#     end
#   end
#
#   module ClassMethods
#     def all_active(reload = false)
#       @all_active = nil if reload
#       @all_active ||= active.all
#     end
#   end
# end
#
# class Test
#   include ActAsActivable
# end
#
# test = Test.new
# p test.testself
# p
# p Test.methods
#
# p '..........'
# p test.methods




# module ActAsActivable
#   extend ActiveSupport::Concern
#
#   included do |base|
#     scope :active, -> {where(is_active: true)}
#   end
#
#   module ClassMethods
#     def all_active(reload = false)
#       @all_active = nil if reload
#       @all_active ||= active.all
#     end
#   end
#
#   # instance methods
#   def active?
#     is_active
#   end
# end
#
# class Test
#   include ActAsActivable
# end
#
# test = Test.new
# p Test.methods
#
# p '..........'
# p test.methods




# class Myclass
#   def greet
#     puts "hello!"
#   end
#
#   def greet_with_log
#     puts "Calling method..."
#     greet_without_log
#     puts "... Method called"
#   end
#
#   alias_method :greet_without_log, :greet
#   alias_method :greet, :greet_with_log
# end
#
# myclass = Myclass.new
# myclass.greet


require 'active_record'
ActiveRecord::Base

class Myclass
  def save; end
  def save!; end
  def new_record?; true; end

  include ActiveRecord::Validations
  attr_accessor :attr
  validates_length_of :attr, :minimum => 4
end

obj= Myclass.new
p obj.new_record?
