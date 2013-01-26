running_total = 0

adder = Fiber.new do |num|
  running_total += num
end

multiplier = Fiber.new do |num|
  running_total *= num
end

adder.resume(2)
puts "After adding, running_total is: #{running_total}"
multiplier.resume(10)
puts "After multiplication, running_total is: #{running_total}"
