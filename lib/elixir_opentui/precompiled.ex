defmodule ElixirOpentui.Precompiled do
  @moduledoc """
  Download URLs and SHA256 hashes for prebuilt NIF binaries.

  Zero-dependency module — must not reference any NIF module to avoid
  circular compile dependencies. Zigler's `normalize_shasum/1` returns
  `nil` for platforms not listed here, causing `precompiled:` to resolve
  to `nil` and triggering source compilation as a fallback.
  """

  @version Mix.Project.config()[:version]
  @base_url "https://github.com/TudorAndrei/elixir-opentui/releases/download/v#{@version}"

  @doc "Precompiled config for ElixirOpentui.NIF"
  def nif_precompiled do
    {:web, "#{@base_url}/Elixir.ElixirOpentui.NIF.#TRIPLE.#EXT", nif_shasums()}
  end

  @doc "Precompiled config for ElixirOpentui.EditBufferNIF"
  def edit_buffer_nif_precompiled do
    {:web, "#{@base_url}/Elixir.ElixirOpentui.EditBufferNIF.#TRIPLE.#EXT",
     edit_buffer_nif_shasums()}
  end

  # Populated by CI after running `mix zig.precompile`.
  # Platforms not listed fall back to source compilation.
  defp nif_shasums do
    [
      "aarch64-freebsd-none": "f47ce5d1c70e6088d95759f172166d01bf35e3d6cead6f4c93db83b83ed68d06",
      "aarch64-linux-gnu": "6633a8b121bf411878d7668b455ab7f77f1f30f9daecd3ec1d50c83708f10162",
      "aarch64-linux-musl": "374ec5fe765acd53991e51f34d53cc2aa0abf01fda52b6a11b78d1a2a31d8165",
      "aarch64-macos-none": "9932b4e5cb209175e46bc718a42ba384c53f110a2a94612a894aa73c5abaa21e",
      "x86_64-freebsd-none": "344cb12a6e8668656bc14c0a112d66dac26d7e7c84d1dae85df74bb9794a97d6",
      "x86_64-linux-gnu": "7872627c05c71c0b8fe847e4a1602c6e93a5d841c96b4aa60db471c61d59e20a",
      "x86_64-linux-musl": "2a7578fd33ba7db3969a97b766d21f00b742ad1a21606077937647adcae078ae",
      "x86_64-macos-none": "7da3a239a34dad5691a4a47339c48c71e59450cffc554cb6929d6e1aa9e00d59"
    ]
  end

  defp edit_buffer_nif_shasums do
    [
      "aarch64-freebsd-none": "28f2bf160cbcb499093cbd67e1ced3ec5320a724b97d35c8c6be38068dd4720a",
      "aarch64-linux-gnu": "d763a0b6711f78d6e72176ef07e1333c14b61f4693e7c9d4b77c08a171196881",
      "aarch64-linux-musl": "da7e5c8ef677fcd853029ec599ab33fbad20110ac4dfcfec119c8ec6299b7fe6",
      "aarch64-macos-none": "5a7f6d72fffef148586b891de8cfeeb4b59134d287f581c411a33d799c6f2e04",
      "x86_64-freebsd-none": "d00527c34224ce82efdd16a99225f0dd122a7c7d982836e2ead60545f6c5650e",
      "x86_64-linux-gnu": "d967c003933f3a603cc6cfbd62097d94dcdcedd7d2cc7e105152a1bc8a60b063",
      "x86_64-linux-musl": "7b66a5718c86ada3d0ec2e573c0115b392c34341d81a9bbfb96665e0e0b30310",
      "x86_64-macos-none": "7cb8d6f731e2e068cbed7fa431a849dbeb201466a77efde69dbdf39deabe3336"
    ]
  end
end
