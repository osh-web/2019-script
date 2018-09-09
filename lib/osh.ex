defmodule OSH do
  @moduledoc """
  オープンセミナー2019@広島を運営する上で使うスクリプト集
  """

  use Application

  def start(_type, _args) do
    access_token = System.get_env("CHATWORK_API_TOKEN")
    children = [
      {OSH.Countdown, []},
      {OSH.Chatwork, access_token},
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @doc """
  オープンセミナー2019@広島までの日数をチャットワークに投稿する
  """
  def countdown do
    room_id = 111443820
    OSH.Base.countdown(room_id)
  end
end

defmodule OSH.Sandbox do
  @doc """
  オープンセミナー2019@広島までの日数をチャットワークに投稿する(テスト用)
  """
  def countdown do
    room_id = 59522447
    OSH.Base.countdown(room_id)
  end
end

defmodule OSH.Base do
  def countdown(room_id) do
    OSH.Countdown.run(room_id)
  end
end

