export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export LESSHISTFILE=-
unset MOZ_LEGACY_HOME

export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"

#export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

export _JAVA_AWT_WM_NONREPARENTING=1

export EDITOR='nvim'
export HISTTIMEFORMAT='%F %T '
export TERMINAL='kitty'

export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

#
#
#

[[ "$(tty)" = "/dev/tty1" ]] && (pgrep bspwm || ssh-agent startx)

[[ -f ~/.bashrc ]] && . ~/.bashrc

