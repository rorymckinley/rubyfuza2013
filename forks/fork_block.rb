puts "Parent process #{Process.pid}"

fork do
  puts "This gets executed by #{Process.pid} - the child"
end

puts "This gets executed by #{Process.pid} - the parent"
