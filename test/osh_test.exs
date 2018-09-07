defmodule OSHTest do
  use ExUnit.Case
  doctest OSH

  test "message" do
    assert "[info]オープンセミナー2019@広島まであと1日[/info]" == OSH.Countdown.message(1)
  end
end
