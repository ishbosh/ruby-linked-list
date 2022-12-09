# frozen_string_literal: true

# Class for creating Node objects
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  # Redefine inspect for nodes so they do not list every single nested next node in the inspection
  def inspect
    "#<#{self.class}:0x#{object_id.to_s(16)}, value=#{value}>"
  end

  # Method to include inspection of all nested next nodes as well
  def inspect_all
    return if next_node.nil?

    "#<#{self.class}:0x#{object_id.to_s(16)}, value=#{value}, @next_node=#{next_node.inspect_all}>"
  end
end
