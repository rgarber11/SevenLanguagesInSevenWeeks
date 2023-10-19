class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @node_name = name
    @children = children
  end
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  def visit(&block)
    block.call self
  end
  private_class_method def self.decode_children(children)
    return [] if children.empty?
    children_array = children.to_a
    children_array.collect do |e|
      name = e[0]
      children = decode_children e[1]
      Tree.new(name, children)
    end
  end
  def self.decode_tree(tree)
    tree_array = tree.to_a
    name = tree_array[0][0]
    children = decode_children tree_array[0][1]
    Tree.new(name, children)
  end
end
ruby_tree_hash =   {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }
ruby_tree = Tree.decode_tree(ruby_tree_hash)
puts "Visiting tree"
ruby_tree.visit_all {|node| puts node.node_name}
