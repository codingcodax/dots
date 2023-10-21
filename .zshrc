# Fig

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="kosori"

plugins=(
  # fig
  gh
  git
  git-trim
  # iterm2
  last-working-dir
  thefuck
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ls aliases
alias l='ls -lh'
alias ls='exa --icons'
alias ll='exa -1 -a --icons'
alias la='exa -a --icons'
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
alias npm-update="pnpm dlx npm-check-updates -i";

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
alias n="nvim";
alias cls="clear";
alias zshrc="nvim ~/.zshrc";
alias bashrc="nvim ~/.bashrc";
alias neovim="nvim ~/.config/nvim";
alias topten="history | sort -rn | head";
alias myip="curl http://ipecho.net/plain; echo";
alias dirs="dirs -v | head -10";
alias usage="du -h -d1";
alias update="source ~/.zshrc";
alias sshdir="cd ~/.ssh";
alias runp="lsof -i ";

# nvim | volta

# pnpm
# pnpm end

# iTerm2
# iTerm2 end

# Spicetify
# Spicetify end

# Fig end
