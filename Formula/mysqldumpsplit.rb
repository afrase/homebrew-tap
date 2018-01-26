class Mysqldumpsplit < Formula
  desc "Split a mysqldump into separate files for each table."
  homepage ""
  url "https://github.com/afrase/mysqldumpsplit/releases/download/v0.1.0/mysqldumpsplit_0.1.0_macOS_64-bit.tar.gz"
  version "0.1.0"
  sha256 "660d7195c48a18b90e1ff3f6b80d0d49ec13b0d2735dd9bf22e4e193f9da101b"

  def install
    bin.install "mysqldumpsplit"
  end

  test do
    system "#{bin}/mysqldumpsplit -version"
  end
end
