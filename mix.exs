defmodule Osh.MixProject do
  use Mix.Project

  def project do
    [
      app: :osh,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {OSH, []},
      applications: [:trot],
      extra_applications: [:logger, :timex],
      env: [port: System.get_env("PORT") || 4000]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:chatwork_ex, "~> 0.0.1"},
      {:exactor, "~> 2.2.4", warn_missing: false},
      {:timex, "~> 3.1"},
      {:trot, "~> 0.7.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
