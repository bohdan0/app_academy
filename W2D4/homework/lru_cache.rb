require_relative 'linked_list'
require_relative 'queue'

class LRUCache
    def initialize(size)
      @hash = Hash.new
      @list = LinkedList.new
      @queue = Queue.new(size)
      @size = size
    end

    def count
      @queue.size
    end

    def add(value)
      if @hash[value]
        @queue.add(@hash[value])  # implement deleting duplicates in queue
      else
        if @queue.size == @size
          @hash.delete(el_for_deleting)
          @list.delete(el_for_deleting)

          @hash[value] = @list.add(value)
          @list.add(value)
          @queue.add(value)
        else
          @hash[value] = @list.add(value)
          @list.add(value)
          @queue.add(value)
        end
      end
    end

    def el_for_deleting
      @queue.oldest
    end

    def show
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

  end
