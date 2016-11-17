# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  words = str.split(" ")
  words.map { |word| increment(word, shift) }.join(" ")
end

def increment(word, shift)
  result = ''
  alphabet = ('a'..'z').to_a

  word.each_char do |el|
    curr_idx = alphabet.find_index(el)
    next_idx = curr_idx + shift
    next_idx -= 26 if next_idx > 25
    result += alphabet[next_idx]
  end

  result
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    result = []
    0.upto(self.length - 2) do |idx1|
      (idx1 + 1).upto(self.length - 1) do |idx2|
        result << [idx1, idx2] if (self[idx1] + self[idx2] == 0)
      end
    end

    result
  end


end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    result = []
    0.upto(self.length - 2) do |idx1|
      (idx1 + 1).upto(self.length - 1) do |idx2|
        result << self[idx1..idx2] if (dictionary.include?(self[idx1..idx2]))
      end
    end

    result
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  result = []
  1.upto(num) { |idx| result << idx if num % idx == 0}

  result
end
