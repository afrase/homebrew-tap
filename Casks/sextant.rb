cask "sextant" do
  version "0.3.0"
  sha256 "f2443ab0257f9bbbfba651074e04ef40a890bec68f5e31157911812d6466bfb9"

  url "https://github.com/afrase/Sextant/releases/download/v#{version}/Sextant-#{version}.zip"
  name "Sextant"
  desc "Layout editor, firmware builder and live view for the ZSA Voyager keyboard"
  homepage "https://github.com/afrase/Sextant"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Sextant.app"

  # Releases are signed ad hoc, not notarized, so Gatekeeper would refuse the first launch. Installing from this tap
  # stands in for it: clearing the quarantine flag is what Homebrew's removed --no-quarantine did (ADR 0058).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Sextant.app"]
  end

  zap trash: [
    "~/Library/Application Support/Sextant",
    "~/Library/Caches/com.sextant.app",
    "~/Library/Preferences/com.sextant.app.plist",
  ]
end
