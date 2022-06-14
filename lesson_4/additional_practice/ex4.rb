ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

min = ages["Herman"]

ages.each { |key, value| min = value if value < min }

puts min