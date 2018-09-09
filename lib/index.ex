defmodule OSH do
  @moduledoc """
  オープンセミナー2019@広島を運営する上で使うスクリプト集
  """

  use Application

  require Logger

  def start(_type, _args) do
    access_token = System.get_env("CHATWORK_API_TOKEN")
    children = [
      {OSH.Countdown, []},
      {OSH.Chatwork, access_token},
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def run do
    Logger.info("start task")
    countdown()
  end

  @doc """
  オープンセミナー2019@広島までの日数をチャットワークに投稿する
  """
  def countdown do
    System.get_env("CHATWORK_ROOM_ID")
    |> String.to_integer()
    |> OSH.Countdown.run()
  end
end
