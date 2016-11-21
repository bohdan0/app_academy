def sum_to(num)
  return nil if num < 1
  return 1 if num == 1
  sum_to(num - 1) + num
end

def add_numbers(arr)
  return arr.first if arr.length <= 1
  last = arr.last
  add_numbers(arr[0..-2]) + last
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  gamma_fnc(n - 1) * (n - 1)
end

def range(a, b)
  return [] if a > b
  range(a, b - 1) + [b]
end

def exp(num, pow)
  return 1 if pow.zero?
  exp(num, pow - 1) * num
end

def deep_dup(arr)
  result = []
  arr.each do |el|
    result << (el.is_a?(Array) ? deep_dup(el) : el)
  end

  result
end

def fibonacci(n)
  return [0, 1].take(n) if n <= 2
  previous = fibonacci(n - 1)
  previous << (previous[-2] + previous[-1])
end

def sum_of_fibonacci(n)
  return 0 if n == 1
  sum_of_fibonacci(n - 1) + fibonacci(n).last
end

def permutations(arr)
  return [arr] if arr.length <= 1
  last = arr.pop
  prev = permutations(arr)
  result = []
  prev.each do |perm|
    (0..prev.length).each do |idx|
      result << perm[0...idx] + [last] + perm[idx..-1]
    end
  end

  result
end

def binary_search(arr, target)
  return nil if arr.empty?
  middle_idx = arr.length / 2
  return middle_idx if arr[middle_idx] == target

  if arr[middle_idx] > target
    part = arr[0...middle_idx]
    depth = 0
  else
    part = arr[middle_idx + 1..-1]
    depth = middle_idx + 1
  end

  depth + binary_search(part, target)
end

def merge_sort(arr)
  return arr if arr.length <= 1

  middle_idx = arr.length / 2

  left = arr[0...middle_idx]
  right = arr[middle_idx..-1]

  left_sorted = merge_sort(left)
  right_sorted = merge_sort(right)

  merge(left_sorted, right_sorted)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first < right.first
      result << left.shift
    else
      result << right.shift
    end
  end

  result.concat(left).concat(right)
end

def subsets(arr)
  return [[]] if arr.empty?

  last = arr.pop
  prev = subsets(arr)

  prev + prev.map { |el| el + [last] }
end

def make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount.zero?
  return nil if coins.all? { |coin| coin > amount }

  best_change = nil
  coins.each_with_index do |coin, idx|
    next if amount < coin
    remainder = amount - coin
    best_remainder = make_change(remainder, coins[idx..-1])
    next if best_remainder.nil?
    this_change = [coin] + best_remainder

    if best_change.nil? || (this_change.count < best_change.count)
      best_change = this_change
    end
  end

  best_change
end
