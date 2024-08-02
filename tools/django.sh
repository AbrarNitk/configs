function makemigrations() {
  manage makemigrations $*
}

function migrate() {
  manage migrate $*
}

function djshell() {
  manage shell
}

function dbshell() {
  manage dbshell
}


function manage() {
  pushd2 /dj
  python manage.py $*
  r=$?
  popd2
  return ${r}
}

function pyfmt() {
  pushd2 /dj
  black .
  popd2
}

function run_dj {
    manage runserver 0.0.0.0:8002
}
