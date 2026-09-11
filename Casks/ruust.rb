cask "ruust" do
  version "0.3.1"

  on_macos do
    on_arm do
      sha256 "3ae24d2424dd2874e37925732c742015e8673fee95b7cce24a9555ea4164f071"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "451aad843bb6af842a215f454d2a578ef891e1bc996304b91062ad6bfeb16e47"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "54e6b02fa7dd5d2939b0db63f6db6a77a761ef2af0925b24c64a0e4e1f7ac538"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "36aa89fb51cc9fe3574f8f8c956a4b3eabee7d9b847aef5408d51eea2fccc67b"
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
