require 'net/http'
require 'uri'

t = Time.now

uri = URI.parse("http://google.com/")

Net::HTTP.get_response(uri)

puts "Test: #{Time.now - t}"

80.times do |i|
  Thread.new {response = Net::HTTP.get_response(uri); print "Thread no #{i} got #{response.code}\n" }
end

Thread.list.each { |t| t.join unless t == Thread.current }

puts Time.now - t
