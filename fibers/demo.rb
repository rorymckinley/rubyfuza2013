require "fiber"
 
f1 = Fiber.new { |f2| f2.resume Fiber.current; while true; puts "A"; f2.transfer; end }
f2 = Fiber.new { |f1| f1.transfer; while true; puts "B"; f1.transfer; end }
 
f1.resume f2
