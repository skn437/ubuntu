#!/usr/bin/bash

set -e

brew_prepare() {
  brew update && brew upgrade && brew autoremove && brew cleanup
}

package_install() {
  printf "'%s' Installed! ✅ \n" "$1"
}

zsh() {
  # Zsh Auto Suggestions
  brew install zsh-autosuggestions

  # Create shell library directories
  SHELL_LIBRARY_DIRECTORY="$HOME/.shell-lib"
  ZSH_LIBRARY_DIRECTORY="${SHELL_LIBRARY_DIRECTORY}/zsh-syntax-highlighting"
  mkdir -p "${SHELL_LIBRARY_DIRECTORY}"
  mkdir -p "${ZSH_LIBRARY_DIRECTORY}"

  # Zsh Syntax Highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_LIBRARY_DIRECTORY}"

  # Add configuration to `.zshrc`
  echo 'source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"' >>$HOME/.zshrc
  echo 'source "$HOME/.shell-lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"' >>$HOME/.zshrc

  package_install "Zsh Auto Suggestion & Syntax Highlighting"
}

devtools() {
  # Fastfetch
  brew install fastfetch

  # YQ & XMLStarlet
  brew install yq xmlstarlet

  package_install "Devtools"
}

shellscript() {
  # SHFMT
  brew install shfmt

  package_install "Shell Script"
}

typescript() {
  # TypeScript: It automatically installs `Node` & `Python` to their latest versions
  brew install typescript

  # Bun.js
  brew tap oven-sh/bun
  brew install bun

  package_install "TypeScript"
}

java() {
  # Maven & Gradle: It automatically installs `OpenJDK` To its latest version
  brew install maven gradle

  # Export `Java Home` to the "Path"
  echo 'export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk/libexec/"' >>$HOME/.zshrc
  echo 'export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk/libexec/"' >>$HOME/.bashrc

  # Create a maven settings XML file
  mkdir -p $HOME/.m2

  package_install "Java"
}

c_cpp() {
  # Clang/LLVM
  brew install llvm

  # CMake
  brew install cmake

  package_install "C/C++"
}

rust() {
  # Rust
  brew install rust

  # Rustfmt & SCCache
  brew install rustfmt sccache

  package_install "Rust"
}

go() {
  #Go
  brew install go

  # Go tools
  brew install gopls delve staticcheck

  # Go Task & Lefthook
  brew install go-task lefthook

  package_install "Go"
}

kotlin() {
  # Kotlin
  brew install kotlin

  # Ktlint
  brew install ktlint

  package_install "Kotlin"
}

csharp() {
  # .Net core
  brew install dotnet

  # Export `.Net Core Root` to the "Path"
  echo 'export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec/"' >>$HOME/.zshrc
  echo 'export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec/"' >>$HOME/.bashrc

  # .Net Script
  dotnet tool install -g dotnet-script

  # Export `.Net Tools` to the "Path"
  echo 'export PATH="$HOME/.dotnet/tools:$PATH"' >>$HOME/.zshrc
  echo 'export PATH="$HOME/.dotnet/tools:$PATH"' >>$HOME/.bashrc

  package_install "C#"
}

devops() {
  # Ansible & Prometheus
  brew install ansible prometheus

  # Terraform
  brew tap hashicorp/tap
  brew install hashicorp/tap/terraform

  package_install "DevOps"
}

message_broker() {
  # Kafka: It automatically installs `Zookeeper` to its latest version
  brew install kafka

  package_install "Message Broker"
}

app_image() {
  # LibFuse2
  brew install libfuse@2

  package_install "LibFuse@2"
}

brew_prepare && zsh && devtools && shellscript && typescript && java && c_cpp && rust && go && kotlin && csharp && devops && message_broker && app_image
