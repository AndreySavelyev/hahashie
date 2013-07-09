class Hahashie::Mash
  attr_reader :hash

  def initialize hash = nil
   @hash = hash

    if @hash 
      @hash.each_pair do |key, value|
        define_singleton_method "#{key}" do
          value
        end
      end
    end
  end

  def method_missing(method)
    return nil
  end

end