module Parameters
  class InstanceParam < Param

    # Owning object
    attr_reader :object

    #
    # Creates a new InstanceParam object with the specified _object_ and
    # _name_, and the given _description_.
    #
    def initialize(object,name,description=nil)
      super(name,description)

      @object = object
    end

    #
    # @return The value of the instance param.
    #
    def value
      @object.instance_variable_get("@#{@name}".to_sym)
    end

    #
    # Sets the value of the instance param.
    #
    # @param [Object] value the new value of the instance param.
    # @return [Object] The new value of the instance param.
    #
    def value=(value)
      @object.instance_variable_set("@#{@name}".to_sym,value)
    end

    #
    # @return [String] Representation of the instance param.
    #
    def to_s
      text = "  #{@name}"

      text << " [#{value.inspect}]" if value
      text << "\t\t#{@description}" if @description

      return text
    end

    #
    # @return [String] Inspection of the instance params value.
    #
    def inspect
      value.inspect
    end

  end
end
