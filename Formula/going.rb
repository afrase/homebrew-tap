# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Going < Formula
  desc "Simple CLI tool for working with AWS."
  homepage ""
  version "0.0.5"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/afrase/going/releases/download/v0.0.5/going_Darwin_arm64.tar.gz"
      sha256 "a65292be2f26cb9efc0a930c2f898fa0384faa6310eb79934b7a7cbf53a051a7"

      def install
        bin.install "going"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/afrase/going/releases/download/v0.0.5/going_Darwin_x86_64.tar.gz"
      sha256 "c28c4146fc5640e1ddf4de4b3ffc70bed65f68776c282d6ade9fa5f77cd154e4"

      def install
        bin.install "going"
      end
    end
  end
end
