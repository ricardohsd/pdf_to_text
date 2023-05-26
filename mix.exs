defmodule ExPdfToText.MixProject do
  use Mix.Project

  @url "https://github.com/ricardohsd/ex_pdf_to_text"
  @version "0.0.1"

  def project do
    [
      app: :ex_pdf_to_text,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      name: "ExPdfToText",
      description: "Converts PDF files into string",
      source_url: @url,
      docs: [
        main: "ExPdfToText",
        extras: ["README.md"]
      ]
    ]
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ~w[
        lib
        native/ex_pdf_to_text/src
        native/ex_pdf_to_text/Cargo.*
        native/ex_pdf_to_text/README.md
        native/ex_pdf_to_text/.cargo
        checksum-Elixir.ExPdfToText.exs
        .formatter.exs
        mix.exs
        README.md
        LICENSE.md
        ],
      licenses: ["GNU GPL v2.0"],
      links: %{
        "GitHub" => @url,
        "Docs" => "https://hexdocs.pm/ex_pdf_to_text"
      },
      source_url: @url
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
      {:rustler, "~> 0.27.0", optional: true},
      {:ex_doc, "~> 0.28", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      fmt: [
        "format",
        "cmd cargo fmt --manifest-path native/ex_pdf_to_text/Cargo.toml"
      ]
    ]
  end
end
