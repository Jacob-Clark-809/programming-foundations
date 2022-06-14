def select_fruit(hash)
  keys = hash.keys
  new_hash = Hash.new
  counter = 0

  loop do
    current_key = keys[counter]
    current_value = hash[current_key]

    if current_value == "Fruit"
      new_hash[current_key] = current_value
    end

    counter += 1
    break if counter == keys.size
  end

  new_hash
end



produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}