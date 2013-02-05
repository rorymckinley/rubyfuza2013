f = Fiber.new do |num|
  next_num = Fiber.yield num + 1
  last_num = Fiber.yield next_num+ 2
  false
end

puts f.resume(0)
puts f.resume(5)

# 1
# 7
