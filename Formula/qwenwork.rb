# Release metadata is filled by npm run package:brew.
class Qwenwork < Formula
  desc "Qwen Code with Qwen Work account login"
  homepage "https://file.teambition.net/public/homebrew"
  version "0.26.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.2/qwen-code-darwin-arm64.tar.gz"
      sha256 "f80be536d50f53947cc79f9ead9bb52b1fe7c2d8636b68f0aa45b417ca749a2f"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.2/qwen-code-darwin-x64.tar.gz"
      sha256 "226ea9629603fdc4f67093f2a8ef8a3a7e29eb9773f5928f95ce1ad6bebe169e"
    end
  end

  on_linux do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.2/qwen-code-linux-arm64.tar.gz"
      sha256 "8404b94f7c406ba667cebae3fe5ca2469f7247e389e59fc68f2da3e315e8d8b4"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.2/qwen-code-linux-x64.tar.gz"
      sha256 "ce510b9433955188d5811a9644314e11900f49e2224a9c943a8187333b07b192"
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
