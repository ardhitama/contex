defmodule ContexLegendTest do
  use ExUnit.Case

  import SweetXml

  alias Contex.Dataset
  alias Contex.PointPlot

  describe "to_svg/2" do
    test "returns properly formatted legend" do
      plot =
        [{1, 2, 3, 4}, {4, 5, 6, 4}, {-3, -2, -1, 0}]
        |> Dataset.new(["aa", "bb", "cccc", "d"])
        |> PointPlot.new()

      {:safe, svg} =
        150
        |> Contex.Plot.new(150, plot)
        |> Contex.Plot.plot_options(%{legend_setting: :legend_right})
        |> Contex.Plot.to_svg()

      legend =
        svg
        |> IO.chardata_to_string()
        |> xpath(~x"//g[@class='exc-legend']",
          box: [
            ~x"./rect",
            x: ~x"./@x"s,
            y: ~x"./@y"s,
            height: ~x"./@height"s,
            width: ~x"./@width"s,
            style: ~x"./@style"s
          ],
          text: [
            ~x"./text",
            x: ~x"./@x"s,
            y: ~x"./@y"s,
            text_anchor: ~x"./@text-anchor"s,
            dominant_baseline: ~x"./@dominant-baseline"s,
            text: ~x"./text()"s
          ]
        )

      # The other attributes are not tested because they are hard-coded.
      assert %{y: "0", style: "fill:#1f77b4;"} = legend.box
      assert %{y: "9.0", text: "bb"} = legend.text
    end
  end
end
