def multiply(arr, factor)
  new_arr = []
  counter = 0

  loop do
    break if counter == arr.size

    current_value = arr[counter]
    new_arr << current_value * factor

    counter += 1
  end

  new_arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]