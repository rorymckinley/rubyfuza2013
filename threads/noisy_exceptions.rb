Thread.abort_on_exception = true

10.times do
  Thread.new do
    kaboom = rand(2)
    sleep 2
    if kaboom == 1
      print "uh-oh, we're in trouble"
      raise "Silly lyrics"
    end
  end
end

sleep 30

puts "nothing to see here!"
