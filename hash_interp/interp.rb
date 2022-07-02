require 'minruby'

# 木の処理を書いていく
def evaluate(tree, genv, lenv)
  if tree[0] == "lit"
    tree[1]
  else
    case tree[0]
    when "+"
      left = evaluate(tree[1], genv, lenv)
      right = evaluate(tree[2], genv, lenv)
      left + right
    when "-"
      left = evaluate(tree[1], genv, lenv)
      right = evaluate(tree[2], genv, lenv)
      left - right
    when "*"
      left = evaluate(tree[1], genv, lenv)
      right = evaluate(tree[2], genv, lenv)
      left * right
    when "/"
      left = evaluate(tree[1], genv, lenv)
      right = evaluate(tree[2], genv, lenv)
      left / right
    when "func_def"
      genv[tree[1]] = ["user_defined", tree[2], tree[3]]
    when "func_call"
      length = tree.length
      i = 2
      args = []
      while i < length
        args[i - 2] = (evaluate(tree[i], genv, lenv))
        i = i + 1
      end
      mhd = genv[tree[1]]
      if mhd[0] == "builtin"
        minruby_call(mhd[1], args)
      else
        new_lenv = {}
        j = 0
        params = mhd[1]
        while params[j]
          new_lenv[params[j]] = args[j]
          j = j + 1
        end
        evaluate(mhd[2], genv, new_lenv)
      end
    when "ary_new"
      length = tree.length
      i = 1
      array = []
      while i < length
        array[i - 1] = evaluate(tree[i], genv, lenv)
        i = i + 1
      end
      array
    when "ary_ref"
      array = evaluate(tree[1], genv, lenv)
      idx = evaluate(tree[2], genv, lenv)
      array[idx]
    when  "ary_assign"
      array = evaluate(tree[1], genv, lenv)
      index = evaluate(tree[2], genv, lenv)
      value = evaluate(tree[3], genv, lenv)
      array[index] = value
    when "hash_new"
      i = 1
      hash = {}
      while tree[i]
        key = evaluate(tree[i], genv, lenv)
        value = evaluate(tree[i + 1], genv, lenv)
        hash[key] = value
        i = i + 2
      end
      hash
    when "stmts"
      length = tree.length
      i = 1
      while i < length
        last = evaluate(tree[i], genv, lenv)
        i = i + 1
      end
      last
    when "var_assign"
      num = evaluate(tree[2], genv, lenv)
      lenv[tree[1]] = num
    when  "var_ref"
      lenv[tree[1]]
    when  "if"
      bool = evaluate(tree[1], genv, levn)
      if bool
        evaluate(tree[2], genv, lenv)
      else
        evaluate(tree[3], genv, lenv)
      end
    when "while"
      while evaluate(tree[1], genv, lenv)
        evaluate(tree[2], genv, lenv)
      end
    when "<"
      left = evaluate(tree[1], genv, lenv)
      right = evaluate(tree[2], genv, lenv)
      if left < right
        true
      else
        false
      end
    when "=="
      left = evaluate(tree[1], genv, levn)
      right = evaluate(tree[2], genv, levn)
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
# ③構文木を実行
pp tree
genv = {"p" => ["builtin", "p"]}
lenv = {}
evaluate(tree, genv, lenv)
