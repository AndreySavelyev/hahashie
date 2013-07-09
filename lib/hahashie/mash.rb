class Hahashie::Mash
  attr_reader :hash

  def initialize(hash = nil)
    @hash = hash
    define_methods if @hash
  end

  def method_missing(method)
    return nil
  end

  def define_methods
    @hash.each_pair do |key, value|
      define_singleton_method "#{key}" do
          if value.is_a?(Hash)
              Hahashie::Mash.new(value)
          else
              value
          end
      end
      define_singleton_method "#{key}?" do
        @hash.keys.include?(key)
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
