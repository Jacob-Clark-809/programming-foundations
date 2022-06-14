def double_numbers!(arr)
  counter = 0

  loop do
    break if counter == arr.size

    current_val = arr[counter]
    arr[counter] = current_val*2

    counter += 1
  end
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers