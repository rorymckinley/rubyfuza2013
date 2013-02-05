puts "Parent id is #{Process.pid}"

fork do
  puts "My id is #{Process.pid}"
  sleep 200
  puts "Now I am awake"
end

puts "Bye"
