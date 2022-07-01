require 'minruby'

pp(minruby_parse("
x = 1
y = 3 * 4
p(y)
  "))
