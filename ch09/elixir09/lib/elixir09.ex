defmodule Elixir09 do
  @moduledoc """
  Documentation for `Elixir09`.
  """
  import ExProf.Macro
  use Flow

  @doc """
  Hello world.

  ## Examples

      iex> Elixir09.hello()
      :world

  """
  def hello do
    IO.puts :world
  end

  def run(100000000) do
    IO.puts "done"
  end

  def run(i) do
    Ch09.search(i)
    run(i+1)
  end

  def notempty({:ok, s}) do
    String.length(s) > 0
  end

  def main do
    # 
    # working version with Stream, 249s
    # 10000000..100000000 |>
    # Stream.map(&Ch09.searchstr/1) |>
    # Stream.filter(&notempty/1) |>
    # Enum.to_list |>
    # IO.inspect
    #
    # Flow version: 33s (6 cores, 12 threads)
    # profile do
      10000000..100000000 |>
      Flow.from_enumerable() |>
      Flow.map(&Ch09.searchstr/1) |>
      Flow.filter(&notempty/1) |>
      Enum.to_list |>
      IO.inspect
    # end
  end
end
