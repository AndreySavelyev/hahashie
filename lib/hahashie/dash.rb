module Hahashie
  class Dash < Hash

    def initialize(args = {})
      args.each do |key, value|
        self[key] = value
      end
       
      # изврат, лучше разнести по отдельным массивам
      self.class.props.each do |key, value|
        self[key] = value[:default] if value[:default] && self[key].nil?
       end

      # изврат, лучше разнести по отдельным массивам
      self.class.props.each do |key, value|
        raise ArgumentError if self[key].nil? && value[:required]
      end

    end


    def self.property(name, options = {})
      @props ||= {}
      @props[name] = options

      if options.key?(:default)
         @props[name][:default] = options[:default]
      end

      if options.key?(:required) && options[:required]
        @props[name][:required] = true
      end

      define_method(name) do 
        self[name]
      end

      define_method("#{name}=") do |value|
        raise ArgumentError if value.nil? && @required.key?(name)
        self[name] = value
      end

    end

    class << self
      attr_reader :props
    end
  

  end
end