defmodule OshTest do
  use ExUnit.Case
  doctest Osh

  test "greets the world" do
    assert Osh.hello() == :world
  end
end
