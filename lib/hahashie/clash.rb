module Hahashie
  class Clash
    attr_reader :hash

    def initialize(hash = {})
      @hash = hash
    end

    def method_missing(method, *args)
      m_name = method[0...-1]
      case method[-1]
      when '!'

      else
        @hash[method] = args.first
        return self
      end
    end

    def [](name)
      @hash[name]
    end

    def to_s
      @hash.to_s
    end
  end
end
