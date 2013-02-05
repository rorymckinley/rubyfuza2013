read, write = IO.pipe

fork do
  read.close
  write.puts "Hello from inside the child"
  write.close
end

write.close
puts "Message from child: #{read.gets}"
read.close

Process.wait
