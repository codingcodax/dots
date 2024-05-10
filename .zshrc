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

# ls aliases
alias l='ls -lh'
alias ls='eza --icons'
alias ll='eza -1 -a --icons'
alias la='eza -a --icons'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# cd aliases
alias ..="cd ../";
alias ...="cd ../..";
alias ..l="cd ../ && ll";
alias de="cd ~/Desktop";
alias dw="cd ~/Downloads";
alias dd="cd ~/Developer";
alias d="cd ~/Developer && cd ";

# git aliases
alias gi="git init";
alias gfr="git remote update";
alias gac="git add . && git commit -a -m ";
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches";
alias gdm="git diff | pbcopy; open raycast://ai-commands/git-commit-message --background";

# npm aliases
alias ni="npm install";
alias nid="npm install -D";
alias nu="npm uninstall";
alias nr="npm run ";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias nrd="npm run dev -s --";
alias nrdp="npm run develop -s --";
alias nrl="npm run lint -s --";
alias nrlf="npm run lint:fix -s --";
alias nrc="npm run commit -s --";
alias rmnm="rm -rf node_modules";
alias flush-npm="rm -rf node_modules && npm i && echo NPM is done ✅";
alias npm-update="npx npm-check-updates -i";

# pnpm aliases
alias p="pnpm"
alias pi="pnpm install";
alias pa="pnpm add";
alias pad="pnpm add -D";
alias pr="pnpm rm";
alias flush-pnpm="rm -rf node_modules && pnpm i && echo PNPM is done ✅";
alias pnpm-update="pnpx npm-check-updates -i";

# yarn aliases
alias yar="yarn run";
alias yas="yarn start";
alias yab="yarn build";
alias yal="yarn lint:fix";
alias yac="yarn commit";

# other aliases
alias c="code .";
alias cls="clear";
alias cat="bat";
alias md="mkdir ";
alias pg="echo 'Pinging Google' && ping www.google.com";
alias lz="lazygit";
alias gt="git-trim";
alias n="nvim";
alias zshrc="nvim ~/.zshrc";
alias bashrc="nvim ~/.bashrc";
alias nvimdir="cd ~/.config/nvim";
alias sshdir="cd ~/.ssh";
alias topten="history | sort -rn | head";
alias myip="curl http://ipecho.net/plain; echo";
alias dirs="dirs -v | head -10";
alias usage="du -h -d1";
alias update="source ~/.zshrc";
alias runp="lsof -i ";
alias copy="pbcopy"; # macOS => pbcopy | Linux => xclip
alias paste="pbpaste"; # macOS => pbpaste | Linux => xclip -o
alias bubu="brew update && brew upgrade && brew cleanup";
# alias bubu="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y";
alias spt="spotify_player";

# funtions
# Get the latest commits since last merge
function extract_merge_commit_logs() {
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  local latest_merge_commit=$(git log --merges --first-parent $current_branch --pretty=format:'%H' -n 1)
  local latest_commit=$(git log --pretty=format:%H -n 1 $current_branch)

  if [ -n "$latest_merge_commit" ]; then
      git log --pretty=format:"%s" $latest_merge_commit..$current_branch
  else
      echo "No merge commit found in the current branch."
  fi
}

# Get the latest commits and changes since last merge
function extract_merge_commit_logs_with_diff() {
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  local latest_merge_commit=$(git log --merges --first-parent $current_branch --pretty=format:'%H' -n 1)
  local latest_commit=$(git log --pretty=format:%H -n 1 $current_branch)

  if [ -n "$latest_merge_commit" ]; then
      git log --pretty=format:%h:%s $latest_merge_commit..$current_branch | while read commit; do
          hash=$(echo $commit | cut -d: -f1)
          msg=$(echo $commit | cut -d: -f2-)
          echo "$msg"
          git show --pretty="" --name-only $hash
          git show --pretty="" --color $hash
      done
  else
      echo "No merge commit found in the current branch."
  fi
}

# volta
# volta end
