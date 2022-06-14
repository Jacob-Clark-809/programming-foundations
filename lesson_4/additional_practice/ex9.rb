words = "the flintstones rock"

def titleize(word)
  word.split.map { |val| val.capitalize }.join(" ")
end

title = titleize(words)

puts title