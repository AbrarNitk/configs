function bf() {
  CD=$(pwd)
  cd ~/github/fifthtry/fastn
  cargo install --path=fastn
  cd $CD
}

function p() {
  git add .
  git commit -m "$(git branch --show-current): $1"
  git push
}

function gt() {
    cd ~/github/$*
}

function akp() {
    GIT_SSH_COMMAND='ssh -i ~/.ssh/id_ecdsa -o IdentitiesOnly=yes' git push
}

function swap() {

  if (( $# == 2)) ; then
     TMPFILE=$(mktemp $(dirname "$1")/function.txt)
     mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
  else
     echo "Error: Two valid file paths required"
     return 1
  fi

}


function pyfmt() {
   black dj
}
