defmodule Recurse do
  def sum([head | tail], total) do
    IO.puts("Head: #{head} Tail: #{inspect(tail)}")
    sum(tail, head + total)
  end

  def sum([], total) do
    IO.puts("Done!")
    total
  end

  def triple([head | tail], tripled_list) do
    triple(tail, [head * 3 | tripled_list])
  end

  def triple([], tripled_list), do: reverse(tripled_list, [])

  def reverse([head | tail], reversed_list) do
    reversed_list = [head | reversed_list]
    reverse(tail, reversed_list)
  end

  def reverse([], reversed_list), do: reversed_list
end

IO.puts Recurse.sum([1, 2, 3, 4, 5], 0)
IO.inspect Recurse.triple([1, 2, 3, 4, 5], [])
