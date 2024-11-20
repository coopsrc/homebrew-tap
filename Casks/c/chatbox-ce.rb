cask "chatbox-ce" do
  arch arm: "-arm64"

  version "0.10.2"
  sha256 arm:   "e289221a5bf16c110c3378f2290bd97ac980f4e3586495e705d5f0c3b73f7738",
         intel: "fd67bbac115900c31a13ed0ff7e1eace6814571222b7e94ae4537326517a3d7b"

  # url "https://download.chatboxai.app/releases/Chatbox-#{version}#{arch}.dmg"
  url "https://github.com/Bin-Huang/chatbox/releases/download/v#{version}/Chatbox.CE-#{version}#{arch}.dmg"
  name "chatbox-ce"
  desc "Desktop app for GPT-4 / GPT-3.5 (OpenAI API)"
  homepage "https://github.com/Bin-Huang/chatbox"

  livecheck do
    # url "https://download.chatboxai.app/releases/latest-mac.yml"
    url "https://github.com/Bin-Huang/chatbox/releases/download/v#{version}/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Chatbox CE.app"

  uninstall quit: "xyz.chatboxapp.ce"

  zap trash: [
    "~/Library/Application Support/xyz.chatboxapp.ce",
    "~/Library/Caches/xyz.chatboxapp.ce",
    "~/Library/Logs/xyz.chatboxapp.ce",
    "~/Library/Preferences/xyz.chatboxapp.ce.plist",
    "~/Library/Saved Application State/xyz.chatboxapp.ce.savedState",
    "~/Library/WebKit/xyz.chatboxapp.ce",
  ]
end
