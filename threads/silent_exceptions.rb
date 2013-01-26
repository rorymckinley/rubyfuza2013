# silent_exceptions.rb

10.times do
  Thread.new do
    if rand(2) == 1
      print "uh-oh\n"
      raise "Oh Noez"
    end
  end
end

sleep 5 and puts "nothing to see here!"

# uh-oh
# ...
# uh-oh
# nothing to see here!
