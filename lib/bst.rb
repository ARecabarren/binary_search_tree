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
    
    def initialize(array = [])
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

    def is_leaf?(node)
        if node.right_child.nil? && node.left_child.nil?
            true
        else
            false
        end
    end

    def find_min(root)
        if root.left_child.nil? && root.right_child.nil?
            return root
        elsif root.left_child.nil?
            return root
        else
            min = find_min(root.left_child)
        end
        min.data
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end

    def find(value, node = @root)
        return nil if node.nil?
        return node if value == node.data

        if value < node.data
            find(value, node.left_child)
        else
            find(value, node.right_child) 
        end
    end

    def insert(root = @root, value)
        if root.nil?
            root = Node.new(value)
        else
            if root.data == value
                return root
            elsif value < root.data
                root.left_child = insert(root.left_child, value)
            else
                root.right_child = insert(root.right_child, value)
            end
        end
        return root
    end

    def delete(root = @root, value)
        return nil if root.nil?

        if value < root.data
            root.left_child = delete(root.left_child, value)
        elsif value > root.data
            root.right_child = delete(root.right_child, value)
        else # Value isn't bigger or lower than root.data so we found the node

            # Caso 1 - Leaf node
            return nil if root.left_child.nil? && root.right_child.nil?

            # Case 2 - A single child
            if root.left_child.nil?
                root = root.right_child
            elsif root.right_child.nil?
                root= root.left_child
            else
            # Case 3 - 3 children
                minimun = find_min(root.right_child)
                root.data = minimun
                root.right_child = delete(root.right_child, minimun)
            end
        end
        root
    end

    def level_order(root = @root, queue = [])
        result = block_given? ? nil : []

        queue.push(root)
        until queue.empty?
            current_node = queue.shift
            
            if block_given?
                yield current_node
            else
                result << current_node.data
            end

            queue << current_node.left_child unless current_node.left_child.nil?
            queue << current_node.right_child unless current_node.right_child.nil?

        end
        
    end
end

