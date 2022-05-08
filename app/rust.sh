# shellcheck disable=SC1090,SC2148

myzs:module:new "$0"

# $HOME/go is default go path in macos
export RUSTPATH="${__RUSTPATH:-$HOME/.cargo}"

if _myzs:internal:checker:folder-exist "$RUSTPATH"; then
  _myzs:internal:path-append "$RUSTPATH/bin"

  RUSTFPATH="$RUSTPATH/completions"
  if ! _myzs:internal:checker:folder-exist "$RUSTFPATH"; then
    mkdir -p "$RUSTFPATH"
  fi

  export __RUSTFPATH="$RUSTFPATH/_rustup"
  if ! _myzs:internal:checker:file-exist "$__RUSTFPATH"; then
    rustup completions zsh >"$__RUSTFPATH"
  fi

  _myzs:internal:fpath-push "$RUSTFPATH"
fi
