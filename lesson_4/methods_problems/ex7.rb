[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The block return true if num is odd and false otherwise. The value of any? is true
# because at least one of the elements in the array is odd. The code will output:
# 1
# This is because any stops running once it has reached a true value.