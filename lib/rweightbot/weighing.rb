module RWeightbot
  # @!attribute [rw] date
  #   The date of the weighing. It accepts the date in "YYYY-MM-DD" format, but returns a Date object.
  #   @param [String] A date in YYYY-MM-DD format.
  #   @return [Date] The date of the weighing.
  # @!attribute [rw] kilograms
  #   The weight of the weighing, in kilograms.
  #   @param [#to_f]
  #   @return [Float]
  # @!attribute [rw] pounds
  #   The weight of the weighing, in pounds.
  #   @param [#to_f]
  #   @return [Float]
  class Weighing
    attr_accessor :date, :kilograms, :pounds

    # Initializes a new Weighing object. Note that the {Account} object will return
    # an array of these for you, so you shouldn't need to do this directly.
    # @param [Hash] options A hash of attribute names.
    # @option options [String] :date See {#date}.
    # @option options [#to_f] :kilograms See {#kilograms}.
    # @option options [#to_f] :pounds See {#pounds}.
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
