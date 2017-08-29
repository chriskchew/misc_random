defmodule Misc.Random.Mixfile do
  use Mix.Project

  def project do
    [
      app: :misc_random,
      version: "1.0.0",
      elixir: "~> 1.4",
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/indyone/misc_random",
      docs: [main: "readme", extras: ["README.md"]],
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.16", only: [:dev], runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end

  defp description do
    """
    This is a very thin wrapper around erlang's rand:uniform method. It allows
    you to create random strings or numbers.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Martin Gutsch", "Ioannis Stavrinos"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/indyone/misc_random",
        # "Docs" => "https://hexdocs.pm/misc_random/",
      }
    ]
  end

end
