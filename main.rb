require_relative('./lib/bst.rb')
myTree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# myTree.pretty_print
# puts myTree.insert(2)
# myTree.pretty_print

yourTree =  Tree.new([50])
yourTree.insert(30)
yourTree.insert(20)
yourTree.insert(40)
yourTree.insert(70)
yourTree.insert(60)
yourTree.insert(80)
yourTree.pretty_print
puts 'Out'