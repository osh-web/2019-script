defmodule OSH do
  @moduledoc """
  オープンセミナー2019@広島を運営する上で使うスクリプト集
  """

  use Application

  def start(_type, _args) do
    access_token = System.get_env("CHATWORK_API_TOKEN")
    children = [
      {OSH.Countdown.Server, []},
      {OSH.Chatwork.Server, access_token},
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @doc """
  オープンセミナー2019@広島までの日数をチャットワークに投稿する
  """
  def countdown do
    room_id = 111443820
    OSH.Countdown.cast(room_id)
  end

  @doc """
  オープンセミナー2019@広島までの日数をチャットワークに投稿する(テスト用)
  """
  def countdown_sandbox do
    room_id = 59522447
    OSH.Countdown.cast(room_id)
  end
end
