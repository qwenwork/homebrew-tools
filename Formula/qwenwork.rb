# Release metadata is filled by npm run package:brew.
class Qwenwork < Formula
  desc "Qwen Code with Qwen Work account login"
  homepage "https://file.teambition.net/public/homebrew"
  version "0.26.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.1/qwen-code-darwin-arm64.tar.gz"
      sha256 "87806bb25a48eb614667385bfa60e55be0bacf5f9287a8677cda6dfd55c02817"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.1/qwen-code-darwin-x64.tar.gz"
      sha256 "7cd5d77a54e402772b31b4b55cf18e45c840daec1157065494d87498c8967cd0"
    end
  end

  on_linux do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.1/qwen-code-linux-arm64.tar.gz"
      sha256 "611d50678d11afa2e0476d6e5b160340d4d5b23763fc97509ca666ac6bc68ba2"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.1/qwen-code-linux-x64.tar.gz"
      sha256 "3b41457538cab2b6e7fe90f9431c02cb14142b5ea20bdf27dcc1370e272379a9"
    end
  end

  def install
    libexec.install Dir["*"]
    # The standalone launcher resolves its runtime relative to its own path.
    # Execute that launcher directly rather than symlinking it into brew's bin.
    (bin/"qwenwork").write_env_script libexec/"bin/qwen", {}
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qwenwork --version")
  end
end
