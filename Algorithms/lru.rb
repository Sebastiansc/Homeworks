require_relative 'link-list'
require_relative 'Link'

class LRU
  def self.build_list_skeleton
    head = Link.new(:head, nil)
    tail = Link.new(:tail, nil)
    head.next = tail
    tail.prev = head
    LinkList.new(head, tail)
  end

  def initialize(size)
    @size = size
    @list = LRU.build_list_skeleton
    @map = {}
  end

  def remove
    @list.remove(@map[:head].next)
  end

  def add(key, value)
    remove if @list.length + 1 == @size
    link = Link.new(key, value)
    @list.add_link(link)
    @map[key] = link
  end

  def get(key)
    @map[key]
    remove(@map[key])
    @list.add_link(@map[key])
  end

  def show
    byebug
    p @list
  end

  def count
    @list.length
  end
end

johnny_cache = LRU.new(4)

johnny_cache.add(:str, "I walk the line")
johnny_cache.add(:k, 5)

johnny_cache.count # => returns 2

johnny_cache.add(:l, [1,2,3])
johnny_cache.add(:o, 5)
johnny_cache.add(:p, -5)
johnny_cache.add(:u, {a: 1, b: 2, c: 3})
johnny_cache.add(:q, [1,2,3,4])
johnny_cache.add(:a, "I walk the line")
johnny_cache.add(:e, :ring_of_fire)
johnny_cache.add(:v, "I walk the line")
johnny_cache.add(:b, {a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
