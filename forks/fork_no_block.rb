puts "Parent process #{Process.pid}"

if fork
  puts "This gets executed by #{Process.pid} - the parent"
else
  puts "This gets executed by #{Process.pid} - the child"
end
