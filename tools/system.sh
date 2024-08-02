function pushd2() {
  PUSHED="$(pwd)"
  cd "$PROJDIR""$1" || return 0
}

function popd2() {
  cd "${PUSHED:-$PROJDIR}" || return 0
  unset PUSHED
}
