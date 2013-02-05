Process.wait
puts $?.exitstatus # $? is an instance of Process::Status

pid, status = Process.wait2
puts status.exitstatus

Process.waitall # [ [pid1, status1], [pid2, status2] ]
