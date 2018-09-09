defmodule OSH.Chatwork do
  @moduledoc false

  def post(message, room_id) do
    GenServer.cast(OSH.Chatwork.Server, {:post, room_id, message})
  end
end

defmodule OSH.Chatwork.Server do
  @moduledoc false

  use GenServer

  def start_link(access_token) do
    GenServer.start_link(__MODULE__, access_token, name: __MODULE__)
  end

  def init(access_token) do
    {:ok, access_token}
  end

  def handle_cast({:post, room_id, message}, access_token) do
    ChatworkEx.Endpoint.Rooms.Messages.post!(access_token, room_id, message)
    {:noreply, access_token}
  end
end

