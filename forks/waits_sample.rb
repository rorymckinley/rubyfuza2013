Process.wait # blocks, returns pid of child
Process.waitpid 999 #blocks, returns pid

begin
  while Process.wait do
    sleep 0.5
  end
rescue Errno::ECHILD
end

Process.waitall
