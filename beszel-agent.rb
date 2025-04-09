# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class BeszelAgent < Formula
  desc "Lightweight server monitoring hub with historical data, docker stats, and alerts."
  homepage "https://beszel.dev"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/henrygd/beszel/releases/download/v0.10.2/beszel-agent_darwin_amd64.tar.gz"
      sha256 "b954bbb35bc5e8d7d9a7b51c49c216c6de7bc1ed9a4dd32c6026f00cfac19c0d"

      def install
        bin.install "beszel-agent"
        (bin/"beszel-agent-launcher").write <<~eos
          #!/bin/bash
          set -a
          if [ -f "$home/.config/beszel/beszel-agent.env" ]; then
            source "$home/.config/beszel/beszel-agent.env"
          fi
          set +a
          exec #{bin}/beszel-agent "$@"
        eos
        (bin/"beszel-agent-launcher").chmod 0755
      end
    end
    on_arm do
      url "https://github.com/henrygd/beszel/releases/download/v0.10.2/beszel-agent_darwin_arm64.tar.gz"
      sha256 "95f059dc008c66416f12d96d5c6edd6a792a8ac42d6ece734edeb7c2cc8153d2"

      def install
        bin.install "beszel-agent"
        (bin/"beszel-agent-launcher").write <<~EOS
          #!/bin/bash
          set -a
          if [ -f "$HOME/.config/beszel/beszel-agent.env" ]; then
            source "$HOME/.config/beszel/beszel-agent.env"
          fi
          set +a
          exec #{bin}/beszel-agent "$@"
        EOS
        (bin/"beszel-agent-launcher").chmod 0755
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/henrygd/beszel/releases/download/v0.10.2/beszel-agent_linux_amd64.tar.gz"
        sha256 "2a20d2753390cb974f857e2cbede73f26196fdb00843cdffd88b6ad385fea9f3"

        def install
          bin.install "beszel-agent"
          (bin/"beszel-agent-launcher").write <<~EOS
            #!/bin/bash
            set -a
            if [ -f "$HOME/.config/beszel/beszel-agent.env" ]; then
              source "$HOME/.config/beszel/beszel-agent.env"
            fi
            set +a
            exec #{bin}/beszel-agent "$@"
          EOS
          (bin/"beszel-agent-launcher").chmod 0755
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/henrygd/beszel/releases/download/v0.10.2/beszel-agent_linux_arm64.tar.gz"
        sha256 "dd7063052f0b0fa1a4b4b8730523278a4fdb676f33bdc57839f119ed4da872c3"

        def install
          bin.install "beszel-agent"
          (bin/"beszel-agent-launcher").write <<~EOS
            #!/bin/bash
            set -a
            if [ -f "$HOME/.config/beszel/beszel-agent.env" ]; then
              source "$HOME/.config/beszel/beszel-agent.env"
            fi
            set +a
            exec #{bin}/beszel-agent "$@"
          EOS
          (bin/"beszel-agent-launcher").chmod 0755
        end
      end
    end
  end

  service do
    run ["#{bin}/beszel-agent-launcher"]
    log_path "#{Dir.home}/.cache/beszel/beszel-agent.log"
    error_log_path "#{Dir.home}/.cache/beszel/beszel-agent.log"
    keep_alive true
  end
end
