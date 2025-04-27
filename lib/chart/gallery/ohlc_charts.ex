defmodule Contex.Gallery.OHLCCharts do
  @moduledoc """
  A gallery of OHLC Charts.

  > #### Have one to share? {: .warning}
  >
  > Do you have an interesting plot you want to
  > share? Something you learned the hard way that
  > should be here, or that's just great to see?
  > Just open a ticket on GitHub and we'll post it here.


  """

  import Contex.Gallery.Sample, only: [graph: 1]

  @doc """
  Some OHLC charts.


  #{graph(title: "A simple candle OHLC chart",
  file: "ohlc_candle.sample")}

  #{graph(title: "A simple tick OHLC chart",
  file: "ohlc_tick.sample")}


  """
  def plain, do: 0
end
