defmodule OSHTest do
  use ExUnit.Case

  alias OSH.Couwndown

  doctest OSH

  test "message" do
    assert "[info]オープンセミナー2019@広島まであと1日[/info]" == Countdown.message(1)
  end
end
