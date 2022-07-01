def preorder(tree)  #行きかけ順探索
  p tree[0] if tree[0].start_with?("葉")
  if tree[1]
    preorder(tree[1])
    preorder(tree[2])
  end
end

tree = ["節1", ["節2", ["葉A"], ["節3", ["葉B"], ["葉C"]]], ["葉D"]]
preorder(tree)
