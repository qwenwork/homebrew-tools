# Release metadata is filled by npm run package:brew.
class Qwenwork < Formula
  desc "Qwen Code with Qwen Work account login"
  homepage "https://file.teambition.net/public/homebrew"
  version "0.26.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.4/qwen-code-darwin-arm64.tar.gz"
      sha256 "94e02c521d0bc38e1d5ba2696e906890cdaba09d252cb65d26bf007af0b615b6"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.4/qwen-code-darwin-x64.tar.gz"
      sha256 "3292e97209995c758e144849cca713ee8a05ab9dea21f9aca8503f77439207db"
    end
  end

  on_linux do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.4/qwen-code-linux-arm64.tar.gz"
      sha256 "50159b2b3889b2f4ecefbe538687414a85fedcb39115925b20991b861d45e115"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.4/qwen-code-linux-x64.tar.gz"
      sha256 "1c19df6e95cdaffd219b88c1b0a81208b1a3242b14d9c2317c3d4c64c08c2c27"
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
