# This file have the code to setup the git in the local

ROOT=`pwd`
GIT_ROOT=github
GIT_NAME=abrarnitk

# check the ssh configuration, if already is not or not other ask to setup
# this file create the github related directories if they are not present
# this file clone the github repositories which passed in the array

function create_root() {
  mkdir -p "$ROOT/$GIT_ROOT"
}

function create_workspace() {
  mkdir -p "$ROOT/$GIT_ROOT/$1"
}

function create_dirs() {
  create_root
  create_workspace "$GIT_NAME"
}

# takes the git-repo and workspace as an argument
function clone() {
  repo_name="$(echo "$1" | xargs basename | sed 's/\.git$//')"
  repo_path="$ROOT/$GIT_ROOT/$2/$repo_name"
  if [[ -d $repo_path ]]; then
    echo "$repo_name" "Alredy Exists"
  else
    git clone "$1" "$repo_path"
  fi
}

function clone_abrarnitk() {
  local repos=(
    'configs' 'abrarkp' 'directory' 'learning-rust' 'bookrafter' 
  )

  for repo_name in "${repos[@]}"; do
    clone git@github.com-personal:AbrarNitk/"$repo_name".git "$GIT_NAME"
  done

  #clone git@github.com:AbrarNitk/configs.git "$GIT_NAME"
}

function main() {
  create_dirs
  clone_abrarnitk
}

main

