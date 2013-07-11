module Hahashie
  class Clash
    attr_reader :hash
    attr_reader :top

    def initialize(hash = {}, top = nil)
      @hash = hash
      @top = top
    end

    def method_missing(method, *args)
      case method[-1]
      when '!'
        key = method[0...-1].to_sym
        @hash[key] = Clash.new({}, self)
        return @hash[key]
      else
        if @hash[method.to_sym].nil?
          @hash[method.to_sym] = args.first
        elsif @hash[method].is_a?(Hash)
          @hash[method].merge!(args.first)
        else @hash[method].is_a?(Clash)
          @hash[method].merge(args.first)
        end
      end
      return self
    end

    def merge(hash)
      @hash.merge!(hash)
      self
    end

    def _end!
      return @top
    end

    def [](name)
      @hash[name]
    end
  end
end
