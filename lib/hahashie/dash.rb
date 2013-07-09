class Hahashie::Dash
  attr_reader :required_options
  attr_reader :default_options
  attr_reader :properties

  def initialize(hash = nil)

  end

  class << self
    def property(name, options = {})
      properties << name
      required_options << name if options[:required]

      if options[:default]
        default_options[name] = options[:default]
      end
    end
  end
end
