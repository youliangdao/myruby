# Rubyインタプリタ
[RubyでつくるRuby ゼロから学びなおすプログラミング言語入門](https://www.lambdanote.com/products/ruby-ruby) で実装したプロジェクトです。

<code>interp.rb</code>を実行すると、インタープリタがRubyで書かれたFizzBuzzのコードを解釈して、実行します
```
$ ruby interp.rb fizzbuzz.rb
```


またRubyのコードから構文木を構築するために、補助ライブラリである <code>minruby</code> を用いています。
