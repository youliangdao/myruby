require 'minruby'

# 木の四則演算処理を書いていく
def evaluate(tree)
  if tree[0] == "lit"
    tree[1]
  else
    if tree[0] == "+"
      left = evaluate(tree[1])
      right = evaluate(tree[2])
      left + right
    elsif tree[0] == "-"
      left = evaluate(tree[1])
      right = evaluate(tree[2])
      left - right
    elsif tree[0] == "*"
      left = evaluate(tree[1])
      right = evaluate(tree[2])
      left * right
    else
      left = evaluate(tree[1])
      right = evaluate(tree[2])
      left / right
    end

  end
end

# ①計算式の文字列を読み込む
str = gets
# ②計算式の文字列を計算の木に変換する
tree = minruby_parse(str)
# ③計算の木を実行
answer = evaluate(tree)
# ④計算結果を出力する
p answer
