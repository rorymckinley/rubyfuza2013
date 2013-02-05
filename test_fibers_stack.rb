require "socket"
require "fiber"

t = Time.now

urls = ["hetzner.co.za", "cnn.com", "google.co.za"]

s_pool = urls.inject({}) do |pool, url|
  fiber = Fiber.new do |socket_w|
    puts "Starting to write #{url}"
    socket_w.write("GET / HTTP/1.1\r\nHost: www.#{url}\r\n\r\n")
    socket_w.close_write
    socket_r= Fiber.yield

    puts "Starting to read #{url}"
    storage = socket_r.read(20000)
    p storage.size
    socket_r.close
  end

  pool.merge TCPSocket.new(url, 80) => fiber
end

while s_pool.values.any? { |fiber| fiber.alive? } do
  puts "Looping through sockets"
  read, write = IO.select(s_pool.keys, s_pool.keys)

  write.each { |s| s_pool[s].resume(s) }

  read.each { |s| s_pool[s].resume(s) }
end

puts Time.now - t
