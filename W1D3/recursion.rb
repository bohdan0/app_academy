def reverse(str = '')
  return '' if str.empty?
  first = str[0]
  reverse(str[1..-1]) + first
end

def range(a, b)
  return [] if a > b
  [a] + range(a + 1, b)
end

def sum_of_array(array)
  return 0 if array.empty?
  array.pop + sum_of_array(array)
end

def mult_of_array(arr)
  return 1 if arr.empty?
  arr.pop * mult_of_array(arr)
end

def exp(num, pow)
  return 1 if pow.zero?
  num * exp(num, pow - 1)
end

def exp_2(num, pow)
  return 1 if pow.zero?
  if pow.even?
    exp(num, pow / 2)**2
  else
    num * (exp(num, (pow - 1) / 2)**2)
  end

end

class Array

  def deep_dup
    result = []
    self.each do |el|
      result << (el.is_a?(Array) ? el.deep_dup : el)
    end

    result
  end
end

def fibonacci(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  prev_array = fibonacci(n - 1)
  last = prev_array[-1]
  second_last = prev_array[-2]

  prev_array << last + second_last
end

def permutation(arr)
  return arr if arr.length == 1
  result_array = []

  arr.each_with_index do |el, idx|
    left = arr[0...idx]
    right = arr[idx + 1..-1]

    permutation(left + right).each do |perm|
      result_array << ([el] + [perm]).flatten
    end

  end

  result_array
end

def binary_search(arr, target)
  middle_idx = arr.length / 2
  return middle_idx if arr[middle_idx] == target

  if target < arr[middle_idx]
    binary_search(arr[0...middle_idx], target)
  else
    middle_idx + 1 + binary_search(arr[(middle_idx + 1)..-1], target)
  end
end

def merge_sort(arr)
  return arr if arr.length == 1
  middle_idx = arr.length / 2
  left = merge_sort(arr[0...middle_idx]) unless arr[0...middle_idx].empty?
  right = merge_sort(arr[middle_idx..-1]) unless arr[middle_idx..-1].empty?

  merge(left, right)
end

def merge(arr1, arr2)
  max = [arr1.length, arr2.length].min
  idx1 = 0
  idx2 = 0
  result = []

  while idx1 < max && idx2 < max
    if arr1[idx1] < arr2[idx2]
      result << arr1[idx1]
      idx1 += 1
    else
      result << arr2[idx2]
      idx2 += 1
    end
  end

result.concat(arr1[idx1..-1]).concat(arr2[idx2..-1])
end

def subsets(arr)
  return [[]] if arr.empty?

  last = arr.pop
  pivot = subsets(arr)

  pivot + pivot.map { |el| el + [last] }
end

def make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount.zero?

  best_coins = []
  coins.each_with_index do |coin, idx|
    right = coins[idx..-1]
    current_array = []
    next if coin > amount
    current_array += [coin] + make_change(amount - coin, right)
    if best_coins.empty? || current_array.length < best_coins.length
      best_coins = current_array
    end
  end
  best_coins
end

def quick_sort(arr)
  return arr if arr.length < 2
  first = arr.shift
  left = arr.select { |el| el < first }
  right = arr.select { |el| el > first }
  quick_sort(left) + [first] + quick_sort(right)
end
