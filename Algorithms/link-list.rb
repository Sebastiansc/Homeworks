require 'byebug'
require_relative 'link'

class LinkList
  attr_reader :list
  def initialize(head, tail)
    @head = head
    @tail = tail
    @list = [@head, @tail]
  end

  def add_link(link)
    link.prev = @tail.prev
    @tail.prev = link
    link.next = @tail
  end

  def remove(link)
    link.prev.next = link.next
    link.next.prev = link.prev
  end

  def length
    @list.length
  end
end
