def preorder(tree)  #行きかけ順探索
  p tree[0]
  if tree[1]
    preorder(tree[1])
    preorder(tree[2])
  end
end


node_1 = ["節1", ["節2", ["葉A"], ["葉B"]], ["節3", ["葉C"], ["葉D"]]]

preorder(node_1) #=> "節1", "節2", "葉A", "葉B", "節3", "葉C", "葉D"
