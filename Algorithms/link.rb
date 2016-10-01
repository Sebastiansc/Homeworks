class Link
  attr_accessor :next, :prev
  def initialize(key ,val)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
end
