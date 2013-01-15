require "socket"

t = Time.now

urls = ["hetzner.co.za", "cnn.com", "google.co.za"]

urls.each do |url|
  socket = TCPSocket.new(url, 80)
  puts "Starting to write #{url}"
  socket.write("GET / HTTP/1.1\r\nHost: www.#{url}\r\n\r\n")
  socket.close_write

  puts "Starting to read #{url}"
  socket.read(4096)
  socket.close
end

puts Time.now - t
