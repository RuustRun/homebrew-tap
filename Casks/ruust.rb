cask "ruust" do
  version "0.3.0"

  on_macos do
    on_arm do
      sha256 "fcf15fa65bcbc412e1121577b796e68c4878a0b4e3ccea7da2d256269a9b6969"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "683f40946ed47e529523c15692baff9ddd695485883d54859c0bab29dae36a80"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "42b0a19f36dbb8fa64dab4d324ffba52cfe7a79d0c01f0d981fa54c1019e23e9"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "41154562f4ef4ffd5c712d622b1d88bb6966faf14188893de1d8ce826a4e3e9f"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_linux_amd64.tar.gz"
    end
  end

  name "ruust"
  desc "Command line for Ruust: deploy a git repo as an Egg with unmetered egress on a flat monthly price"
  homepage "https://ruust.run"

  binary "ruust"

  postflight do
    if system_command("/usr/bin/xattr", args: ["-h"]).exit_status == 0
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/ruust"]
    end
  end
end
