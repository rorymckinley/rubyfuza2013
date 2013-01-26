# Local variables
thread_pool = []

4.times do |i|
  thread_pool << Thread.new do
    until Thread.current.key?(:seed) do
      sleep 2
    end
    print "Seed value is #{Thread.current[:seed]}\n"
  end
end

sleep 3; thread_pool.each { |t| t[:seed] = 1 }

Thread.list.each { |t| t.join unless t == Thread.current }

# Seed value is 1
# ...
# Seed value is 1
