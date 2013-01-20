thread_pool = []

4.times do |i|
  thread_pool << Thread.new do
    id = rand(100)
    puts "Starting #{id}"

    until Thread.current.key?(:seed) do
      puts "#{id} waiting"
      sleep 2
    end
    puts "Seed value is #{Thread.current[:seed]}"
  end
end

sleep 3
thread_pool.each { |t| t[:seed] = 1 }

Thread.list.each { |t| t.join unless t == Thread.current }
