require 'minruby'

# 木の四則演算処理を書いていく
def evaluate(tree, env)
  if tree[0] == "lit"
    tree[1]
  else
    case tree[0]
    when "+"
      left = evaluate(tree[1], env)
      right = evaluate(tree[2], env)
      left + right
    when "-"
      left = evaluate(tree[1], env)
      right = evaluate(tree[2], env)
      left - right
    when "*"
      left = evaluate(tree[1], env)
      right = evaluate(tree[2], env)
      left * right
    when "/"
      left = evaluate(tree[1], env)
      right = evaluate(tree[2], env)
      left / right
    when "func_call"
      p (evaluate(tree[2], env))
    when "stmts"
      length = tree.length
      i = 1
      while i < length
        last = evaluate(tree[i], env)
        i = i + 1
      end
      last
    when "var_assign"
      num = evaluate(tree[2], env)
      env[tree[1]] = num
    when  "var_ref"
      env[tree[1]]
    when  "if"
      bool = evaluate(tree[1], env)
      if bool
        evaluate(tree[2], env)
      else
        evaluate(tree[3], env)
      end
    when "=="
      left = evaluate(tree[1], env)
      right = evaluate(tree[2], env)
      if left == right
        true
      else
        false
      end
    end
  end
end

# ①計算式の文字列を読み込む
str = minruby_load()
# ②計算式の文字列を計算の木に変換する
tree = minruby_parse(str)
# ③計算の木を実行
pp tree
env = {}
evaluate(tree, env)
