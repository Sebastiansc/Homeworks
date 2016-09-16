class Map

  def initialize
    @map = []
  end

  def show
    @map
  end

  def assign(key,value)
    has_key?(key) ? update_key(key, value) : add_key(key, value)
  end

  def lookup(key)
    @map.each{ |pair| return pair[1] if pair[0] == key}
    nil
  end

  def remove(key)
    @map.delete_if{ |pair| pair[0] == key }
  end

  private

  def has_key?(key)
    @map.any?{ |pair| pair[0] == key }
  end

  def add_key(key, value)
    @map << [key, value]
  end

  def update_key(key, value)
    @map.each do |pair|
      pair[1] = value if pair[0] == key
    end
  end

end
