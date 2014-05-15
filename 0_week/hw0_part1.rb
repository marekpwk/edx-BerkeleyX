def sum(array)
  return 0 if array.empty?
  array.inject(:+)
end


def max_2_sum(array)
  if array.empty?
    0
  elsif array.length == 1
    array[0]
  else
    sort_array = array.sort
    sort_array[-1] + sort_array[-2]
  end
end


def sum_to_n?(array,n)
  combination = array.combination(2).to_a
  combination.each do |arr|
    if sum(arr) == n
      return true
    end
  end
  return false
end

