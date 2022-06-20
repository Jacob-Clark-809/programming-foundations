hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiouAEIOU'.chars
hsh.each do |_, arr|
  arr.each do |words|
    words.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

