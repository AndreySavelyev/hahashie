class Hahashie::Mash

  def initialize(hash = nil)
    @hash = {}
    build hash if hash
  end

  def method_missing(method, *args)
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
