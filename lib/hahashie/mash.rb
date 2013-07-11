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
      add_getter_method(m_name)
      return @hash[m_name]
    when '='
      add_setter_method(m_name)
      add_getter_method(m_name)
      self.send(method, *args)
    when '_'
      return Hahashie::Mash.new
    when '?'
      add_check_method(m_name)
      self.send(method)
    else
      return nil
    end

  end

  def build(hash)
    hash.each_pair do |key, value|
      @hash[key] = value.is_a?(Hash) ? Hahashie::Mash.new(value) : value
      add_getter_method(key)
      add_check_method(key)
      add_setter_method(key)
      add_access_method key
    end
  end

  def add_check_method(key)
    define_singleton_method "#{key}?" do
      @hash.keys.include?(key)
    end
  end

  def add_access_method(name)
    define_singleton_method "#{name}_" do
      @hash[name]
    end
  end

  def add_setter_method(name)
    define_singleton_method "#{name}=" do |value|
      @hash[name] = value
    end
  end

  def add_getter_method(name)
    define_singleton_method name do
      if @hash[name].is_a?(Hash)
        Hahashie::Mash.new(@hash[name])
      else
        @hash[name]
      end
    end
  end

  def to_s
    str_key_values = ""
    @hash.each_pair do |key,value|
      str_key_values << " #{key}=\"#{value}\""
    end
    "#<#{self.class.name}#{str_key_values}>"
  end
end
