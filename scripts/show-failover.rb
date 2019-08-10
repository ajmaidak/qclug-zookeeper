require 'rubygems'
require 'zookeeper'
z = Zookeeper.new("localhost:2181,localhost:2182,localhost:2183")
loop do
  puts "Listing Root znode"
  c = z.get_children(:path => "/")
  p c.fetch(:children)
  puts "Creating znode: /alex"
  z.create(:path => "/alex")
  c = z.get_children(:path => "/")
  puts "Listing znode: /alex"
  p c.fetch(:children)
  puts "Deleting znode: /alex"
  z.delete(:path => "/alex")
  puts "Deleted znode: /alex"
  puts ""
  sleep 2
end
