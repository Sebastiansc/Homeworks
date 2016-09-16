class Queue

  def initialize
    @queue = []
  end

  def dequeue
    @queue.shift
  end

  def enqueue(el)
    @queue << el
  end

  def show
    @queue
  end
end
