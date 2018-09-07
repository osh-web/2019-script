defmodule OSH do
  @moduledoc """
  オープンセミナー2019@広島を運営する上で使うスクリプト集
  """

  use Application

  def start(_type, _args) do
    children = [
      {OSH.Countdown.Server, []}
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @doc """
  オープンセミナー2019@広島までの日数をチャットワークに投稿する
  """
  def countdown do
    OSH.Countdown.cast()
  end
end
