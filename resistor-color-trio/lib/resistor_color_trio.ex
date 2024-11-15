defmodule ResistorColorTrio do
  @colors_map %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    [first, second, zeros] = Enum.take(colors, 3)

    value =
      to_string(@colors_map[first]) <>
        to_string(@colors_map[second]) <> String.duplicate("0", @colors_map[zeros])

    int_value = String.to_integer(value)

    {res, unit} =
      case count_zeros(value) do
        x when x < 3 -> {int_value, :ohms}
        x when x >= 3 and x < 6 -> {div(int_value, 1000), :kiloohms}
        x when x >= 6 and x < 9 -> {div(int_value, 100_000), :megaohms}
        x when x >= 9 -> {div(int_value, 1_000_000_000), :gigaohms}
        _ -> {div(int_value, 1_000_000_000), :gigaohms}
      end

    if unit in [:ohms, :kiloohms] do
      {res, unit}
    else
      case count_zeros(to_string(res)) do
        0 -> {res, unit}
        how_much -> {div(res, how_much * 10), unit}
      end
    end
  end

  defp count_zeros(value) do
    value
    |> String.split("")
    |> Enum.reduce(0, fn x, acc -> if x == "0", do: acc + 1, else: acc end)
  end
end
