module Hahashie
  class Trash < Dash
    class << self
      attr_reader :props_aliases
      attr_reader :transforms
    end

    def self.property(name, options = {})
      super(name, options)

      @props_aliases ||= {}
      @props_aliases[options[:from]] = name if options[:from]

      @transforms ||= {}
      @transforms[name] = options[:transform_with] if options[:transform_with]
    end

    def initialize(hash = {})
      super

      self.class.props_aliases.each_pair do |key, value|
        @props_obj[value] = hash[key] ? hash[key] : hash[value]

        define_setter key
        define_setter value
        define_getter value
      end

      self.class.transforms.each_pair do |name, block|
        @props_obj[name] =  block.call @props_obj[name] if @props_obj[name]
      end

    end
  end
end
