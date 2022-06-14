ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.reject{ |key, value| value >= 100 }

