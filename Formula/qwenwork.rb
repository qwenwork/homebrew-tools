# Release metadata is filled by npm run package:brew.
class Qwenwork < Formula
  desc "Qwen Code with Qwen Work account login"
  homepage "https://file.teambition.net/public/homebrew"
  version "0.26.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.3/qwen-code-darwin-arm64.tar.gz"
      sha256 "22d2ecd03535d4879fc92fd3096111ed4bb02a38e99c5e117489a1bf213edf94"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.3/qwen-code-darwin-x64.tar.gz"
      sha256 "92800fe1f1377223c6e01c6e499eb11361d05bae3ab9d8bb8f0aaf1d423c23e9"
    end
  end

  on_linux do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.3/qwen-code-linux-arm64.tar.gz"
      sha256 "66318cc83025cd0d482d3508d84359628432bc771505cf83b49be8a97f5f463f"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.3/qwen-code-linux-x64.tar.gz"
      sha256 "5239148f7383dc2236f3a6e279fc4f2b3cf1984b5b3070948f763fe86e919e4f"
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
