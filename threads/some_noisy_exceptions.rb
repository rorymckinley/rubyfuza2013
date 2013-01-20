10.times do
  Thread.new do
    kaboom = rand(3)
    print "#{kaboom}\n"
    sleep 2
    if kaboom == 1
      print "uh-oh, we're in trouble"
      raise "Silly lyrics"
    elsif kaboom == 2
      Thread.current.abort_on_exception = true
      print "Ask yourself, are you feeling lucky, punk?"
      raise "Overused movie quote"
    end
  end
end

sleep 30

puts "nothing to see here!"
