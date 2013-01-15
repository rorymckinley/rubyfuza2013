require "socket"
require "fiber"

t = Time.now

urls = ["hetzner.co.za", "cnn.com", "google.co.za"]

socket_pool = urls.inject({}) do |pool, url|
  fiber = Fiber.new do |socket_writing|
    puts "Starting to write #{url}"
    puts "Closed #{socket_writing.closed?}"
    socket_writing.write("GET / HTTP/1.1\r\nHost: www.#{url}\r\n\r\n")
    socket_writing.close_write
    socket_reading = Fiber.yield

    puts "Starting to read #{url}"
    socket_reading.read(4096)
    socket_reading.close
  end

  pool.merge TCPSocket.new(url, 80) => fiber
end

while socket_pool.values.any? { |fiber| fiber.alive? } do
  puts "Looping through sockets"
  open_sockets = socket_pool.keys.reject { |socket| socket.closed? }
  read, write = IO.select(open_sockets, open_sockets)

  write.each do |socket|
    socket_pool[socket].resume(socket)
  end

  read.each do |socket|
    socket_pool[socket].resume(socket)
  end
end

puts Time.now - t
