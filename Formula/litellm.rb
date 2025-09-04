class Litellm < Formula
  desc "LiteLLM CLI tool"
  homepage "https://github.com/BerriAI/litellm"
  url "https://github.com/BerriAI/litellm/archive/refs/tags/v1.75.8-stable.tar.gz"
  sha256 "0aa4971e8cbfed23415496e7058f459a6b871026d6629925d57670937083a1ac"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv_dir = libexec/"venv"
    system "python3", "-m", "venv", venv_dir
    system venv_dir/"bin/pip", "install", ".[proxy]"
    bin.install_symlink venv_dir/"bin/litellm"
    bin.install_symlink venv_dir/"bin/litellm-proxy"
  end

  service do
    run [opt_bin/"litellm", "--config", "#{ENV["HOME"]}/.config/litellm/config.yaml"]
    run_type :immediate
    log_path var/"log/litellm/litellm.out.log"
    error_log_path var/"log/litellm/litellm.err.log"
  end

  test do
    system "#{bin}/litellm", "--help"
  end
end
