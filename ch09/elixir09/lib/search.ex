defmodule Ch09 do
  use Bitwise

  def _nibbles(<<>>, <<tmp::binary()>>) do
    tmp
  end

  def _nibbles(<<c::8,rest::binary()>>, tmp) do
    h1 = (c &&& 0xf0) >>> 4
    l1 = (c &&& 0x0f)
    _nibbles(rest, tmp <> <<h1::8>> <> <<l1::8>> )
  end

  def nibbles(s) do
    _nibbles(s, <<>>)
  end

  # def nibbles(<<>>), do: <<>>
  # def nibbles(data) do
  #   for <<c::4 <- data>>, into: <<>>, do: <<c::8>>
  # end

  def search (100000000) do
    IO.puts "done...."
  end

  def search (i) do
    if rem(i,1000000) == 0 do
      IO.puts "#{i}"
    end
    s = "#{i} Cola Decaf"
    h = :crypto.hash(:sha256, s) |> nibbles # |>Base.encode16
    if String.contains?(h, <<0xC::8, 0::8, 1::8, 0xA::8>>) do
      if String.contains?(h, <<0xd::8, 0xe::8, 0xC::8, 0xA::8, 0xf::8>>) do
        IO.puts "found match for s: #{s}"
        :crypto.hash(:sha256, s)|> Base.encode16 |> IO.puts
      end
    end
    # if Regex.match?(~r{C01A}, h) do
    #   if Regex.match?(~r{DECAF},h) do
    #     IO.puts "found match for s: #{s}"
    #     IO.puts h
    #   end
    # end
  end

  def searchstr (i) do
    if rem(i,1000000) == 0 do
      IO.puts "#{i}"
    end
    s = to_string(i) <> " Cola Decaf"
    h = :crypto.hash(:sha256, s) |>Base.encode16
    if String.contains?(h, "C01A") &&
      String.contains?(h, "DECAF") do
        IO.puts "found match for s: #{s} #{h}"
        # tmp = :crypto.hash(:sha256, s)|> Base.encode16 
        {:ok, "found match for #{s}:  #{h}"}
    else
    {:ok, ""}
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
