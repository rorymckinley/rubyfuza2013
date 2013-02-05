urls.each do |url|
  fork do
    socket = TCPSocket.new(url, 80)
    socket.write("GET / HTTP/1.1\r\nHost: www.#{url}\r\n\r\n")
    socket.close_write

    socket.read(4096)
    socket.close
  end
end

Process.waitall
