defmodule BrickTest do

  use ExUnit.Case

  import Tetris.Brick

  test "Creates a new brick" do
    assert new().name == :i
  end

  test "Creates a new random brick" do
    actual = new_random()

    assert actual.name in ~w(i l z t o)a
    assert actual.rotation in [0, 90, 180, 270]
    assert actual.reflection in [true, false]
  end

  test "Should manipulate brick" do
    actual = 
      new()
      |> left
      |> right
      |> right
      |> down
      |> spin
      |> spin

    assert actual.location == {41, 1}
    assert actual.rotation == 180
  end


end
