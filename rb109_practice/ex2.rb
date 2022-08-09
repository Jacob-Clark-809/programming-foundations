# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# input - array of integers
# output - a sum of 5 elements (ineteger)
# rule - output minimum sum

# create an array of all sums of 5 consecutive elements
# return the minimum value in that array

def minimum_sum(numbers)
  return nil if numbers.size < 5

  result = []
  count = 0
  while count <= numbers.size - 5
    result << numbers[count, 5].sum
    count += 1
  end
  result.min
end

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".