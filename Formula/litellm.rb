class Litellm < Formula
  desc "LiteLLM CLI tool"
  homepage "https://github.com/BerriAI/litellm"
  url "https://github.com/BerriAI/litellm/archive/refs/tags/v1.72.6-stable.tar.gz"
  sha256 "48901e240422d6b6b88a8c56ffbe8e93c182b61a6d55f6cd3093e79a32086149"
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
