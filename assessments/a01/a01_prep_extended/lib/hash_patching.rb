class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    keys.each { |key| prc.call(key, self[key]) }

    self
  end
  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    hash_map = self
    hash2.my_each { |k, v| hash_map[k] = v }

    hash_map
  end

end
