defmodule Extrace.LimitFormatter do
  @moduledoc """
  This module handles formatting `Map` & `Struct`.
  more details can be found `:recon_map`.
  """
  import Inspect.Algebra

  @doc """
  Formatting & Trimming output to selected fields.
  """
  def limit_inspect(term, opts) when is_map(term) do
    case term do
      %module{} ->
        # struct data
        case process_map(term) do
          {_, term} ->
            infos = struct_infos(module, term)

            Inspect.Any.inspect(
              term,
              Macro.inspect_atom(:literal, module),
              infos,
              opts
            )

          _ ->
            Inspect.inspect(term, opts)
        end

      _ ->
        # map data
        term
        |> process_map()
        |> inspect_limited_map(opts)
    end
  end

  defp struct_infos(module, map) do
    for %{field: field} = info <- module.__info__(:struct),
        field in Map.keys(map),
        do: info
  end

  def limit_inspect(term, opts) do
    Inspect.inspect(term, opts)
  end

  defp process_map(old_term) do
    with true <- :recon_map.is_active(),
         {label, term} <- :recon_map.process_map(old_term),
         true <- Map.keys(old_term) != Map.keys(term) do
      {label, term}
    else
      _ ->
        old_term
    end
  end

  defp inspect_limited_map({_label, map}, opts) do
    opts = %{opts | limit: min(opts.limit, map_size(map))}
    map = Map.to_list(map)
    open = color("%{", :map, opts)
    sep = color(",", :map, opts)
    close = color("}", :map, opts)

    traverse_fun =
      if Inspect.List.keyword?(map) do
        &Inspect.List.keyword/2
      else
        sep = color(" => ", :map, opts)

        fn {key, value}, opts ->
          concat(concat(to_doc(key, opts), sep), to_doc(value, opts))
        end
      end

    container_doc(open, map ++ [:...], close, opts, traverse_fun, separator: sep, break: :strict)
  end

  defp inspect_limited_map(map, opts) do
    Inspect.Map.inspect(map, opts)
  end
end
