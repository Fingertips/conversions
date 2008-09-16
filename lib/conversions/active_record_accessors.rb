module Conversions #:nodoc:
  # Implements new accessor classmethods to define conversion accessors on active record classes.
  module ActiveRecordAccessors
    # Adds conversion methods to the model for a certain attribute.
    #
    # Options:
    #
    # * <tt>:internal</tt>: The unit of the internal value
    # * <tt>:external</tt>: The unit of desired external value
    # * <tt>:scale</tt>: If a scale is given, the external value is automatically rounded on the specified scale.
    #
    #
    # Examples:
    #
    #  class Flight
    #    attr_accessor :distance
    #    conversion_accessor :distance, :internal => :kilometers, :external => :miles, :scale => 2
    #
    #    def initialize(distance)
    #      distance = distance
    #    end
    #  end
    #
    #  flight = Flight.new(1200)
    #  flight.distance_in_miles #=> 745.65, rounded down to two decimals as specified in :scale
    def conversion_accessor(attribute, options={})
      if options[:internal].nil? or options[:external].nil?
        raise ArgumentError, "Please specify both :external and :internal metrics."
      end
      define_method "#{attribute}_in_#{options[:external]}" do
        v = send(attribute)
        v ? v.send(options[:internal]).to(options[:external], options[:scale]) : nil
      end
      define_method "#{attribute}_in_#{options[:external]}=" do |v|
        send("#{attribute}=", v.to_f.send(options[:external]).to(options[:internal]))
      end
    end
  end
end
