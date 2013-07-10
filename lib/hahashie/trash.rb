module Hahashie
  class Trash < Dash
    class << self
      attr_reader :props_aliases
    end

    def self.property(name, options = {})
      super(name, options)

      @props_aliases ||= {}
      @props_aliases[options[:from]] = name if options[:from]
    end

    def initialize(hash = {})
      super

      self.class.props_aliases.each_pair do |key, value|
        @props_obj[value] = hash[key] ? hash[key] : hash[value]

        define_setter key
        define_setter value
        define_getter value
      end
    end
  end
end
