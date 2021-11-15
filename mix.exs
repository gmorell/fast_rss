defmodule FastRSS.MixProject do
  use Mix.Project

  @source_url "https://github.com/avencera/fast_rss"
  @version "0.3.6"

  def project do
    [
      app: :fast_rss,
      version: @version,
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # hex
      description: "Fast Elixir RSS feed parser, a NIF wrapper around the Rust RSS crate",
      package: package(),

      # docs
      homepage_url: "https://avencera.github.io/fast_rss/",
      docs: docs(),

      # rustler
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: [fastrss: []]
    ]
  end

  defp package() do
    [
      files: ["lib", "native", "mix.exs", "README.md", "LICENSE.md"],
      maintainers: ["Praveen Perera"],
      licenses: ["Apache-2.0"],
      links: %{
        "Changelog" => "#{@source_url}/blob/master/CHANGELOG.md",
        "GitHub" => @source_url
      }
    ]
  end

  defp docs() do
    [
      main: "readme",
      markdown_processor: ExDoc.Markdown.Earmark,
      extras: ["README.md", "CHANGELOG.md", "LICENSE.md"],
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # rust
      # {:rustler, "~> 0.21.0"},
      {:rustler, git: "https://github.com/rusterlium/rustler.git", tag: "rustler-0.22.2", override: true, sparse: "rustler_mix"},

      # docs
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
