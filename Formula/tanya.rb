# Homebrew Formula for the Tanya CLI.
#
# The CLI is a thin Bash shim that wraps the Tanya brain-server HTTP
# surface. Subcommands : chat, health, skills search, synthesis,
# version, help. Config is read from $TANYA_BASE_URL +
# $TANYA_API_TOKEN (env or ~/.config/tanya/config).
#
# Tested on macOS arm64 + Linuxbrew x86_64.
class Tanya < Formula
  desc "CLI for the Tanya brain-server (chat, skills, synthesis, health)"
  homepage "https://github.com/kaaboliveri/tanya-godlike-ai"
  url "https://github.com/kaaboliveri/homebrew-tap/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "68500fb0845791bab0db3c89f2cf68f9d37860c45f2176b0e7445441ed28b73c"
  license "MIT"
  version "0.1.0"

  depends_on "bash"
  depends_on "python@3" => :recommended

  def install
    bin.install "bin/tanya"
    # POSIX-shebang shim — re-target /usr/bin/env bash so Linuxbrew
    # picks up Homebrew's bash when /bin/bash is too old.
    inreplace bin/"tanya", %r{^#!/usr/bin/env bash}, "#!#{Formula["bash"].opt_bin}/bash"
  end

  test do
    output = shell_output("#{bin}/tanya version")
    assert_match "tanya 0.1", output
    help_output = shell_output("#{bin}/tanya help")
    assert_match "CLI for the Tanya brain-server", help_output
  end
end
