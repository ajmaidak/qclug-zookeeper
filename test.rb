require 'rubygems'
require 'zookeeper'
z = Zookeeper.new("localhost:2181,localhost:2182,localhost:2184")
loop do
  c = z.get_children(:path => "/")
  p c.fetch(:children)
  z.create(:path => "/alex")
  c = z.get_children(:path => "/")
  p c.fetch(:children)
  z.delete(:path => "/alex")
  sleep 2
end
