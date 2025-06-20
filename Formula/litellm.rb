class Litellm < Formula
  desc "LiteLLM CLI tool"
  homepage "https://github.com/BerriAI/litellm"
  url "https://github.com/BerriAI/litellm/archive/refs/tags/v1.0.0.tar.gz" # Replace with actual version
  sha256 "" # Replace with actual sha256
  license "MIT"

  depends_on "python@3.11"

  def install
    system "pip3", "install", ".", "--prefix=#{prefix}"
  end

  service do
    run [opt_bin/"litellm", "--config", "#{ENV["HOME"]}/.config/litellm/config.yaml"]
    keep_alive true
    log_path var/"log/litellm.log"
    error_log_path var/"log/litellm.log"
    working_dir ENV["HOME"]
  end

  test do
    system "#{bin}/litellm", "--help"
  end
end
