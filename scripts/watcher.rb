require 'rubygems'
require 'zookeeper'
z = Zookeeper.new("localhost:2181,localhost:2182,localhost:2183")
# poll based
loop do
  puts "Listing cluster membership"
  c = z.get_children(:path => "/config/mycluster")
  p c.fetch(:children)
  sleep 1
end
