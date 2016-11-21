require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift
    self.each { |el| accumulator = prc.call(accumulator, el) }

    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return true if num == 2
  return false if num < 2
  (2...num).each { |factor| return false if num % factor == 0 }

  true
end

def primes(num)
  result = []
  ctr = 2
  until result.length == num
    result << ctr if is_prime?(ctr)
    ctr += 1
  end

  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  prev = factorials_rec(num - 1)
  prev << prev.last * (num - 1)
  prev
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash_map = Hash.new([])
    self.each_with_index { |el, idx| hash_map[el] += [idx] }

    hash_map.select { |_, v| v.length > 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    (0..self.length - 2).each do |idx1|
      (idx1 + 1..self.length - 1).each do |idx2|
        sub_str = self[idx1..idx2]
        result << sub_str if sub_str == sub_str.reverse
      end
    end

    result
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.count <= 1

    prc ||= proc { |x,y| x <=> y }
    middle_idx = self.count / 2

    left = self[0...middle_idx]
    right = self[middle_idx..-1]

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  # private
  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        result << left.shift
      else
        result << right.shift
      end
    end

    result + left + right
  end
end
