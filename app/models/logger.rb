require 'logger'

module Logging
  attr_accessor :logger

  def logger
    return @logger if @logger # allow items to have own loggers
    @@logger ||= Logger.new(STDERR)
    puts "Instance Class REF ID#{@@logger.__id__}"
    puts "Class ID #{self.class.logger.__id__}"
    @@logger
  end

  module ClassMethods
    def logger= logger
      @logger = logger
    end

    def logger
      @logger ||= Logger.new(STDERR)
      puts "Class Instance REF ID #{@logger.__id__}"
      @logger
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end

class Test

  include Logging

  def wow
    logger.info 'wow'
  end
end

t = Test.new

# should be the same
puts "Loggers are #{t.logger.__id__ == Test.logger.__id__ ? '' : 'not '}the same"

Test.logger = Logger.new('/dev/null')

# should still be the same
puts "Loggers are #{t.logger.__id__ == Test.logger.__id__ ? '' : 'not '}the same"

lg = Test.logger.__id__
t.logger =  Logger.new(STDERR)

# class logger should be same
puts "Class Logger is #{Test.logger.__id__ == lg ? 'still the' : 'not'} same"

# class and instance logger should be different
puts "Loggers are #{t.logger.__id__ == Test.logger.__id__ ? '' : 'not '}the same"