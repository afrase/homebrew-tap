cask "sextant" do
  version "0.5.1"
  sha256 "31b8ce7ca5091db38ac11d40e94a66fe578d4f9d27534271624214046601b84e"

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
