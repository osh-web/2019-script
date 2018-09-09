defmodule OSH.Router do
  @moduledoc false

  use Trot.Router

  post "/sandbox" do
    OSH.Sandbox.run()
    "sandobx success"
  end

  post "/" do
    OSH.run()
    "success"
  end

end
