class Hahashie::Mash
    attr_reader :hash

    def initialize hash = nil
       @hash = hash

       @hash.each_pair do |key, value|
            define_singleton_method "#{key}" do
                value
            end
       end
    end


end
