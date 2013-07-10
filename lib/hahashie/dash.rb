module Hahashie
  class Dash
    attr_reader :properties

    def self.property(name, options = {})
      @properties ||= {}
      @properties[name] ||= {value: nil}

      if options[:default]
        @properties[name][:default] = options[:default]
      end

      define_method(name) do
        property_name = self.class.properties[name]
        property_name[:value] ? property_name[:value] : property_name[:default]
      end

      define_method "#{name}=" do |val|
        self.class.propertie[name][:value] = val
      end
    end

    def []=(key, value)
      self.class.properties[key][:value] = value
    end

    def [](key)
      self.class.properties[key]
    end

    def self.properties
      @properties
    end

    def initialize(args = {})
      if args
        args.each_pair do |key, value|
          self[key] = value
        end
      end
    end
  end
end
