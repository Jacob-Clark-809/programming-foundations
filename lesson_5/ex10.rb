arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]


increment = arr.map do |hsh|
  new_hsh = Hash.new
  hsh.each do |key, value|
    new_hsh[key] = value + 1
  end
  new_hsh
end

p increment