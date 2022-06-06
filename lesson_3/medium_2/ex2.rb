a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# Here we will see that all three objects have the same ID. This is
# because integers are immutable so there is only ever one e.g. 3 object
# stored.