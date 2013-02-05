fork do
  sleep 0.5
  abort
end

Process.wait

puts $?.exitstatus
