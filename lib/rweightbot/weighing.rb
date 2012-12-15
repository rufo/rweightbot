module RWeightbot
  class Weighing
    attr_accessor :date, :kilograms, :pounds

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
