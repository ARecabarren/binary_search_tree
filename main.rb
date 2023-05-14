require_relative('./lib/bst.rb')
myTree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# myTree.pretty_print
# puts myTree.insert(2)
# myTree.pretty_print

# yourTree =  Tree.new([50])
# yourTree.insert(30)
# yourTree.insert(20)
# yourTree.insert(40)
# yourTree.insert(70)
# yourTree.insert(60)
# yourTree.insert(80)
# yourTree.pretty_print
# puts 'Out'

# codeschool = Tree.new([12,15,5,7,3,17,13,9,1,19])
# codeschool.pretty_print
# codeschool.delete(5)
# codeschool.pretty_print

# p codeschool.level_order

# p codeschool.inorder
# p codeschool.preorder
# p codeschool.postorder

# puts codeschool.height()
# puts some_node = codeschool.find(5)
# puts codeschool.height(some_node)

# other_node = codeschool.find(9)
# puts codeschool.depth(other_node)
# codeschool.delete(19)
# codeschool.delete(17)
# codeschool.delete(15)


# codeschool.pretty_print
# puts codeschool.balance?
# codeschool.rebalance
# codeschool.pretty_print
# puts codeschool.balance?

# Tie it all together

myTree = Tree.new((Array.new(15) { rand(1..100) }))
puts "Is it balanced? : #{myTree.balance?}"
puts "Preorder #{myTree.preorder}"
puts "Inorder #{myTree.inorder}"
puts "Postorder #{myTree.postorder}"

myTree.insert(101)
myTree.insert(120)
myTree.insert(1000)
myTree.insert(479)

puts "Is it balanced? : #{myTree.balance?}"
myTree.rebalance
puts "Is it balanced? : #{myTree.balance?}"
puts "Preorder #{myTree.preorder}"
puts "Inorder #{myTree.inorder}"
puts "Postorder #{myTree.postorder}"

myTree.pretty_print




