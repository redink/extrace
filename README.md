# Extrace

Extrace is an Elixir wrapper for [Recon Trace](https://ferd.github.io/recon/recon_trace.html).

## Example

1, set point

```elixir
iex(1)> Extrace.calls([{Enum, :take_random, fn _ -> :return end}, {Enum, :count, fn _ -> :return end}], 100, [scope: :local])
4
```

2, one function executed

```elixir
iex(2)> Enum.take_random([1,2,3,4], 200)
[2, 4, 3, 1]

18:42:10.834670 <0.183.0> Enum.take_random([1, 2, 3, 4], 200)

18:42:10.840212 <0.183.0> Enum.take_random(%{0 => 2, 1 => 4, 2 => 3, 3 => 1}, 4, [])

18:42:10.840949 <0.183.0> Enum.take_random(%{0 => 2, 1 => 4, 2 => 3, 3 => 1}, 3, [1])

18:42:10.841064 <0.183.0> Enum.take_random(%{0 => 2, 1 => 4, 2 => 3, 3 => 1}, 2, [3, 1])

18:42:10.841202 <0.183.0> Enum.take_random(%{0 => 2, 1 => 4, 2 => 3, 3 => 1}, 1, [4, 3, 1])

18:42:10.841330 <0.183.0> Enum.take_random(%{0 => 2, 1 => 4, 2 => 3, 3 => 1}, 0, [2, 4, 3, 1])

18:42:10.841440 <0.183.0> Enum.take_random/3 --> [2, 4, 3, 1]

18:42:10.841521 <0.183.0> Enum.take_random/3 --> [2, 4, 3, 1]

18:42:10.841606 <0.183.0> Enum.take_random/3 --> [2, 4, 3, 1]

18:42:10.841685 <0.183.0> Enum.take_random/3 --> [2, 4, 3, 1]

18:42:10.841959 <0.183.0> Enum.take_random/3 --> [2, 4, 3, 1]

18:42:10.842046 <0.183.0> Enum.take_random/2 --> [2, 4, 3, 1]
```

3, another function executed

```elixir
iex(4)> Enum.count([1,2,3,4])
4

18:42:27.383667 <0.183.0> Enum.count([1, 2, 3, 4])

18:42:27.383795 <0.183.0> Enum.count/1 --> 4
```

## Other
Original library [repository](https://github.com/tatsuya6502/recon_ex)
