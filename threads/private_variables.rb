# Private variables
x = 1

4.times do
  Thread.new(x) do |x|
    x += 1
    print "And the value of x is #{x}\n"
  end
end

Thread.list.each { |t| t.join unless t == Thread.current }

# And the value of x is 2
# And the value of x is 2
# And the value of x is 2
# And the value of x is 2
