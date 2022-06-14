['ant', 'bear', 'caterpillar'].pop.size

# The return value of the above is 11. This is because pop returns the last value in the
# array (and removes it) which in this case is 'caterpillar' and then size is called
# which returns the length of the string, i.e. 11.