class Mysqldumpsplit < Formula
  desc "Split a mysqldump into separate files for each table."
  homepage ""
  url "https://github.com/afrase/mysqldumpsplit/releases/download/v0.0.6/mysqldumpsplit_0.0.6_macOS_64-bit.tar.gz"
  version "0.0.6"
  sha256 "6ed369bdf784bd75ec924c8d34ad4e3cd68959cc7b3304a4af6b9867fc4b58db"

  def install
    bin.install "mysqldumpsplit"
  end

  test do
    system "#{bin}/mysqldumpsplit -version"
  end
end
