defmodule OSH.Countdown do
  @moduledoc """
  オープンセミナー2019@広島までの日数を返す

  ## Examples

      iex> OSH.Countdown.run()
      4
  """

  use ExActor.GenServer, export: {:global, __MODULE__}
  use Timex

  defstart start_link(_), do: initial_state([])

  @doc """
  オープンセミナー2019@広島までの日数をつたえるチャットワーク用のメッセージを作成
  """
  defcast run(room_id), state: state do
    countdown(room_id)
    new_state(state)
  end

  def countdown(room_id) do
    day()
    |> message()
    |> OSH.Chatwork.post(room_id)
  end


  @doc """
  オープンセミナー2019@広島までの日数を返す
  """
  @spec day :: integer
  def day do
    day = ~D[2019-02-23]
    today = Timex.now()
            |> Timex.to_date
    Date.diff(day, today)
  end

  @doc """
  残り日数を受け取ってチャットワークに投稿するテキストを生成
  """
  @spec message(integer) :: bitstring
  def message(day) when day >= 0 do
    "[info]オープンセミナー2019@広島まであと#{day}日[/info]"
  end
end
