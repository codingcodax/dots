# keep PATH unique across nested shells (prevents duplicate entries)
typeset -U path

path=(
  "$HOME/.local/share/mise/shims"
  "$HOME/.local/bin"
  "$HOME/.bun/bin"
  "$HOME/.cache/.bun/bin"
  "$HOME/.opencode/bin"
  $path
)

export ANDROID_HOME="$HOME/Android/Sdk"

# used by .zshrc
export SDKMAN_DIR="$HOME/.sdkman"
