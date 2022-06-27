def joinor(to_join, delimiter=', ', final='or')
  case to_join.length
  when 0 then ''
  when 1 then arr[0]
  when 2 then to_join.join(" #{final} ")
  else
    to_join[0..-2].join(delimiter) + delimiter + final + ' ' + to_join[-1].to_s
  end
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
