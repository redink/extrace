# Extrace

[![Hex.pm Version](https://img.shields.io/hexpm/v/extrace.svg?style=flat-square)](https://hex.pm/packages/extrace)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg?style=flat-square)](https://hexdocs.pm/extrace/)
[![Total Download](https://img.shields.io/hexpm/dt/extrace.svg?style=flat-square)](https://hex.pm/packages/extrace)
[![License](https://img.shields.io/hexpm/l/extrace.svg?style=flat-square)](https://github.com/redink/extrace/blob/master/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/redink/extrace.svg?style=flat-square)](https://github.com/redink/extrace/commits/master)

Extrace is an Elixir wrapper for [Recon Trace](https://ferd.github.io/recon/recon_trace.html).

## Installation

The package can be installed by adding `:extrace` to your list of dependencies
in `mix.exs`:

```elixir
def deps do
  [
    {:extrace, "~> 0.3.0"}
  ]
end
```

## Examples

Set point:

```elixir
iex> Extrace.calls([{Enum, :take_random, fn _ -> :return end}, {Enum, :count, fn _ -> :return end}], 100, [scope: :local])
4
```

Note that the functions to be traced (`:take_random` and `:count` in the example above) can only be private if `scope: :local` is set.

One function executed:

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

Another function executed:

```elixir
iex(4)> Enum.count([1,2,3,4])
4

18:42:27.383667 <0.183.0> Enum.count([1, 2, 3, 4])

18:42:27.383795 <0.183.0> Enum.count/1 --> 4
```

## Copyright and License

Copyright (c) 2015, 2016 Tatsuya Kawano under [MIT License](./ORIGINAL-LICENSE.md). Fork from [https://github.com/tatsuya6502/recon_ex](https://github.com/tatsuya6502/recon_ex)

Copyright (c) 2019 redink

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
