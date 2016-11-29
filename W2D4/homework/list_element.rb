class ListElement
  attr_accessor :value, :prev, :next

  def initialize(value, prev_el = nil)
    @value = value
    @prev = prev_el
    @next = nil
    adjust_prev(@prev) unless @prev.nil?
  end

  def delete
    @prev.next = @next if @next
    @next.prev = @prev

    self
  end

  private

  def adjust_prev(prev_el)
    prev_el.next = self
  end

end
