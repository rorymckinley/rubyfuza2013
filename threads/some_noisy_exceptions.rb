# some_noisy_exceptions.rb

10.times do
  Thread.new do
    case rand(3)
    when 1
      print "uh-oh\n"
      raise "Oh Noez"
    when 2
      Thread.current.abort_on_exception = true
      raise "Oops"
    end
  end
end

sleep 5 and puts "nothing to see here!"

# uh-oh
# ... <main>': Oops (RuntimeError)'
