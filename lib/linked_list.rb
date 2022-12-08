# frozen_string_literal: true

require_relative 'node'

# Class for creating linked lists and methods to manipulate them.
class LinkedList
  include Enumerable
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # append(value) method
  def append(value)
    node = Node.new(value)
    if head.nil?
      self.head = node
    elsif tail.nil?
      self.tail = node
      head.next_node = tail
    else
      tail.next_node = node
      self.tail = node
    end
  end

  # prepend(value) method
  def prepend(value)
    # self.tail = head if tail.nil?
    # self.head = Node.new(value, head)
    node = Node.new(value)
    if head.nil?
      self.head = node
    elsif tail.nil?
      self.tail = head
      self.head = node
      head.next_node = tail
    else
      node.next_node = head
      self.head = node
    end
  end

  # size method
  def size
    return 0 if head.nil?

    node = head.next_node
    count = 1
    loop do
      break if node.nil?

      node = node.next_node
      count += 1
    end
    count
  end

  # head method
  # implemented as attr_accessor

  # tail method
  # implemented as attr_accessor

  # at(index) method
  def at(index)
    size = self.size
    return head.value if index.zero? || index == -size

    return tail.value if index == -1

    return nil if index >= size || index < -size

    node = head.next_node
    pointer = 1
    loop do
      if index < -1
        break if pointer == size + index
      elsif pointer == index
        break
      end
      node = node.next_node
      pointer += 1
    end
    node
  end

  # pop method
  def pop(node = head)
    if tail.nil? || tail.eql?(head)
      self.head = nil
      self.tail = nil
      return
    end

    loop do
      node.next_node = nil if node.next_node.eql?(tail)
      break if node.next_node.nil?

      node = node.next_node
    end
    self.tail = node
    nil
  end

  # contains?(value) method
  def contains?(value)
    return false if head.nil?

    return true if head.value == value || tail.value == value

    node = head
    loop do
      break if node.next_node.nil?

      return true if node.value == value

      node = node.next_node
    end
    false
  end

  # find(value) method
  def find(value)
    return nil if head.nil?

    return 0 if head.value == value

    node = head.next_node
    index = 1
    loop do
      return nil if node.nil?

      return index if node.value == value

      node = node.next_node
      index += 1
    end
  end

  # to_s method
  def to_s
    # return 'nil' if head.nil?

    # str_sum = "( #{head.value} ) "
    # node = head.next_node
    # loop do
    #   return str_sum += '-> nil' if node.nil?

    #   str_sum += "-> ( #{node.value} ) "
    #   node = node.next_node
    # end
    # str_sum
    values = map { |value| "( #{value} )" }
    values << "nil"
    values.join(" -> ")
  end

  # Extra Credit:
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

  private

  def each
    node = head
    until node.nil?
      yield node.value
      node = node.next_node
    end
  end
end
