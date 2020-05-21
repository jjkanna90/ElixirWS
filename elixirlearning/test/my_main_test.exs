defmodule MyMainTest do
  use ExUnit.Case
  doctest MyMain

  test "greets the world" do
    assert MyMain.hello() == :world
  end
end
