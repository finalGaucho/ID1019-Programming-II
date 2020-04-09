defmodule ListOps do
  # Returns first element of a list

  def tak([]) do
    :no
  end

  def tak([head | _]) do
    {:ok, head}
  end

  #############################################################
  # Returns list where first element is removed

  def drp([]) do
    :no
  end

  def drp([_ | tail]) do
    {:ok, tail}
  end

  ###############################################################
  # Returns length of list

  def len([]) do
    0
  end

  def len([_ | tail]) do
    1 + len(tail)
  end

  ###############################################################
  # Returns sum of elements in list (assuming they're ints)
  def sum([]) do
    0
  end

  def sum([head | tail]) do
    head + sum(tail)
  end

  ###################################################################
  # Returns a list where all elements are duplicated
  def duplicate([]) do
    # Did 0 answers have []
    []
  end

  def duplicate([head | tail]) do
    # almost, i did [head, head, duplicate(tail)]
    [head, head | duplicate(tail)]
  end

  #######################################################################
  # add the element x to the list of it is not in the list add(x,l)
  def add(x, []) do
    [x]
  end

  # if header is same then don't add, just return the already existing list
  def add(x, [x | tail]) do
    [x | tail]
  end

  # so if head isn't same, we good.
  # Then recursively call, each time considering first tail item
  # as the new head
  def add(x, [head | tail]) do
    [head | add(x, tail)]
  end

  ###################################################################

  # Remove all occurrences of x in the list
  # they have a difference in the second line, i had: def remove(x, [x | tail]) do tail end
  def remove(_, []) do
    []
  end

  def remove(x, [x | tail]) do
    remove(x, tail)
  end

  def remove(x, [head | tail]) do
    [head | remove(x, tail)]
  end

  #####################################################################

  # return a list of unique elments in the list
  # First head always unique, then runs unique recusively
  # on the tail without head which is obtained by first running remove

  def unique([]) do
    []
  end

  def unique([head | tail]) do
    [head | unique(remove(head, tail))]
  end

  ###############################################################
  def append([], y) do
    y
  end

  def append([h | t], y) do
    [h | append(t, y)]
  end

  ###################################################################

  # Reverse a list

  # this way is O(n^2)
  def naive_reverse([]) do
    []
  end

  def naive_reverse([h | t]) do
    naive_reverse(t) ++ h
  end

  # O(n) way
  # TRACE @ "Programming II general" notability
  def reverse(l) do
    reverse(l, [])
  end

  def reverse([], r) do
    r
  end

  def reverse([h | t], r) do
    reverse(t, [h | r])
  end
end
