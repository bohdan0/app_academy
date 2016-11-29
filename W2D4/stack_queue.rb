require_relative 'my_stack'

class StackQueue
  attr_reader :max, :min

  def initialize
    @stack_in = MyStack.new
    @stack_out = MyStack.new
    @max = nil
    @min = nil
  end

  def enqueue(el)
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min

    @stack_in.push(el)
  end

  def dequeue
    queueify if @stack_out.empty?
    @stack_out.pop
  end

  def queueify
    @stack_out.push(@stack_in.pop) until @stack_in.empty?
  end

  def size
    @stack_in.size + @stack_out.size
  end

  def empty?
    @stack_in.empty? && @stack_out.empty?
  end

end
