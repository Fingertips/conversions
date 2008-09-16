require File.dirname(__FILE__) + '/test_helper'

class ExtTest < Test::Unit::TestCase
  
  def test_conversions
    assert_in_delta 1.609344, 1.miles.to(:kilometres), DELTA
    assert_in_delta 1.609344, 1.0.miles.to(:kilometres), DELTA
    assert_in_delta 0.45359237, 1.pounds.to(:kilograms), DELTA
    assert_in_delta 0.00110231131092439, 1.kilograms.to(:tons), DELTA
    assert_in_delta 2.20462262184878, 1.kilograms.to(:pounds), DELTA
    assert_in_delta 1, ( 1.kilograms.to(:pounds) * 1.pounds.to(:kilograms) ), DELTA
  end
end