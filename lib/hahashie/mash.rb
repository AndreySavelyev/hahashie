class Hahashie::Mash
  attr_reader :hash

  def initialize hash = nil
    @hash = hash
    define_methods if @hash
  end

  def method_missing(method)
    return nil
  end

  def define_methods
    @hash.each_pair do |key, value|
      define_singleton_method "#{key}" do
        value
      end
      define_singleton_method "#{key}?" do
        @hash.keys.include?(key)
      end
    end
  end

end