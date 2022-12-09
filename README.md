# ruby-linked-list
Linked List project in Ruby, assignment from The Odin Project

After the first iteration of this project, I realized it would be much simpler to include the Enumerable class 
and use that to simplify many of the methods. I implemented an each method and a << method in the enum_module.rb
file and included that in the linked list class. 

This approach allowed me to use the each and the each_with_index methods for iteration which improved readability
significantly. It also allowed me to greatly simplify the to_s method by using map and join to create the string.
I was also able to simplify the size method by just using the enumerable count method instead of my original
approach of tracking size using a count variable which was incremented on each iteration until next node was nil.
As a bonus side effect, I can use enumerable methods on the linked list and am able to easily create an array
out of the list using map. 

I decided to include negative indexing to the methods that take an index partly for fun and partly to make certain
tasks simpler to implement and more readable, for example: re-assigning the tail using at(-2) in the pop method. 

The first version of this project was quite messy and I found refactoring it to be quite and enjoyable task.
I realize there are likely more simplifications I could make, and I could have opted to use recursion for some
methods, but I found my solution to be satisfactory for me.


- ASSIGNMENT:

You will need two classes:

LinkedList class, which will represent the full list.
Node class, containing a #value method and a link to the #next_node, set both as nil by default.
Build the following methods in your linked list class:

#append(value) adds a new node containing value to the end of the list
#prepend(value) adds a new node containing value to the start of the list
#size returns the total number of nodes in the list
#head returns the first node in the list
#tail returns the last node in the list
#at(index) returns the node at the given index
#pop removes the last element from the list
#contains?(value) returns true if the passed in value is in the list and otherwise returns false.
#find(value) returns the index of the node containing value, or nil if not found.
#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
 The format should be: ( value ) -> ( value ) -> ( value ) -> nil

- Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.