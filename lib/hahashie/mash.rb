class Hahashie::Mash

  def initialize(hash = nil)
    @hash = {}
    build hash if hash
  end

  def method_missing(method, *args)
    if "!".eql?(method[-1])
      @hash[method[0...-1]] ||= Hahashie::Mash.new
      define_singleton_method "#{method[0...-1]}" do
        @hash[method[0...-1]]
      end
      return self
    end
    if "=".eql?(method[-1])
      define_singleton_method "#{method[0...-1]}=" do |val|
        @hash[method[0...-1]] = val
      end
      define_singleton_method "#{method[0...-1]}" do
        @hash[method[0...-1]]
      end
    end

    return nil
  end

  def build(hash)
    hash.each_pair do |key, value|
      @hash[key] = value.is_a?(Hash) ? Hahashie::Mash.new(value) : value
      define_singleton_method "#{key}" do
        if value.is_a?(Hash)
          Hahashie::Mash.new(value)
        else
          @hash[key]
        end
      end
      define_singleton_method "#{key}?" do
        hash.keys.include?(key)
      end
      define_singleton_method "#{key}=" do |val|
        @hash[key] = val
      end
    end
  end

  def to_s
    str_arr = ["<"]
    str_arr <<  "#{self.class.name}"

    @hash.each_pair do |key,value|
      str_arr << " #{key}=\"#{value}\""
    end
    str_arr << ">"

    str_arr.join
  end
end
