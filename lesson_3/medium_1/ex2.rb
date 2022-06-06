# puts "the value of 40 + 2 is " + (40 + 2)
# The above code will generate an error we cannot implicitly convert
# (40 + 2) from an integeer to a string.

# We can fix this in the following two ways:

puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{40 + 2}"
