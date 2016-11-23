class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    prc ||= proc { |x, y| x <=> y }
    self.dup.bubble_sort!(&prc)
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    prc ||= proc { |x, y| x <=> y }
    (self.length - 2).downto(0) do |last_idx|
      (0..last_idx).each do |idx|
        if prc.call(self[idx], self[idx + 1]) == 1
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
        end
      end
    end

    self
  end
end

# Write a method that will transpose a rectangular matrix (array of arrays)
def transpose(matrix)
  result = []
  matrix[0].each_index do |idx|
    temp = []
    matrix.each do |row|
      temp << row[idx]
    end
    result << temp
  end

  result
end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
  return 0 if nums.empty?
  nums[0] + sum_rec(nums[1..-1])
end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)
    hash_one = Hash.new(0)
    hash_two = Hash.new(0)

    self.each_char { |el| hash_one[el] += 1 }
    other.each_char { |el| hash_two[el] += 1 }

    hash_one == hash_two
  end
end

# Write a method that returns the largest prime factor of a number
def largest_prime_factor(num)
  num.downto(2).each do |n|
    return n if num % n == 0 && prime?(n)
  end

  nil
end

# You are not required to implement this; it's here as a suggestion :-)
def prime?(num)
  (2...num).to_a.none? { |factor| num % factor == 0 }
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end

    self
  end
end

class Array
  # Write an array method that returns an array made up of the
  # elements in the array that return `true` from the given block
  def my_select(&prc)
    result = []
    self.each { |el| result << el if prc.call(el) }

    result
  end
end
