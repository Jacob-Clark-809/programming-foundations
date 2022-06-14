[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# The return value of the above is [1, nil, nil]. When the value in the array is greater
# than 1 the puts call is the last evaluated line which returns nil. Otherwise, num is
# the last evaluated line and the return value of the block.