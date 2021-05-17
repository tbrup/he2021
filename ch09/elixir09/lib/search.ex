defmodule Ch09 do

  def search (100000000) do
    IO.puts "done...."
  end

  def search (i) do
    if rem(i,1000000) == 0 do
      IO.puts "#{i}"
    end
    s = "#{i} Cola Decaf"
    h = :crypto.hash(:sha256, s) |>Base.encode16
    #h = :erlsha2.sha256(s)
    if Regex.match?(~r{C01A}, h) do
      if Regex.match?(~r{DECAF},h) do
        IO.puts "found match for s: #{s}"
        IO.puts h
      end
    end
  end
end

# defmodule Benchmark do
#   def measure(function) do
#     function
#     |> :timer.tc
#     |> elem(0)
#     |> Kernel./(1_000_000)
#   end
# end
