munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |member, attributes|
  age = attributes["age"]
  if age < 18
    attributes["age_group"] = "kid"
  elsif age < 65
    attributes["age_group"] = "adult"
  else
    attributes["age_group"] = "senior"
  end
end

p munsters