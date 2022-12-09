# frozen_string_literal: true

# Enumerable method implementation #
module EachNode
  def each
    return to_enum(:each) unless block_given?

    node = head
    until node.nil?
      yield node
      node = node.next_node
    end
  end
end
