class Queue
  attr_reader :queue

  def initialize(size)
    @max_size = size
    @queue = Array.new
  end

  def add(el)
    delete if size == @max_size
    @queue << el
  end

  def delete
    @queue.shift
  end

  def size
    @queue.count
  end

  def oldest
    @queue.first
  end

end
