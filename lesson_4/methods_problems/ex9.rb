{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# This code will output [nil, 'bear']. This is because map changes the value
# of each pair to the return value of the block. When the value length is greater than 3
# the if statement is run and the block returns value. When the condition in the if
# statement evaluates as false nil is returned instead.