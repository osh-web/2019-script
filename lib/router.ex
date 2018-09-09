defmodule OSH.Router do
  @moduledoc false

  use Trot.Router

  post "/" do
    OSH.run()
    "success"
  end

end
