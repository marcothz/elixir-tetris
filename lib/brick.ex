defmodule Tetris.Brick do

  defstruct [
    name: :i,
    location: {40,0},
    rotation: 0,
    reflection: false,
  ]

  def new() do
    __struct__()
  end

  def new_random() do
    %Tetris.Brick{
      name: random_name(),
      location: {40,0},
      rotation: random_rotation(),
      reflection: random_reflection(),
    }
  end

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