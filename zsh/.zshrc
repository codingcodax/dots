export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="kosori"

plugins=(
  gh
  git
  git-trim
  last-working-dir
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH=""
export CONTEXT7_API_KEY=""
export DEEPL_API_KEY=""

# ls aliases
alias l='ls -lh'
alias ls='eza --icons'
alias ll='eza -1 -a --icons'
alias la='eza -a --icons'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# cd aliases
alias cd="z"
alias ..="cd ../";
alias ...="cd ../..";
alias ..l="cd ../ && ll";
alias de="cd ~/Desktop";
alias dw="cd ~/Downloads";
alias dd="cd ~/Developer";
alias d="cd ~/Developer && cd ";

# other aliases
alias n="nvim";
alias p="pnpm"
alias copy="pbcopy"; # macOS => pbcopy | Linux => xclip
alias paste="pbpaste"; # macOS => pbpaste | Linux => xclip -o
alias cls="clear";
alias cat="bat";
alias lz="lazygit";
alias ld="lazydocker";
alias gt="git-trim";
alias update="source ~/.zshrc";
alias rmnm="rm -rf node_modules";
alias zshrc="nvim ~/.zshrc";
alias bashrc="nvim ~/.bashrc";
alias nvc="cd ~/.config/nvim";
alias ghc="cd ~/.config/ghostty";
alias sshdir="cd ~/.ssh";
alias myip="curl http://ipecho.net/plain; echo";
alias usage="du -h -d1";
alias bubu="brew update && brew upgrade && brew cleanup";
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches";
# alias bubu="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y";
alias gdm="git diff | pbcopy; open raycast://ai-commands/git-commit-message --background";
