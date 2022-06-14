def double_odd_indices(arr)
  new_arr = []
  counter = 0

  loop do
    break if counter == arr.size

    current_val = arr[counter]
    current_val *= 2 if counter.odd?
    new_arr << current_val

    counter += 1
  end

  new_arr
end

numbers = [1, 2, 3, 4, 5, 11, 55, 100]
p double_odd_indices(numbers)