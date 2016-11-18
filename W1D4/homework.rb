class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each_with_index do |pair, idx|
      if pair.first == key
        @map[idx] = [key, value]
        return
      end
    end

    @map << [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair if pair.first == key }
  end

  def remove(key)
    @map.delete_if { |pair| pair.first == key }
  end

  def show
    @map.dup
  end
end
