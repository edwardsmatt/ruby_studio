def conversation
  puts "Hello"
  yield
  puts "Good bye!"
end

def five_times
 1.upto(5) { |n| yield n }
end

conversation {puts "Good to meet you"}

five_times do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
