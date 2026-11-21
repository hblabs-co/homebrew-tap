cask "freeroom" do
  version "0.1.1"
  sha256 "9ded2241feb346b602b4efdc06026a0392e785be700a0d526388d685d02a1068"

  url "https://github.com/hblabs-co/freeroom/releases/download/v#{version}/Freeroom-#{version}.dmg"
  name "Freeroom"
  desc "Free up disk space on macOS with an agent that understands what it is deleting"
  homepage "https://github.com/hblabs-co/freeroom"

  depends_on macos: ">= :sequoia"

  app "Freeroom.app"
  binary "#{appdir}/Freeroom.app/Contents/Helpers/freeroom"

  uninstall quit: "co.hblabs.freeroom"

  # Keep in sync with Sources/FreeroomApp/Uninstaller.swift
  zap trash: [
    "~/Library/Application Support/Freeroom",
    "~/Library/Caches/Freeroom",
    "~/Library/Caches/co.hblabs.freeroom",
    "~/Library/HTTPStorages/co.hblabs.freeroom",
    "~/Library/HTTPStorages/co.hblabs.freeroom.binarycookies",
    "~/Library/Saved Application State/co.hblabs.freeroom.savedState",
    "~/Library/Preferences/co.hblabs.freeroom.plist",
  ]

  caveats <<~EOS
    The Claude Code plugin is managed by Claude Code. To remove it:
      claude plugin uninstall freeroom@freeroom
  EOS
end
