['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# The above will return the hash { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat } because
# each_with_object will return the passed object (in this case an empty hash) once the
# block has been run for each value.