require 'byebug'
class Array

  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end

    self
  end

  def my_each_with_index(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx], idx)
      idx += 1
    end

    self
  end

  def my_select(&prc)
    result = []
    self.my_each { |el| result << el if prc.call(el) }

    result
  end

  def my_reject(&prc)
    result = []
    self.my_each { |el| result << el unless prc.call(el) }

    result
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }

    false
  end

  def my_all?(&prc)
    self.my_each { |el| return false unless prc.call(el) }

    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    result = []
    self.my_each { |el| result += el.is_a?(Array) ? el.my_flatten : [el] }

    result
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n.zero?
    result = []
    self.my_each do |el|
      if el.is_a?(Array)
        result += el.my_controlled_flatten(n - 1)
      else
        result += [el]
      end
    end

    result
  end

  def my_zip(*arrs)
    result = []
    self.my_each_with_index do |el, idx|
      temp = [el]
      arrs.my_each do |arr|
        temp << arr[idx]
      end
      result << temp
    end

    result
  end

  def my_rotate(num = 1)
    num = num % self.length
    self[num..-1] + self[0...num]
  end

  def my_join(str = "")
    result = ''
    self.each { |el| result += str + el }

    result[str.length..-1]
  end

  def my_reverse
    return self if self.length <= 1

    first = self[0]
    self[1..-1].my_reverse + [first]
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if self.length <= 1

    prc ||= proc { |x, y| x <=> y }
    first = self[0]
    left, right = [], []
    self[1..-1].my_each do |el|
      if prc.call(el, first) == -1
        left << el
      else
        right << el
      end
    end

    left.my_quick_sort(&prc) + [first] + right.my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, depth = 0, &prc)
    return nil if self.empty?
    middle_idx = self.length / 2
    prc ||= proc { |x, y| x <=> y }
    return middle_idx + depth if target == self[middle_idx]

    if prc.call(self[middle_idx], target) == -1
      self[middle_idx + 1..-1].my_bsearch(target, middle_idx + depth + 1, &prc)
    else
      self[0...middle_idx].my_bsearch(target, depth, &prc)
    end

  end

end
