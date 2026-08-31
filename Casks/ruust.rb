cask "ruust" do
  version "0.2.1"

  on_macos do
    on_arm do
      sha256 "dbb609f4425cb647f6636e07cb996c1335d9c00dea7dbdbfa1d963b790102edf"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "5438474fea7f0b5736ad94162c526881522c8589d41e5a0d3eab0e108fe6b30e"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f6f992899ef9b8909ea0ee17b24737da57a70bd90d650d590eabfa22bab2273e"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "7e6dd666c5d2eb62fc1faba53689b66190c174bf1fcf440b1896a1e2fb41583c"
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
