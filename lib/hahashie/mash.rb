class Hahashie::Mash

  def initialize(hash = nil)
    @hash = {}
    build hash if hash
  end

  def method_missing(method, *args)
    m_name = method[0...-1]
    case method[-1]
      when '!'
        @hash[m_name] ||= Hahashie::Mash.new
        define_singleton_method "#{m_name}" do
          @hash[m_name]
        end
        return @hash[m_name]
      when '='
        define_singleton_method "#{m_name}=" do |val|
          @hash[m_name] = val
        end
        define_singleton_method "#{m_name}" do
          @hash[m_name]
        end
        self.send(method, *args)
      when '_'
        return Hahashie::Mash.new
      when '?'
        define_singleton_method "#{m_name}?" do
          false
        end
        self.send(method)
      else
        return nil
    end

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

      add_check_method hash, key

      define_singleton_method "#{key}=" do |val|
        @hash[key] = val
      end

      add_access_method key
    end
  end

  def add_check_method(hash, key)
    define_singleton_method "#{key}?" do
      hash.keys.include?(key)
    end
  end

  def add_access_method(name)
    define_singleton_method "#{name}_" do
      @hash[name]
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
