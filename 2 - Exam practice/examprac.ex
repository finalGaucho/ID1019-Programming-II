defmodule Examprac do
  ##### 2019-03-08-ex1 ####### expand a coded sequence ###########################
  def decode([]) do
    []
  end

  def decode([{_, 0} | tail]) do
    # HAD [tail] as a parameter, just tail!
    decode(tail)
  end

  def decode([{x, y} | tail]) do
    # if y > 0 do always true if arrives here
    [x | decode([{x, y - 1} | tail])]
  end

  ##### 2019-03-08-ex2 ####### zip/2 ###########################################
  def zip([], []) do
    []
  end

  def zip(x, y) do
    if length(x) == length(y) do
      [h1 | t1] = x
      [h2 | t2] = y
      [{h1, h2} | zip(t1, t2)]
    end
  end

  def zip2([], []) do
    []
  end

  def zip2([xi | xs], [yi | ys]) do
    [{xi, yi} | zip(xs, ys)]
  end

  ##### 2019-03-08-ex4 ####### Evaluate expressions ############################

  def eval({:add, x, y}) do
    eval(x) + eval(y)
  end

  def eval({:mul, x, y}) do
    eval(x) * eval(y)
  end

  def eval({:neg, x}) do
    -eval(x)
  end

  def eval(x) do
    x
  end

  ##### 2019-03-08-ex5 ####### Gray code ############################

  def gray(0) do
    [[]]
  end

  def gray(n) do
    g1 = gray(n - 1)
    r1 = reverse(g1)
    append(update(g1, 0), update(r1, 1))
  end

  def update([], _) do
    []
  end

  def update([h | t], b) do
    [[b | h] | update(t, b)]
  end

  ###### 2019-06-05-ex2 ############# rotate a list ############################
  def append([], y) do
    y
  end

  def append([h | t], y) do
    [h | append(t, y)]
  end

  def reverse(l) do
    reverse(l, [])
  end

  def reverse([], r) do
    r
  end

  def reverse([h | t], r) do
    reverse(t, [h | r])
  end

  def rotate(list, n) do
    rotate(list, n, [])
  end

  def rotate(rest, 0, first) do
    append(rest, reverse(first))
  end

  def rotate([elem | rest], n, first) do
    rotate(rest, n - 1, [elem | first])
  end

  ######## 2019-06-05-ex3 ########## n'th leaf ###################################
  def nth(1, {:leaf, val}) do
    {:found, val}
  end

  def nth(n, {:leaf, _}) do
    {:cont, n - 1}
  end

  def nth(n, {:node, left, right}) do
    case nth(n, left) do
      {:found, val} -> {:found, val}
      {:cont, k} -> nth(k, right)
    end
  end

  ######### 2019-06-05 ######### pascal triangle #################

  def pascal(1) do
    [1]
  end

  def pascal(n) do
    [1 | next(pascal(n - 1))]
  end

  def next([1]) do
    [1]
  end

  def next([a | rest]) do
    # og [b | _] = rest
    [b | _] = rest
    # og [a + b | next(rest)]
    [a + b | next(rest)]
  end

  ##### 2016-06-10 ######## Recursive functions 2.1 Sum and length on one go ###

  def once([]) do
    {0, 0}
  end

  def once([h | t]) do
    {s, l} = once(t)
    {s + h, l + 1}
  end

  #### 2016-06-10 ##### 2.2 The Ackermann function #######

  def ack(0, n) do
    n + 1
  end

  def ack(m, 0) do
    ack(m - 1, 1)
  end

  def ack(m, n) do
    ack(m - 1, ack(m, n - 1))
  end

  #### 2016-06-10 ##### 2.3 an arithmetic expression #######
  def eval2([]) do
    0
  end

  def eval2([n | t]) do
    eval2(t, n)
  end

  def eval2([], sum) do
    sum
  end

  def eval2(['+', n2 | t2], sum) do
    eval2(t2, sum + n2)
  end

  def eval2(['-', n2 | t2], sum) do
    eval2(t2, sum - n2)
  end

  ### 2016-03-19 ###### 2.1 remove all sequences of repetitions #########

  def reduce([]) do
    []
  end

  def reduce([a, a | rest]) do
    reduce([a | rest])
  end

  def reduce([a | rest]) do
    [a | reduce(rest)]
  end

  ##### 2016-03-19 ####### 2.2 Caesar cipher ###########
  def encode([]) do
    []
  end

  def encode([32 | rest]) do
    [32 | encode(rest)]
  end

  def encode([x | rest]) when x < 100 do
    [x - 3 + 26 | encode(rest)]
  end

  def encode([x | rest]) do
    [x - 3 | encode(rest)]
  end

  ######### 2020 exam ######## 3 flatten #########

  def flatten([]) do
    []
  end

  def flatten([[h | t] | rest]) do
    flatten([h | t ++ rest])
  end

  def flatten([h | rest]) do
    [h | flatten(rest)]
  end
end
