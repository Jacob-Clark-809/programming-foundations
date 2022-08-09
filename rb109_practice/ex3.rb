# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# input - string
# output - new string
# rule - every 2nd letter of every 3rd word converted to uppercase

# split sentence into words
# access every third word
# convert second character to uppercase

def to_weird_case(sentence)
  words = sentence.split
  count = 0
  words.map do |word|
    count += 1
    if count % 3 == 0 && word.size > 1
      ind = 1
      while ind < word.size
        word[ind] = word[ind].upcase if ind.odd?
        ind += 1
      end
    end
    word
  end
  words.join(" ")
end

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".