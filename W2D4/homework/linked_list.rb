require_relative 'list_element'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def add(value)
    el = ListElement.new(value)
    adjust_order(el)

    el
  end

  def find(value, curr_el = @head)
    check_for_empty_list

    return curr_el if curr_el.value == value
    return nil if curr_el == @tail

    find(value, curr_el.next)
  end

  def delete(value, curr_el = @head)
    check_for_empty_list

    return curr_el.delete if curr_el.value == value
    return nil if curr_el == @tail

    delete(value, curr_el.next)
  end

  private

  def adjust_order(el)
    @head = el unless @head
    @tail = el
  end

  def check_for_empty_list
    raise 'List is empty' unless @head && @tail
  end

end
