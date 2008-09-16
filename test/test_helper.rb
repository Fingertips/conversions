require 'test/unit'

if not defined?(ActiveRecord)
  require 'rubygems'
  require 'active_record'
end

$:.unshift File.dirname(__FILE__) + '/../lib'
require 'conversions'

DELTA = 0.0000001
