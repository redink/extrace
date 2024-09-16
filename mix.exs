defmodule Extrace.MixProject do
  use Mix.Project

  @source_url "https://github.com/redink/extrace"
  @version "0.6.0"

  def project do
    [
      app: :extrace,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:recon, "~> 2.5"},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      name: "extrace",
      description: "Elixir wrapper for Recon Trace.",
      maintainers: ["redink"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end

  defp docs do
    [
      extras: [
        "ORIGINAL-LICENSE.md": [title: "Original License"],
        LICENSE: [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      formatters: ["html"]
    ]
  end
end
