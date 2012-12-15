module RWeightbot
  class Weighing
    attr_accessor :date, :kilograms, :pounds

    # Initializes a new Weighing object. Note that the Account object will return
    # an array of these for you, so you shouldn't need to do this directly.
    # @param [Hash] options The keys for the Weighing object attributes.
    # @option options [String] :date The date of the weighing, in "YYYY-MM-DD" format. This gets converted to a Date object on assignment.
    # @option options [#to_f] :kilograms The weight, in kilograms. This gets converted to a Float object on assignment.
    # @option options [#to_f] :pounds The weight, in pounds. This gets converted to a Float object on assignment.
    def initialize(options = {})
      options.each {|name, value| send("#{name}=", value)}
    end

    def date=(new_date)
      @date = Date.strptime(new_date, "%Y-%m-%d")
    end

    def kilograms=(new_kilograms)
      @kilograms = new_kilograms.to_f
    end

    def pounds=(new_pounds)
      @pounds = new_pounds.to_f
    end
  end
end
