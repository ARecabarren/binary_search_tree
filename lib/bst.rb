require_relative('./helper.rb')
class Node
    include Comparable
    attr_accessor :left_child, :right_child, :data

    def initialize(data)
        @data = data
        @left_child = nil
        @right_child = nil
    end

    def <=>(other)
        @data <=> other.data
    end
end

class Tree
    
    def initialize(array)
        @array = array
        @proper_array = conditionate_array
        @root = build_tree(@proper_array)
    end

    def conditionate_array
        @array = merge_sort(@array)
        @array.uniq
    end

    def build_tree(array)
        # Sort array and remove duplicates
       
        # Build balance BST full of Node objects
        # Base case
        return nil if array.empty?

        # 1.- Set root node
        middle = array.length/2
        root = Node.new(array[middle])

        # 2.- Generate left side 
        left_node = build_tree(array[0...middle])
        root.left_child = left_node

        # 3.- Generate right side
        right_node = build_tree(array[middle + 1..-1])
        root.right_child = right_node

        #Return level-0 root as final step 
        root
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end
end

