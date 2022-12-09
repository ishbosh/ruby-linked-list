# frozen_string_literal: true

require_relative 'lib/linked_list'

puts 'Initializing list...'
list = LinkedList.new
puts "\nInitial List: #{list}"

# Append and Prepend
puts "\n  :::: append and prepend methods ::::\n "
puts 'Appending 0, 2, -33, 4 and prepending 4, -2, and -3:'
list.append(0)
list.append(-22)
list.append(3)
list << 4
list.prepend(4)
list.prepend(-2)
list.prepend(-3)
puts "Updated List: #{list}"

# Size, Head, and Tail
puts "\n  :::: size, head, and tail methods ::::\n "
puts "Size of List: #{list.size}"
puts "Head of List: #{list.head} - Value: #{list.head.value}"
puts "Tail of List: #{list.tail} - Value: #{list.tail.value}"

# At
puts "\n  :::: at method ::::\n "
puts "Node at index  2: #{list.at(2)} - Value: #{list.at(2).value}"
puts "Node at index -3: #{list.at(-3)} - Value: #{list.at(-3).value}"
puts list

# Pop
puts "\n  :::: pop method ::::\n "
popped_node = list.pop
puts "Node popped off end of list: #{popped_node} with value #{popped_node.value}"
puts "Updated List: #{list}"

# Contains? and Find
puts "\n  :::: contains? and find methods ::::\n "
puts 'Does Linked List contain 1?'
puts list.contains?(1)
puts 'Does Linked List contain -22?'
puts list.contains?(-22)
puts "Is index of 1 nil? #{list.find(1).nil?}"
puts "-22 is at index: #{list.find(-22)}\n "

# To_s
p list.to_s

# Insert_at and Remove_at
puts "\n  :::: insert_at and remove_at methods ::::\n "
puts 'Remove -22 from the list.'
puts list.remove_at(4)
puts 'Insert string "two" into the 4th index location.'
puts list.insert_at('two', 4)
puts "Index of 'two' is: #{list.find('two')}"
puts 'Negative Index: Insert 1 using -3 as the index location.'
puts list.insert_at(1, -3)
puts 'Negative Index: Remove 3 using -1 as the index location.'
puts list.remove_at(-1)

# Additional methods
puts "\n  :::: extra/bonus methods ::::\n "
puts 'Replace 4 with -1: '
list.at(list.find(4)).value = -1
puts "Updated List: #{list}"

puts "\nCreate an array from the linked list using map: "
p list.map(&:value)
