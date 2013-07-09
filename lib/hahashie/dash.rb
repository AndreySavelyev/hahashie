class Hahashie::Dash

  def initialize(hash = nil)
  end

  def self.property(name, options = {})
    raise self.properties.inspect
  end

  class << self
    attr_reader :properties
  end

end
