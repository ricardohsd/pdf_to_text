defmodule ExPdfToText do
  @moduledoc """
  `ExPdfToText` gives you the text content of a PDF.

  If you have the PDF file content at hand, use `from_content/1`,
  if you have a file, use `from_path/1`.
  """

  mix_config = Mix.Project.config()
  version = mix_config[:version]
  github_url = mix_config[:package][:links]["GitHub"]

  use RustlerPrecompiled,
    otp_app: :ex_pdf_to_text,
    crate: :ex_pdf_to_text,
    base_url: "#{github_url}/releases/download/v#{version}",
    version: version,
    force_build: System.get_env("RUSTLER_PRECOMPILATION_BUILD") in ["1", "true"],
    nif_versions: ["2.16", "2.15"],
    targets: [
      "arm-unknown-linux-gnueabihf",
      "aarch64-unknown-linux-gnu",
      "aarch64-apple-darwin",
      "riscv64gc-unknown-linux-gnu",
      "x86_64-apple-darwin",
      "x86_64-unknown-linux-gnu",
      "x86_64-pc-windows-gnu",
      "x86_64-pc-windows-msvc"
    ]

  # When your NIF is loaded, it will override these functions.
  @doc """
  Extracts text from the pdf file content given
  """
  @spec from_content(String.t()) :: String.t()
  def from_content(_pdf_content), do: :erlang.nif_error(:nif_not_loaded)

  @doc """
  Extracts text from the pdf file given by its path.
  """
  @spec from_path(String.t()) :: String.t()
  def from_path(_pdf_path), do: :erlang.nif_error(:nif_not_loaded)
end
