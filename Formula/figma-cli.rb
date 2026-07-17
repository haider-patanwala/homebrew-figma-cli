class FigmaCli < Formula
  desc "Control Figma Desktop from the CLI via a plugin bridge — no API key"
  homepage "https://github.com/haider-patanwala/figma-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/haider-patanwala/figma-cli/releases/download/v0.1.2/figma-cli-macos-arm64"
      sha256 "ef736b2dc30200d4be7bcb2a447080038b3e932d13f57eef0efe0f4c1fee2c33"
    end
  end

  def install
    bin.install stable.url.split("/").last => "figma-cli"
  end

  def caveats
    <<~EOS
      After installing, run:
        figma-cli connect

      Then load the plugin in Figma Desktop (one-time):
        Plugins → Development → Import plugin from manifest…
        Select: #{Dir.home}/.figma-ds-cli/plugin/manifest.json
    EOS
  end

  test do
    assert_match "figma-cli", shell_output("#{bin}/figma-cli --help")
  end
end
