defmodule Countdown do
  def sleep(seconds) do
    receive do
      after(seconds*1000) -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn ->
        {h, m, s} = :erlang.time
        60 - s - 1
      end,

      fn 0 ->
        {:halt, 0}
        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ -> end
    )
  end
end

defmodule Mycollections do
  @suit 'HDSC'
  @rank '23456789TJQKA'
  def deck() do
    for s_suit <- @suit , s_rank <- @drank, do: [s_suit, s_rank]
  end
end
