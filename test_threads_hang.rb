require "socket"

t = Time.now

urls = ["hetzner.co.za", "cnn.com", "google.co.za"]

urls.each do |url|
  Thread.new do
    socket = TCPSocket.new(url, 80)
    print "Starting to write #{url}\n"
    socket.write("GET / HTTP/1.1\r\nHost: www.#{url}\r\n\r\n")
    socket.close_write

    print "Starting to read #{url}\n"
    socket.read(4096)
    socket.close
  end
end

Thread.list.each { |t| t.join }

puts Time.now - t
