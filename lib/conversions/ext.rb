module Conversions #:nodoc:
  # Defines all the conversion methods (miles, kilometers, etc…)
  module Ext
    Unit.conversion.each do |method, _|
      define_method method do
        Unit.new self, method
      end unless respond_to? method
    end
  end
end