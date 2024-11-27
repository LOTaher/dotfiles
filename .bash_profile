# Only run on macOS

if [[ "$OSTYPE" == "darwin"* ]]; then
  # needed for brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export XDG_CONFIG_HOME="$HOME"/.config

. "$HOME/.cargo/env"
. "/Users/lotaher/.deno/env"