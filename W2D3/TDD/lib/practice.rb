class Array

  def my_uniq
    new_array = []
    self.each do |element|
      new_array << element unless new_array.include?(element)
    end
    new_array
  end

  def two_sum
    sum_array = []
    hash_map = {}
    self.each_with_index do |element, index|
      sum_array.unshift([hash_map[element] ,index]) if hash_map[element]
      hash_map[-element] = index
    end
    sum_array
  end

  def my_transpose
    rows = self[0].length
    cols = self.length

    trans_array = Array.new(rows) {Array.new(cols)}

    self.each_with_index do |row,row_index|
      row.each_index do |col_index|
        trans_array[col_index][row_index] = self[row_index][col_index]
      end
    end
    trans_array
  end

  def stock_picker
    best_deal =[]
    best_value = 0
    self[0...-1].each_with_index do |element1, index1|
      self[index1+1..-1].each_with_index do |element2, index2|
        if element2 - element1 > best_value
          best_value =  element2 - element1
          best_deal = [index1,index2+index1+1]
        end
      end
    end
    best_deal
  end
end
