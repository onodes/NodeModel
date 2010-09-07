require 'node2'
require 'narray'
include Math
class ComplexCell 
  def initialize(
    option ={:size => 256,:theta => 0.25,:psi => PI/2.0, :gamma => 1, :lmda => 64, :sigma => 64},
    option2 ={:size => 256,:theta => 0.25,:psi => PI/2.0, :gamma => 1, :lmda => 64, :sigma => 64}
  )
  @node1 = Node.new(option)
  @node2 = Node.new(option2)
  puts "Finished initialized"
  self
  end

  def put(data)
    @node1.put(data)
    @node2.put(data)
    self
  end

  def spike
#    sq_node1 = @node1.filter_data.collect{|element| element**2}
#    sq_node2 = @node2.filter_data.collect{|element| element**2}
#    filtered = (sq_node1+sq_node2).collect{|element| Math.sqrt(element)}
    sq_node1 = @node1.spike
    sq_node2 = @node2.spike
   
    add = sq_node1**2 + sq_node2**2
    return Math.sqrt(add)
    
  end

end
