def conversation
  puts "Hello"
  yield
  puts "Good bye!"
end

def five_times
 1.upto(5) { |n| yield n }
end

def n_times(n)
  1.upto(n) { |count| yield count }
end

conversation {puts "Good to meet you"}
puts "-----------------\n"
five_times do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
puts "-----------------\n"
n_times(3) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
