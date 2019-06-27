defmodule Extrace.MixProject do
  use Mix.Project

  def project do
    [
      app: :extrace,
      version: "0.2.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Elixir wrapper for Recon Trace.",
      package: [
        name: "extrace",
        maintainers: ["redink"],
        licenses: ["Apache 2.0"],
        links: %{"GitHub" => "https://github.com/redink/extrace"}
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:recon, "~> 2.4"},
      {:ex_doc, "~> 0.19", only: [:dev, :test]}
    ]
  end
end
