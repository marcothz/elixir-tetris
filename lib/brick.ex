defmodule Tetris.Brick do

  defstruct [
    name: :i,
    location: {40,0},
    rotation: 0,
    reflection: false,
  ]

  def new(), do: __struct__()
  
  def new_random() do
    %__MODULE__{
      name: random_name(),
      location: {40,0},
      rotation: random_rotation(),
      reflection: random_reflection(),
    }
  end

  def down(brick) do
    %{brick| location: point_down(brick.location)}
  end

  def left(brick) do
    %{brick| location: point_left(brick.location)}
  end

  def right(brick) do
    %{brick| location: point_right(brick.location)}
  end

  def spin(brick) do
    %{brick| rotation: rotate(brick.rotation)}
  end

  defp point_down({x, y}) do
    {x, y + 1}
  end

  defp point_left({x, y}) do
    {x - 1, y}
  end

  defp point_right({x, y}) do
    {x + 1, y}
  end

  defp rotate(270), do: 0
  defp rotate(degrees), do: degrees + 90

  defp random_name() do
    ~w(i l z o t)a
    |> Enum.random
  end

  defp random_reflection() do
    [true, false]
    |> Enum.random
  end

  defp random_rotation() do
    [0, 90, 180, 270]
    |> Enum.random
  end

end
