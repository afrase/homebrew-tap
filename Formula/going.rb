# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Going < Formula
  desc "Simple CLI tool for working with AWS."
  homepage ""
  version "0.0.9"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/afrase/going/releases/download/v0.0.9/going_Darwin_arm64.tar.gz"
      sha256 "4afacea20be061bb20348531a121bd0ddf38b563d36214d51a8848c882bd35c5"

      def install
        bin.install "going"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/afrase/going/releases/download/v0.0.9/going_Darwin_x86_64.tar.gz"
      sha256 "063336ff7cda2a1dd8038ab909ae0212f3be38ad94e40a3b2bf9f7069856a528"

      def install
        bin.install "going"
      end
    end
  end
end
