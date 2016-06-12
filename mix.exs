defmodule PhoenixSwoosh.Mixfile do
  use Mix.Project

  @version "0.1.1"

  def project do
    [app: :phoenix_swoosh,
     version: @version,
     elixir: "~> 1.2",
     compilers: compilers(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,

     # Hex
     description: description,
     package: package,

     # Docs
     name: "Phoenix.Swoosh",
     docs: [source_ref: "v#{@version}", main: "Phoenix.Swoosh",
            canonical: "http://hexdocs.pm/phoenix_swoosh",
            source_url: "https://github.com/swoosh/phoenix_swoosh"]]
  end

  defp compilers(:test), do: [:phoenix] ++ Mix.compilers
  defp compilers(_), do: Mix.compilers

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:swoosh, "~> 0.1"},
     {:phoenix, "~> 1.0 or ~> 1.2.0-rc"},
     {:phoenix_html, "~> 2.2"},
     {:credo, "~> 0.3", only: [:dev, :test]},
     {:ex_doc, "~> 0.10", only: :docs},
     {:earmark, "~> 0.1", only: :docs},
     {:inch_ex, ">= 0.0.0", only: :docs}]
  end

  defp description do
    """
    Use Swoosh to easily send emails in your Phoenix project.
    """
  end

  defp package do
    [maintainers: ["Steve Domin"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/swoosh/phoenix_swoosh"}]
  end
end
