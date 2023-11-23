# Function to make neovim use same settings even when launching as sudo
function sudo {
  if [ "$1" = "nvim" ] && which nvim > /dev/null; then
    shift
    (SUDO_EDITOR=nvim && sudoedit "$@")
  else
    command sudo "$@"
  fi
}
