f = Fiber.new do |num|
  puts "Fiber:Add 1 to #{num}"
  next_num = Fiber.yield num + 1
  puts "Fiber:Add 2 to #{next_num}"
  raise "W00t!"
  last_num = Fiber.yield next_num+ 2
  puts "Fiber:Add 3 to #{last_num}"
  Fiber.yield last_num + 3
end


puts "Start with 0"
running_num = f.resume(0)
puts "Fiber returns #{running_num}"
puts "Then pass in 1"
running_num = f.resume(running_num)
puts "Fiber returns #{running_num}"
puts "And call for the last time with 3"
running_num = f.resume(running_num)
puts "Fiber returns #{running_num}"

