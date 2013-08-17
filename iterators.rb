def conversation
  puts "Hello"
  yield
  puts "Good bye!"
end

def five_times
 yield 1
 yield 2
 yield 3
 yield 4
 yield 5
end

conversation {puts "Good to meet you"}

five_times do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
