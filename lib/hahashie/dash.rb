module Hahashie
  class Dash
    def initialize(args = {})
      @props_obj = self.class.properties

      @props_obj.each_pair do |key, value|
        @props_obj[key][:value] = args[key]
        define_singleton_method(key) do
          if @props_obj[key][:value]
            @props_obj[key][:value]
          else
            @props_obj[key][:default]
          end
        end

        define_singleton_method "#{key}=" do |val|
          self.class.assert_required_set_key!(key)
          @props_obj[key][:value] = val
        end
      end
    end

    def self.assert_required_set_key!(key)
      if self.properties[key][:required]
        raise ArgumentError, "The property '#{key}' is required for this Dash."
      end
    end

    def self.properties
      @properties
    end

    def self.property(name, options = {})
      @properties ||= {}
      @properties[name] ||= {default: options[:default], required: options[:required]}
    end
  end
end
