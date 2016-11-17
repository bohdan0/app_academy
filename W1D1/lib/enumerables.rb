class Array
  def my_each(&prc)
    i = 0
    if block_given?           # each always take block
      while i < self.length
        prc.call(self[i])
        i += 1
      end
    end

    self
  end

  def my_select
    result = []
    self.my_each do |el|
      result << el if yield el
    end

    result
  end

  def my_reject
    result = []
    self.my_each do |el|
      result << el unless yield el
    end

    result
  end

  def my_any?
    self.my_each do |el|
      return true if yield el
    end

    false
  end

  def my_all?
    self.my_each do |el|
      return false unless yield el
    end

    true
  end

  def my_flatten
    result = []
    self.my_each do |el|
      if el.is_a?(Integer)
        result << el
      else
        result += el.my_flatten
      end
    end

    result
  end

  def my_zip(*args)
    output = []
    self.each_index do |idx|
      new_segment = [self[idx]]
      args.my_each do |arg|
        new_segment.push(arg[idx])
      end
      output.push(new_segment)
    end

    output
  end

  def my_rotate(num = 1)
    num = num % self.length until num < self.length     # until is not necessary !!!
    self[num..-1] + self[0...num]
  end

  def my_join(char = "")
    result = ""
    last_idx = - 1 - char.length
    self.my_each { |el| result += (el + char) }

    result[0..last_idx]
  end

  def my_reverse
    result = []
    self.my_each { |el| result = [el] + result }

    result
  end


end
