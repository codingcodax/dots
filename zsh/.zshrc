export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="kosori"

# keep generated completion cache out of $HOME (must be set before oh-my-zsh)
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${HOST%%.*}-${ZSH_VERSION}"
[[ -d "${ZSH_COMPDUMP:h}" ]] || mkdir -p "${ZSH_COMPDUMP:h}"

plugins=(
  git
  git-trim
  last-working-dir
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# secrets + machine-local overrides (never committed)
[[ -f "$HOME/.config/zsh/secrets.zsh" ]] && source "$HOME/.config/zsh/secrets.zsh"
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

export EDITOR="nvim"
export VISUAL="$EDITOR"

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
[[ -n "$LS_COLORS" ]] && zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
setopt AUTO_CD
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# tools
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ls aliases
alias ls='eza --icons --group-directories-first'
alias l='eza -lh --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias lm='eza -m --icons'
alias lr='eza -R --icons'
alias lg='eza -lh --git --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'

# cd aliases
if command -v zoxide >/dev/null 2>&1; then
  alias cd="z"
fi
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."
alias ..l="cd ../ && ll"
alias de="cd ~/Desktop"
alias dw="cd ~/Downloads"
alias dd="cd ~/Developer"
alias d="cd ~/Developer && cd "

# git aliases
alias gi="git init"
alias gs="git status -sb"
alias gfr="git remote update"
alias gac="git add . && git commit -a -m "
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
[[ "$OSTYPE" == darwin* ]] && alias gdm="git diff | pbcopy; open raycast://ai-commands/git-commit-message --background"

# other aliases
alias n="nvim"
alias cls="clear"
alias cat="bat"
alias md="mkdir "
alias lz="lazygit"
alias ld="lazydocker"
alias gt="git-trim"
alias update="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
alias bashrc="nvim ~/.bashrc"
alias myip="curl -s http://ipecho.net/plain; echo"
alias usage="du -h -d1"
alias dirs="dirs -v | head -10"
alias runp="lsof -i "
alias topten="history | sort -rn | head"

if command -v pbcopy >/dev/null 2>&1; then
  alias copy="pbcopy"
  alias paste="pbpaste"
elif command -v xclip >/dev/null 2>&1; then
  alias copy="xclip -selection clipboard"
  alias paste="xclip -selection clipboard -o"
fi

if command -v brew >/dev/null 2>&1; then
  alias bubu="brew update && brew upgrade && brew cleanup"
elif command -v apt >/dev/null 2>&1; then
  alias bubu="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y"
fi

# create a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# mise (https://mise.jdx.dev)
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# sdkman
if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
