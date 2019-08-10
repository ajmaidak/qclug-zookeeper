require 'zk'

class ClusterNode
  def initialize(name)
    @zk = ZK.new("localhost:2181,localhost:2182,localhost:2183")
    @node = name
    @path = "/config/mycluster"
    @zk.create("#{@path}") rescue ZK::Exceptions::NodeExists
    @zk.create("#{@path}/#{@node}", :mode => :ephemeral) rescue ZK::Exceptions::NodeExists
  end

  def list_cluster_nodes
    @zk.children(@path)
  end
end

node = ClusterNode.new("foo")
sleep 5
