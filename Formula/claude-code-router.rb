class ClaudeCodeRouter < Formula
  desc "Claude Code Router - Route Claude Code requests to various LLM providers"
  homepage "https://github.com/musistudio/claude-code-router"
  url "https://registry.npmjs.org/@musistudio/claude-code-router/-/claude-code-router-1.0.46.tgz"
  sha256 "6848e29b121bc259071c8e0289ce05ed1c86151e0d03064ae46f289ac1afda55"
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
