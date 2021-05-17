defmodule Elixir09 do
  @moduledoc """
  Documentation for `Elixir09`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Elixir09.hello()
      :world

  """
  def hello do
    IO.puts :world
  end

  def main do
    # Enum.each(10000000..100000000, &Flow.from_enumerable/1)
    #|> Flow.map(&Ch09.search/1)
    Enum.each(10000000..100000000, &Ch09.search/1)
  #   |> Flow.from_enumerable()
  end
end
