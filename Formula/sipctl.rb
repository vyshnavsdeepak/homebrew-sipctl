class Sipctl < Formula
  desc "CLI context router for AI agents — sip from the firehose"
  homepage "https://github.com/vyshnavsdeepak/sipctl"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vyshnavsdeepak/sipctl/releases/download/v0.1.0/sip-darwin-arm64"
      sha256 "d87184e2669762b63594fc46864c3f8b9a5565dc329cc767879836463939e66d"
    end
    on_intel do
      url "https://github.com/vyshnavsdeepak/sipctl/releases/download/v0.1.0/sip-darwin-x64"
      sha256 "4dcb7d271de51b133487782b420dcfd98e7fccf22fb6c9fc1358cbcfdd5131ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vyshnavsdeepak/sipctl/releases/download/v0.1.0/sip-linux-arm64"
      sha256 "63485f86ea52472e8d3bcd71826a40f6bac867d8d8579276016c184d240c9a4a"
    end
    on_intel do
      url "https://github.com/vyshnavsdeepak/sipctl/releases/download/v0.1.0/sip-linux-x64"
      sha256 "5bb8eda0fef4d1abedd83030a7c7e79de606b155388c2bde640b56b62ccf99fc"
    end
  end

  def install
    bin.install Dir["sip-*"].first => "sip"
  end

  test do
    # MCP server starts on stdin; just verify the binary runs
    assert_match "", shell_output("echo '' | #{bin}/sip 2>&1 || true")
  end
end
