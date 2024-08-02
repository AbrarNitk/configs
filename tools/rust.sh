# cargo related commands

function run() {
  cargo run $*
}

function build() {
  cargo build
}

function rb() {
  cargo build --relelase
}

function check() {
    cargo check
}

function cc() {
    check
}

function clippy() {
    cargo clippy
}

function fmt() {
    cargo fmt
}
