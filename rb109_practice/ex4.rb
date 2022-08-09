# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# input - array of integers
# output - array of two closest values

# get array of sorted values
# iterate through array comparing elements and putting the compared values
# into the result array if the difference is lower than what has been found
# previously

def closest_numbers(numbers)
  sorted = numbers.sort
  min = (sorted[0] - sorted[1]).abs
  result = [sorted[0], sorted[1]]

  ind = 1
  while ind < sorted.size - 1
    diff = (sorted[ind] - sorted[ind + 1]).abs
    if diff < min
      min = diff
      result = [sorted[ind], sorted[ind + 1]]
    end
    ind += 1
  end
  p result
end


# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".