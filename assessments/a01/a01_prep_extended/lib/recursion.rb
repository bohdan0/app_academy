require "byebug"

class RecursionMachine

  # Implement a method that finds the sum of the first n
  # fibonacci numbers recursively. Assume n > 0
  def fibs_sum(n)
    return 1 if n == 1
    fibs_sum(n - 1) + fibonacci(n)
  end

  def fibonacci(n)
    return 1 if n <= 2
    fibonacci(n - 2) + fibonacci(n - 1)
  end

  #returns all subsets of an array
  def subsets(array)
    return [[]] if array.empty?
    last = array.pop
    left = subsets(array)
    left + left.map { |el| el + [last] }
  end


  # return the sum of the first n even numbers recursively. Assume n > 0
  def first_even_numbers_sum(n)
    return 2 if n == 1
    first_even_numbers_sum(n - 1) + n * 2
  end

  # return b^n recursively. Your solution should accept negative values
  # for n
  def exponent(b, n)
    return 1 if n.zero?
    n > 0 ? b * exponent(b, n - 1) : 1.0 / b * exponent(b, n + 1)
  end

  # make better change problem from class
  def make_better_change(value, coins)
    return [] if value.zero?
    return nil if coins.all? { |coin| coin > value }

    best_change = nil
    coins.each_with_index do |coin, idx|
      next if coin > value
      remainder = value - coin
      best_remainder = make_better_change(remainder, coins[idx..-1])
      next if best_remainder.nil?

      curr_change = [coin] + best_remainder

      if best_change.nil? || (curr_change.size < best_change.size)
        best_change = curr_change
      end
    end

    best_change
  end

  #deep dup question from class
  def deep_dup(arr)
    result = []
    arr.each do |el|
      if el.is_a?(Array)
        result << deep_dup(el)
      else
        result << el
      end
    end

    result
  end

  # Write a recursive method that takes in a string to search and a key string.
  # Return true if the string contains all of the characters in the key
  # in the same order that they appear in the key.
  #
  # string_include_key?("cadbpc", "abc") => true
  # string_include_key("cba", "abc") => false
  def string_include_key?(string, key)
    return true if key.length == 0
    key_to_check = key[0]
    key_index = string.index(key_to_check)
    return false if key_index.nil?
    string_include_key?(string[key_index + 1..-1], key[1..-1])
  end

  # Write a recursive function that returns the prime factorization of
  # a given number. Assume num > 1
  #
  # prime_factorization(12) => [2,2,3]
  def prime_factorization(num)
    # return [num] if is_prime?(num)
    # result = []
    # factors = (2...num).select { |factor| num % factor == 0 && is_prime?(factor) }
    # factors.each do |factor|
    #   result << prime_factorization(num / factor)
    # end
    #
    # result
  end

  def is_prime?(num)
    return false if num < 2
    return true if num == 2
    (2...num).each { |factor| return false if num % factor == 0 }

    true
  end

  # Write a method, `digital_root(num)`. It should Sum the digits of a positive
  # integer. If it is greater than 10, sum the digits of the resulting number.
  # Keep repeating until there is only one digit in the result, called the
  # "digital root". **Do not use string conversion within your method.**
  #
  # You may wish to use a helper function, `digital_root_step(num)` which performs
  # one step of the process.

  def digital_root(num)
    return num if num < 10
    last = num % 10
    num /= 10
    digital_root(digital_root(num) + last)
    # digital_root(step) until step < 10
  end

  # Write a recursive method that takes in a base 10 number n and
  # converts it to a base b number. Return the new number as a string
  #
  # E.g. base_converter(5, 2) == "101"
  # base_converter(31, 16) == "1f"

  def base_converter(num, b)

  end

  # CHALLENGE: Eight queens puzzle precursor
  #
  # Write a recursive method that generates all 8! possible unique ways to
  # place eight queens on a chess board such that no two queens are in
  # the same board row or column (the same diagonal is OK).
  #
  # Each of the 8! elements in the return array should be an array of positions:
  # E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
  #
  # My solution used 3 method parameters: current_row, taken_columns, and
  # positions so far
  def eight_queens_possibilities(current_row, taken_columns, positions)

  end

end
