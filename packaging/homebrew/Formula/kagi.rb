class Kagi < Formula
  desc "Agent-native Rust CLI for Kagi subscribers with JSON-first output"
  homepage "https://github.com/Microck/kagi-cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Microck/kagi-cli/releases/download/v0.1.6/kagi-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "bbd5c4093e459357ec1b8a1162d043c776ae93732b17412dd434af446bd71d52"
    end

    if Hardware::CPU.intel?
      url "https://github.com/Microck/kagi-cli/releases/download/v0.1.6/kagi-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "af69180d48e2019938c4088ffc276e373dda81685b9b1b15bdfbeb30ca2e441e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Microck/kagi-cli/releases/download/v0.1.6/kagi-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b7902f8a39e14342e1c7e5d712b28b8de8bf3619aaabd5cd044d39ca54025af"
    end

    if Hardware::CPU.intel?
      url "https://github.com/Microck/kagi-cli/releases/download/v0.1.6/kagi-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dda9322bba71d3cb109bc610dfd2701675523573341bbf913c620f02c2c0cb7c"
    end
  end

  def install
    bin.install "kagi"
  end

  test do
    assert_match "Usage: kagi <COMMAND>", shell_output("#{bin}/kagi --help")
  end
end
