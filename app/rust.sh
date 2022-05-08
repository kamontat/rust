# shellcheck disable=SC1090,SC2148

myzs:module:new "$0"

# $HOME/go is default go path in macos
export RUSTPATH="${__RUSTPATH:-$HOME/.cargo}"

if _myzs:internal:checker:command-exist "rustup"; then
  _myzs:internal:path-append "$RUSTPATH/bin"

  export RUSTFPATH="/usr/share/zsh/site-functions/_rustup"
  if ! _myzs:internal:checker:file-exist "$RUSTFPATH"; then
    rustup completions zsh >"$RUSTFPATH"
  fi

  _myzs:internal:fpath-push "$RUSTFPATH"
fi
