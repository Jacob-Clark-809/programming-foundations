[1, 2, 3].reject do |num|
  puts num
end

# The reject method retunrs an array of all elements for which the block returns false.
# In this case the block always evaluates as false because puts returns nil. Therefore,
# it will give [1, 2, 3]