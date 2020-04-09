defmodule Recursion do
  @doc """
  Compute the product between of n and m.

  product of n and m :
    if n is 0
      then ...
    otherwise
      the result ...
  """
  def prod(m, n) do
    case m do
      0 -> 0
      1 -> n
      m -> m * n
    end
  end

  def prod2(m, n) do
    case m do
      0 -> 0
      m -> n + prod2(m - 1, n)
    end
  end

  def prodneg(m, n) do
    cond do
      m == 0 -> 0
      m > 0 -> n + prodneg(m - 1, n)
      m < 0 and n < 0 -> prodneg(m * -1, n * -1)
      m < 0 and n > 0 -> prodneg(n, m)
    end
  end

  def power(m, n) do
    cond do
      m == 0 or n == 0 -> 1
      true -> prod(m, power(m, n - 1))
    end
  end

  def fib(n) do
    case n do
      0 -> 0
      1 -> 1
      n -> fib(n - 1) + fib(n - 2)
    end
  end
end
