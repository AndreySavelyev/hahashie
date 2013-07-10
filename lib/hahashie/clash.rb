module Hahashie
  class Clash
    attr_reader :hash
    attr_reader :top

    def initialize(hash = {}, top = nil)
      @top = top
      @hash = hash
    end

    def method_missing(method, *args)
      case method[-1]
      when '!'
        key = method[0...-1].to_sym
        @hash[key] = Clash.new({}, self)
        return @hash[key]
      else
        @hash[method.to_sym] = args.first
      end
      return self
    end

    def _end!
      return @top
    end

    def [](name)
      @hash[name]
    end

    def to_s
      @hash.to_s
    end
  end
end
