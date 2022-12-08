# frozen_string_literal: true

require_relative 'node'

# Class for creating linked lists and methods to manipulate them.
class LinkedList
  include Enumerable
  attr_accessor :head, :tail

  def initialize(head = nil)
    @head = head
    @tail = at(-1)
  end

  # append(value) method
  def append(value)
    node = Node.new(value)
    return self.head = node if head.nil?
    
    if tail.nil?
      self.tail = node
      head.next_node = tail
      return
    end
    tail.next_node = node
    self.tail = node
  end

  # prepend(value) method
  def prepend(value)
    self.tail = head if tail.nil?
    self.head = Node.new(value, head)
  end

  # size method 
  # utilizes the enumerable count method
  def size
    count
  end

  # head method
  # implemented as attr_accessor

  # tail method
  # implemented as attr_accessor

  # at(index) method
  # returns the node at the given index
  def at(index)
    list_size = size
    each_with_index do |node, i|
      return node if i.eql?(list_size + index) # allow negative indexing
      return node if i.eql?(index)
    end
    nil      
  end

  # pop method
  # removes the last element from the list (returns the element removed)
  def pop
    popped = at(-1)
    self.head = nil if tail.nil?
    self.tail = at(-2)
    tail.next_node = nil unless tail.nil?
    popped
  end

  # contains?(value) method
  # returns true if the passed in value is in the list, otherwise returns false
  def contains?(value)
    return false if head.nil?

    return true if head.value.eql?(value) || tail.value.eql?(value)

    each { |node| return true if node.value.eql?(value) }
    false
  end

  # find(value) method 
  # returns the index of the node containing value, or nil if not found
  def find(value)
    index = 0
    each do |node| 
      return index if node.value.eql?(value)
      index += 1
    end
    nil
  end

  # to_s method
  # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    values = map { |node| "( #{node.value} )" }
    values << "nil"
    values.join(" -> ")
  end

  # Extra Credit: #

  # insert_at(value, index) method
  def insert_at(value, index)
    node_before = at(index - 1)
    node_after = at(index)
    node = Node.new(value, node_after)
    node_before.next_node = node
  end

  # remove_at(index) method
  def remove_at(index)
    node_before = at(index - 1)
    node_after = at(index).next_node
    node_before.next_node = node_after
  end

  # Enumerable method implementation #

  def each
    return to_enum(:each) unless block_given?
    node = head
    until node.nil?
      yield node
      node = node.next_node
    end
  end

  def each_with_index
    return to_enum(:each_with_index) unless block_given?

    index = 0
    each do |node|
      yield(node, index)
      index += 1
    end
  end

  def <<(value)
    append(value)
  end
end
