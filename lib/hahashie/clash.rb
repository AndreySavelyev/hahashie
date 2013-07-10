module Hahashie
  class Clash
    attr_reader :hash
    attr_reader :tmp_hash
    attr_reader :tmp_level

    def initialize(hash = {})
      @hash = hash
      @tmp_hash = {}
    end

    def method_missing(method, *args)
      m_name = method[0...-1]
      case method[-1]
      when '!'
        if "_".eql?(m_name[0])
          self.send(@tmp_level, [@tmp_hash])
          @tmp_level = nil
          @tmp_hash = {}
        else
          @tmp_level = m_name
        end
      else
        if @tmp_level
          @tmp_hash[method] = args.first
        else
          @hash[method] = args.first
        end
      end
      p "m_name = #{m_name}; method = #{method}; args = #{args}; self = #{self}"
      return self
    end

    def [](name)
      @hash[name]
    end

    def to_s
      @hash.to_s
    end
  end
end
