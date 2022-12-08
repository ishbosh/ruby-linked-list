class Node
  attr_accessor :value, :next_node
#value method
#link to the next node
## Set both as nil by default
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end