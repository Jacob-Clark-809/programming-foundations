statement = "The Flintstones Rock"

count = Hash.new(0)

statement.chars.each { |char| count[char] += 1 }

p count