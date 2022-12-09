# frozen_string_literal: true

require_relative 'node'
require_relative 'enum_module'

# Class for creating linked lists and methods to manipulate them.
class LinkedList
  include Enumerable
  include EnumMethods

  # head method and tail method
  # # returns the first and last nodes in the list
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = at(-1)
  end

  # append(value) method
  # # adds a new node containing value to the end of the list
  def append(value)
    node = Node.new(value)
    return @head = node if head.nil?

    if tail.nil?
      head.next_node = node
      return @tail = node
    end
    tail.next_node = node
    @tail = node
  end

  # prepend(value) method
  # # adds a new node containing value to the start of the list
  def prepend(value)
    @tail = head if tail.nil?
    @head = Node.new(value, head)
  end

  # size method
  # # returns the total number of nodes in the list
  # # (utilizes the enumerable count method)
  def size
    count
  end

  # head method
  # # implemented as attr_reader

  # tail method
  # # implemented as attr_reader

  # at(index) method
  # # returns the node at the given index
  def at(index)
    list_size = size
    each_with_index do |node, i|
      return node if i.eql?(list_size + index) # allow negative indexing
      return node if i.eql?(index)
    end
    nil
  end

  # pop method
  # # removes the last element from the list (returns the element removed)
  def pop
    popped = tail
    @head = nil if tail.nil?
    @tail = at(-2)
    tail.next_node = nil unless tail.nil?
    popped
  end

  # contains?(value) method
  # # returns true if the passed in value is in the list, otherwise returns false
  def contains?(value)
    return false if head.nil?

    return true if head.value.eql?(value) || tail.value.eql?(value)

    each { |node| return true if node.value.eql?(value) }
    false
  end

  # find(value) method
  # # returns the index of the node containing value, or nil if not found
  def find(value)
    each_with_index do |node, index|
      return index if node.value.eql?(value)
    end
    nil
  end

  # to_s method
  # # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    values = map { |node| "( #{node.value} )" }
    values << 'nil'
    values.join(' -> ')
  end

  # Extra Credit: #

  # insert_at(value, index) method
  # # inserts a new node with the provided value at given index. Accepts negative indexes.
  # # returns nil if given an invalid index (out of range)
  def insert_at(value, index)
    return nil if index > size || index < -size

    if index.zero? || index == -size
      prepend(value)
    else
      node_before_index = previous_node(index)
      node_at_index = node_before_index.next_node
      node = index >= 0 ? Node.new(value, node_at_index) : Node.new(value, node_at_index.next_node)
      reconnect_nodes(node, node_before_index, node_at_index, index)
    end
    self
  end

  # remove_at(index) method
  # # removes the node at the given index.
  # # returns self (the linked list). returns nil if given an invalid index (out of range)
  def remove_at(index)
    return nil if index > size || index < -size

    node_before_index = at(index - 1)
    node_after_index = at(index).next_node
    node_before_index.next_node = node_after_index
    self
  end

  # Private Helper Methods #
  private

  # Helper method for inserting nodes. Checks if index is negative or positive and then reconnects
  # # the old nodes to the new node accordingly.
  def reconnect_nodes(new_node, node_before_index, node_at_index, index)
    index >= 0 ? node_before_index.next_node = new_node : node_at_index.next_node = new_node
  end

  # Helper method for insterting nodes. Gets the node before the node at the index.
  def previous_node(index)
    at(index - 1)
  end
end
