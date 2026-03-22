cask "claude-code-scanner" do
  version "0.1.3,0.1.2"

  if Hardware::CPU.arm?
    url "https://github.com/ash-hun/claude-code-scanner/releases/download/v#{version.csv.first}/Claude-Code-Scanner-#{version.csv.second}-arm64.dmg"
    sha256 "2029b60bf3c5561b4ea5ab5ffff5e5d0c968987b7c166049ebe8ca8821855913"
  else
    url "https://github.com/ash-hun/claude-code-scanner/releases/download/v#{version.csv.first}/Claude-Code-Scanner-#{version.csv.second}-x64.dmg"
    sha256 "9eafd2ee627f65e9139dafed91dd6f15e030bb59d70ff214f80d19aeff38ae1a"
  end

  name "Claude Code Scanner"
  desc "Claude Code API Traffic Scanner & Analyzer"
  homepage "https://github.com/ash-hun/claude-code-scanner"

  app "Claude Code Scanner.app"

  caveats <<~EOS
    Docker Desktop is required for database features.
    Install it from https://www.docker.com/products/docker-desktop/ or:
      brew install --cask docker

    If macOS shows "app is damaged" warning, run:
      xattr -cr /Applications/Claude\\ Code\\ Scanner.app
  EOS

  zap trash: [
    "~/Library/Application Support/claude-code-scanner",
    "~/Library/Preferences/com.claude-code-scanner.app.plist",
    "~/Library/Logs/claude-code-scanner",
  ]
end
