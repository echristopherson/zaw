function zaw-src-git-status() {
  git rev-parse --git-dir >/dev/null 2>&1
    if [[ $? == 0 ]]; then
      : ${(A)candidates::=${${(f)"$(git status --porcelain)"}##<-> ##}}
    fi

    actions=(zaw-src-git-status-add zaw-src-git-status-add-p zaw-src-git-status-reset zaw-src-git-status-checkout)
    act_descriptions=("add" "add -p" "reset" "checkout")
    options=()
}

function zaw-src-git-status-add() {
  local f_path=${1#(\?\? | M |M  |A  )}
  BUFFER="git add $f_path"
  zle accept-line
}

function zaw-src-git-status-add-p() {
  local f_path=${1#(\?\? | M |M  |A  )}
  BUFFER="git add -p $f_path"
  zle accept-line
}

function zaw-src-git-status-reset() {
  local f_path=${1#(\?\? | M |M  |A  )}
  BUFFER="git reset $f_path"
  zle accept-line
}

function zaw-src-git-status-checkout() {
  local f_path=${1#(\?\? | M |M  |A  )}
  BUFFER="git checkout $f_path"
  zle accept-line
}

zaw-register-src -n git-status zaw-src-git-status