cask "twinly" do
  version "1.2.3"
  sha256 "bd49368d7521da60a19a2102412b6291864915d4077133727229b7c7d2a98a94"

  url "https://github.com/onlymasumrana/Twinly/releases/download/v#{version}/Twinly.dmg"
  name "Twinly"
  desc "Run multiple isolated instances of any Mac app and CLI tools side by side"
  homepage "https://github.com/onlymasumrana/Twinly"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Twinly.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Twinly.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Twinly",
    "~/Library/Preferences/io.twinly.Twinly.plist",
  ]
end
