flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index { |ele| ele.start_with?("Be") }