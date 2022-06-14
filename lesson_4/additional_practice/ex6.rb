flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |val| val[0, 3] }

p flintstones