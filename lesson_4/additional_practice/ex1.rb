flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = flintstones.each_with_object({}).with_index do |(el, hsh), ind|
  hsh[el] = ind
end

p hash