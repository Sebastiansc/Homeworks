class Stack

  def initialize
    @stack = []
  end

  def remove
    @stack.pop
  end

  def add(el)
    @stack << el
  end

  def show
    @stack
  end
end
