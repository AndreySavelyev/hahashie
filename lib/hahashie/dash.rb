module Hahashie
  class Dash
    class << self
      attr_reader :defaults, :required, :props_class
    end
    attr_reader :props_obj

    def self.property(name, options = {})
      @props_class ||= []
      @defaults ||= {}
      @required ||= {}

      @props_class << name
      @defaults[name] = options[:default]
      @required[name] = true if options[:required]
    end

    def initialize(hash = {})
      @props_obj = {}
      self.class.props_class.each do |name|
        @props_obj[name] = hash[name] ? hash[name] : self.class.defaults[name]

        define_getter name
        define_setter name

        raise ArgumentError if self.class.required.key?(name) && !@props_obj[name]
      end
    end

    def define_getter(name)
      define_singleton_method name do
        @props_obj[name]
      end
    end

    def define_setter(name)
      define_singleton_method("#{name}=") do |value|
        raise ArgumentError if value.nil? && self.class.required.key?(name)
        @props_obj[name] = value
      end
    end

    def [](name)
      raise NoMethodError unless @props_obj.has_key?(name)
      @props_obj[name]
    end
  end
end
