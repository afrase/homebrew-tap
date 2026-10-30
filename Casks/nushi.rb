cask "nushi" do
  version "0.2.3"
  sha256 "137642993040575649f5b815fa590fa0b1d2c7e655ecee6823993784e42bcd66"

  url "https://github.com/afrase/nushi/releases/download/v#{version}/Nushi-#{version}.zip"
  name "Nushi"
  desc "Agentic development environment running coding agents as chats over ACP"
  homepage "https://github.com/afrase/nushi"

  # The daemon inside is cgo, built on Apple silicon; Go 1.27 and Start at login need macOS 13.
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Nushi.app"

  # Releases are signed ad hoc, not notarized, so Gatekeeper would refuse the first launch. Installing from this tap
  # stands in for it: clearing the quarantine flag is what Homebrew's removed --no-quarantine did (ADR 0055).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Nushi.app"]
  end

  # The app quits (an upgrade opens it again). The daemon isn't stopped here: an upgrade leaves it and its chats
  # running until they're idle, when the app has it restart into the new one (ADR 0056); it stops by itself about a
  # minute after its app is gone for good (ADR 0055). No launchctl: Start at login's agent only opens the daemon at login and goes with the app, and
  # Homebrew's launchctl asks for sudo, on upgrades too. Chats' data stays; zap removes it.
  uninstall quit: "com.nushihq.Nushi"

  # Nushi's own data: chats' copies, settings, keys, logs and the agents' adapters. Not the agents' own folders
  # (~/.claude, ~/.codex, …), which hold their history.
  zap trash: [
    "~/Library/Application Support/Nushi",
    "~/Library/Preferences/com.nushihq.Nushi.plist",
  ]
end
