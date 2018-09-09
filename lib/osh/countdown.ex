defmodule OSH.Countdown do
  @moduledoc """
  オープンセミナー2019@広島までの日数を返す

  ## Examples

      iex> Osh.Coundown.countdown()
      4
  """

  use Timex

  def cast(room_id) do
    GenServer.cast(OSH.Countdown.Server, {:countdown, room_id})
  end

  def countdown(room_id) do
    day()
    |> message()
    |> chatwork(room_id)
  end

  def chatwork(message, room_id) do
    access_token = System.get_env("CHATWORK_API_TOKEN")
    ChatworkEx.Endpoint.Rooms.Messages.post!(access_token, room_id, message)
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

defmodule OSH.Countdown.Server do
  use GenServer

  @doc """
  オープンセミナー2019@広島までの日数をつたえるチャットワーク用のメッセージを作成
  """
  def countdown do
    GenServer.cast(__MODULE__, {:countdown})
  end

  def start_link(_), do: GenServer.start_link(__MODULE__, [], name: __MODULE__)

  def init(state), do: {:ok, state}

  def handle_cast({:countdown, room_id}, state) do
    OSH.Countdown.countdown(room_id)
    {:noreply, state}
  end
end
