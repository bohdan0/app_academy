require_relative 'stack_queue'
require 'byebug'
require 'benchmark'

def min(arr)
  min = arr.first
  arr.each do |curr_el|
    arr.each do |test_el|
      next if test_el > curr_el
      min = curr_el if curr_el < min
    end
  end

  min
end

def better_min(arr)
  min = arr.first
  arr.each do |test_el|
    min = test_el if test_el < min
  end
  min
end

def subsets(arr)

  subs = []
  arr.each_index do |idx1|
    arr.each_index do |idx2|
      sub_subarry = arr[idx1..idx2]
      subs << sub_subarry unless sub_subarry.empty?
    end
  end

  subs
end

def contiguous_sum(array)

  subs = subsets(array)

  max = subs.last.inject(0, :+)
  subs.each do |sub_arr|
    sub_sum = sub_arr.inject(0, :+)
    max = sub_sum if sub_sum > max
  end

  max
end

def better_contig_sum(arr)

  prev_max = arr.first
  new_seq = arr.first

  arr[1..-1].each do |el|
    # debugger
    if new_seq + el > 0
      new_sum = new_seq + el
      new_seq = new_sum
      if new_sum < prev_max && el > prev_max
        prev_max = el
      elsif new_sum > prev_max
        prev_max = new_sum
      end

    else
      new_seq = 0
      prev_max = el if prev_max < el
    end

  end
  prev_max
end

def largest_contiguous_subsum2(array)
  largest = 0
  current = 0

  array.each do |el|
    current += el
    largest = current if current > largest
    current = 0 if current < 0
  end

  largest
end

def first_anagrams(str1, str2)
  str1_anagrams = str1.chars.permutation.to_a
  str1_anagrams.include?(str2.chars)
end

def second_anagrams(str1, str2)

  delete_from_str1 = ''
  str1.length.times do |idx|
    str2_idx = str2.index(str1[idx])

    if str2_idx
      str2[str2_idx] = ''
      delete_from_str1 += str1[idx]
    end
  end

  str1.delete!(delete_from_str1)

  (str1.length + str2.length) == 0
end

def third_anagram(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram(str1, str2)
  hash_map = Hash.new(0)
  str1.each_char { |el| hash_map[el] += 1 }
  str2.each_char { |el| hash_map[el] -= 1 }

  hash_map.values.all? { |val| val.zero? }
end

def two_sum?(arr, target)
  hash_map = {}
  arr.each do |el|
    if hash_map[target - el]
      return true
    else
      hash_map[el] = true
    end
  end

  false
end

def naive_windowed(arr, w)
  final_max = 0
  idx = 0
  while idx + w - 1 < arr.length
    current_window = arr[idx..idx + w - 1]
    diff = current_window.max - current_window.min
    final_max = diff if diff > final_max
    idx += 1
  end

  final_max
end


def windowed(arr, w)

  result = nil
  idx = 0
  while idx + w - 1 < arr.length
    sq = StackQueue.new
    arr[idx..idx + w - 1].each { |el| sq.enqueue(el) }
    diff = sq.max - sq.min
    result = diff if result.nil? || diff > result
    idx += 1
  end

  result

end

Benchmark.bm do |x|
  arr = (0..1000_000).to_a.shuffle
  x.report('windowed_slow: ') { naive_windowed(arr, 5) }
  x.report('windowed_fast: ') { windowed(arr, 5) }
end
