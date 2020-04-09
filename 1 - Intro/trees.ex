defmodule Trees do
  # ## the empty tree
  # nil
  # ## a leaf
  # {:leaf, val}
  # ## a node
  # {:node, val, left, right}

  ################################################
  # member/2 is element in tree?
  def member(_, nil) do
    :no
  end

  def member(e, {:leaf, e}) do
    :yes
  end

  def member(_, {:leaf, _}) do
    :no
  end

  ##################################################

  # now looking in node
  # first line here is when elem found
  def member(e, {:node, e, _, _}) do
    :yes
  end

  # not found, elem smaller than node we looked at, so go down left in tree
  def member(e, {:node, v, left, _}) when e < v do
    member(e, left)
  end

  # otherwise it is bigger and go down and right
  def member(e, {:node, _, _, right}) do
    member(e, right)
  end

  #######################################################

  # insert/2 takes elem and tree, returns new tree with elem inserted right place

  # if there's nothing, just make leaf with elem
  def insert(e, nil) do
    {:leaf, e}
  end

  # if just leaf w/ v then elem e goes to node with v (bigger) as right leaf. =right is reference
  def insert(e, {:leaf, v} = right) when e < v do
    {:node, e, nil, right}
  end

  # again if just leaf, but remaining case e > v
  def insert(e, {:leaf, v} = left) do
    {:node, e, left, nil}
  end

  # now inserting to node, where left and right can be leaves or nodes
  def insert(e, {:node, v, left, right}) when e < v do
    # inserts recursively until ariving at one of the leaf cases above
    # FIRST DID THIS: insert(e, left)... But bellow I think is better cause reconstructs whole tree
    {:node, v, insert(e, left), right}
  end

  # otherwise when e > v
  def insert(e, {:node, v, left, right}) do
    {:node, v, left, insert(e, right)}
  end

  ###########################################################
  def delete(e, {:leaf, e}) do
    ...
  end

  def delete(e, {:node, e, nil, right}) do
    ...
  end

  def delete(e, {:node, e, left, nil}) do
    ...
  end
end

##################

# Pattern match say "x" to a tree I create and then when modifying it
# do the functions in this way: x = Trees.insert(10,x) so it updates and returns
# the already existing tree
