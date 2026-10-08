cask "lexa" do
  version "1.0.2"
  sha256 "d228dba65414422d8d401a1814aa06ded5c04349508792feb438bb4e43e9ed15"

  url "https://github.com/SASUKE40/Lexa/releases/download/v#{version}/Lexa-#{version}.zip"
  name "Lexa"
  desc "Grammar and writing assistant that uses free, local, or subscription LLMs"
  homepage "https://github.com/SASUKE40/Lexa"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Lexa.app"

  zap trash: [
    "~/Library/Caches/com.sasuke40.lexa",
    "~/Library/HTTPStorages/com.sasuke40.lexa",
    "~/Library/Preferences/com.sasuke40.lexa.plist",
  ]

  caveats <<~EOS
    Apple did not notarize Lexa. When you open Lexa for the first time,
    macOS shows a warning. Go to System Settings > Privacy & Security.
    Then click "Open Anyway".

    Lexa must have Accessibility access to copy the selected text and
    paste the result.

    To update Lexa, type this command:
      brew upgrade --cask lexa
  EOS
end
