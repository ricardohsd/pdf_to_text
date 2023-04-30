defmodule PdfToText.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :pdf_to_text,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      name: "PdfToText",
      description: "Converts PDF files into string",
      source_url: "https://github.com/ricardohsd/pdf_to_text",
      docs: [
        main: "PdfToText",
        extras: ["README.md"]
      ]
    ]
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ~w[
        lib
        native/pdf_to_text/src
        native/pdf_to_text/Cargo.*
        native/pdf_to_text/README.md
        native/pdf_to_text/.cargo
        checksum-Elixir.PdfToText.exs
        .formatter.exs
        mix.exs
        README.md
        LICENSE.md
        ],
      licenses: ["GNU GPL v2.0"],
      links: %{
        "GitHub" => "https://github.com/ricardohsd/pdf_to_text",
        "Docs" => "https://hexdocs.pm/pdf_to_text"
      },
      source_url: "https://github.com/ricardohsd/pdf_to_text"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler_precompiled, "~> 0.6"},
      {:rustler, ">= 0.28.0", optional: true},
      {:ex_doc, "~> 0.28", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3.0", only: [:dev, :test], runtime: false}
    ]
  end
end
