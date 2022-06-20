HEX = '0123456789abcdef'.chars

def uuid
  str = ''
  pattern = [8, 4, 4, 4, 12]
  pattern.each do |num|
    num.times { str << HEX.sample }
    str << '-' unless num == 12
  end
  str
end

p uuid