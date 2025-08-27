class ClaudeCodeRouter < Formula
  desc "Claude Code Router - Route Claude Code requests to various LLM providers"
  homepage "https://github.com/musistudio/claude-code-router"
  url "https://registry.npmjs.org/@musistudio/claude-code-router/-/claude-code-router-1.0.43.tgz"
  sha256 "847da43369d812516fe4f54e1b8ecba3a4dbe7ee6211ebac187cc517f0fe84dd"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  service do
    run [opt_bin/"ccr", "start"]
    run_type :immediate
    log_path var/"log/claude-code-router/claude-code-router.out.log"
    error_log_path var/"log/claude-code-router/claude-code-router.err.log"
  end

  test do
    system "#{bin}/ccr", "--help"
  end
end
