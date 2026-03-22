cask "claude-code-scanner" do
  version "0.1.3"

  if Hardware::CPU.arm?
    url "https://github.com/ash-hun/claude-code-scanner/releases/download/v#{version}/Claude-Code-Scanner-#{version}-arm64.dmg"
    sha256 "15af9b5790a1d73c5abe2a45f5588f32dfd23ca14582b26ec0611287e204986f"
  else
    url "https://github.com/ash-hun/claude-code-scanner/releases/download/v#{version}/Claude-Code-Scanner-#{version}-x64.dmg"
    sha256 "2e524b5f811b2af0579d40fc8a8cd74b822b451ed85a0c5a1ba73f5b0d16e4ec"
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
