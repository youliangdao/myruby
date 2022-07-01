def postorder(tree)
  if tree[1]
    postorder(tree[1])
    if tree[2]
      postorder(tree[2])
    end
    p tree[0]
  else
    p tree[0]
  end

end

tree = ["節1", ["節2", ["葉A"], ["葉B"]], ["節3", ["葉C"], ["葉D"]]]
postorder(tree) #=> "葉A", "葉B", "節2", "葉C", "葉D", "節3", "節1"
