cask "ruust" do
  version "0.2.0"

  on_macos do
    on_arm do
      sha256 "96784dc9708c22be67e59c81d9df204cfcfadcdc62f25f7923bec576405bebec"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "48c86f8748a9672240437449b8ac9c8b710001265a8b240ab6edd63c33f52d44"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "467235bcfc607bf503775553e7a3a85b675e4c3e7f9310c99c9d141a26c1e20d"
      url "https://github.com/RuustRun/cli/releases/download/v#{version}/ruust_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "737726956d5eba61f5f0d54d01231f08896849793a456fc8250ce5af0fbfd608"
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
