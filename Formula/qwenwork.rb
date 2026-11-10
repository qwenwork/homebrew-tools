# Release metadata is filled by npm run package:brew.
class Qwenwork < Formula
  desc "Qwen Code with Qwen Work account login"
  homepage "https://file.teambition.net/public/homebrew"
  version "0.26.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.5/qwen-code-darwin-arm64.tar.gz"
      sha256 "62730fe657e2d53fe42107b56363ba80f2efe8f85db790ce080799abe60930be"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.5/qwen-code-darwin-x64.tar.gz"
      sha256 "2442cdd4b987242dc09728ab4d09a69899b4b08d26f2ba9d27c531885db7bd73"
    end
  end

  on_linux do
    on_arm do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.5/qwen-code-linux-arm64.tar.gz"
      sha256 "269b08a03ae5609a12736323dfa52972a9335d870f60bda0182d1e016d952202"
    end
    on_intel do
      url "https://file.teambition.net/public/homebrew/qwenwork-0.26.5/qwen-code-linux-x64.tar.gz"
      sha256 "17044110fdc703dbcad042103b78cd270b97ddef43852a3e7b624fdcfd6fec42"
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
