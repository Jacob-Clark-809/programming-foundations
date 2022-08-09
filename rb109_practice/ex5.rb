# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# input - string
# output - character that occurs the least

# split string into characters
# make character array uniq
# iterate through character array counting occurences of each element
# if counted number is less than previous best store new minimum and new
# characeter

def least_common_char(sentence)
  chars = sentence.downcase.chars.uniq
  min = sentence.downcase.count(chars[0])
  min_char = chars[0]

  chars.each do |char|
    curr_min = sentence.downcase.count(char)
    if curr_min < min
      min = curr_min
      min_char = char
    end
  end
  min_char
end


# Examples:

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".