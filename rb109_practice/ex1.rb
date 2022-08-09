# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# generate an array of uniq numbers
# iterate through given array and compare each element with the elements
# in the unique array
# count number of elements that are smaller than current element
# output - new array of the same size of the input array

def smaller_numbers_than_current(numbers)
  uniq = numbers.uniq
  result = []
  numbers.each do |curr|
    elements_smaller = uniq.count { |ele| ele < curr }
    result << elements_smaller
  end
  result
end

# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) \
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".