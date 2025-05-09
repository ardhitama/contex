ExUnit.start()

defmodule Commons do
  @moduledoc false
  import Contex.Gallery.Sample, only: [safely_evaluate_svg: 1]

  # @doc """
  # Checks that a SVG is generated correctly and that
  # it is parsable.
  # """
  def test_svg_is_well_formed(files, opts \\ []) do
    path = Keyword.get(opts, :path, "lib/chart/gallery")
    aliases = Keyword.get(opts, :aliases, "00_aliases.sample")

    Enum.map(files, fn f ->
      {:ok, _source_code, svg, _time} =
        safely_evaluate_svg(["#{path}/#{aliases}", "#{path}/#{f}"])

      {:ok, _document} = Floki.parse_document(svg)
    end)

    # IO.puts(inspect(document))
  end
end
