module Hahashie
  class Trash < Dash
    class << self
      attr_reader :props_aliases
    end

    def self.property(name, options = {})
      super(name. options)

      @props_aliases ||= {}
      @props_aliases[name] = options[:from] if options[:from]
    end
  end
end
