# noisy_exceptions

Thread.abort_on_exception = true

10.times do
  Thread.new do
    if rand(2) == 1
      print "uh-oh, we're in trouble\n"
      raise "Silly lyrics"
    end
  end
end

sleep 5 and puts "nothing to see here!"

# uh-oh, we're in trouble
# ... <main>': Silly lyrics (RuntimeError)'
