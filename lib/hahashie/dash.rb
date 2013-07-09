module Hahashie
  class Dash
    attr_reader :props

    def self.property(name, options = {})
      @props ||= {}
      @props[name] ||= {value: nil}

      define_method(name) do 
        self.class.properties[name][:value]
      end

      define_method "#{name}=" do |val|
        self.class.propertie[name][:value] = val
      end

      # p "PROPS = #{@props.inspect}"
    end

    def []=(key, value)
      self.class.properties[key][:value] = value
    end

    def [](key)
      self.class.properties[key]
    end

    def self.properties
      @props
    end

    def properties #TODO скрыть нахрен
      self.class.properties
    end

    def initialize(args = {})
      if args
        args.each_pair do |key, value|
          self[key] = value
        end
      end
    end


      # define_method "#{name}=" do |val|
      #   @props[name][:value] = val
      # end

      # define_method "[]=" do |name, val|
      #   @props[name]
      #   # [:value] = val
      # end

      # define_method '[]' do |name|
      #   @props[name]
      # end


  end
end