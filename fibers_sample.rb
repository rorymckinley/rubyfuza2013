s_pool = urls.inject({}) do |pool, url|
  fiber = Fiber.new do |socket_w|
    socket_w.write("GET / HTTP/1.1\r\nHost: www.#{url}\r\n\r\n")
    socket_w.close_write
    socket_r= Fiber.yield

    socket_r.read(4096)
    socket_r.close
  end
  pool.merge TCPSocket.new(url, 80) => fiber
end

while s_pool.values.any? { |fiber| fiber.alive? } do
  read, write = IO.select(s_pool.keys, s_pool.keys)
  write.each { |s| s_pool[s].resume(s) }
  read.each { |s| s_pool[s].resume(s) }
end
