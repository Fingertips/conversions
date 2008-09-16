require File.dirname(__FILE__) + '/test_helper'

class UnitTest < Test::Unit::TestCase
  
  def test_exchange_rate
    assert_in_delta 1.609344, Conversions::Unit.exchange_rate(:miles, :kilometres), DELTA
    assert_in_delta 0.621371192237334, Conversions::Unit.exchange_rate(:kilometres, :miles), DELTA
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(:unknown, :miles) }
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(:miles, :unknown) }
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(:nil, :miles) }
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(:miles, :nil) }
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(:nil, :nil) }
  end
  
  def test_to
    unit = Conversions::Unit.new(10.0, :miles)
    assert_in_delta 16.09344, unit.to(:kilometres), DELTA
    
    unit = Conversions::Unit.new(10.0, :miles)
    assert_equal 16.09, unit.to(:kilometres, 2), DELTA
    
    unit = Conversions::Unit.new(10.0, :kilograms)
    assert_in_delta 22.0462262184878, unit.to(:pounds), DELTA
    
    unit = Conversions::Unit.new(10.0, :kilograms)
    assert_equal 22.05, unit.to(:pounds, 2), DELTA
  end
end