defmodule OSH.Chatwork do
  @moduledoc """
  ChatWorkとのやり取りを担当する
  """

  use ExActor.GenServer, export: {:global, __MODULE__}

  require Logger

  defstart start_link(state), do: initial_state(state)

  defcast post(message, room_id), state: access_token do
    ChatworkEx.Endpoint.Rooms.Messages.post!(access_token, room_id, message)
    Logger.info("post message to ChatWork #{inspect({room_id, message})}")
    new_state(access_token)
  end
end
