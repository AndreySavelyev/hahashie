module Hahashie
  class Trash < Dash
    class << self
      attr_reader :props_aliases
      attr_reader :transforms
      attr_reader :changers
    end

    def self.property(name, options = {})
      super(name, options)

      @props_aliases ||= {}
      @changers ||= {}


      if options[:from]
        if options[:with]
          @changers[options[:from]] = { name: name, lambda: options[:with] }
        else
          @props_aliases[options[:from]] = name
        end
      end

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

      self.class.changers.each_pair do |key, options|
        name = options[:name]
        block = options[:lambda]
        @props_obj[name] = block.call ( hash[key] ? hash[key] : hash[name] ) if @props_obj[name]
        define_setter name
        define_getter name

        define_singleton_method("#{key}=") do |value|
          @props_obj[name] = block.call value
        end

      end

      self.class.transforms.each_pair do |name, block|
        @props_obj[name] =  block.call @props_obj[name] if @props_obj[name]
      end

    end
  end
end
