[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# The select method above will return [1, 2, 3] because the last evaluated line is 'hi'
# which is a truthy value. Therefore, all items in the array will be selected.