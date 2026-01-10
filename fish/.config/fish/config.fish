
fish_add_path ~/.cargo/bin
fish_add_path ~/tools
alias vim="nvim"

alias ll="ls -a"

# TMUX
alias t="tmux"
alias ta="tmux attach -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"
alias tka="tmux kill-session -a"
alias cd="z"
alias lg="lazygit"


set -gx TINTED_TMUX_OPTION_ACTIVE 1

set -gx SSH_AUTH_SOCK "/Users/shaikzeeshan/.bitwarden-ssh-agent.sock"

set -g fish_key_bindings fish_vi_key_bindings

if status is-interactive
    # Commands to run in interactive sessions can go here
  atuin init fish | source

  if status --is-interactive
  set BASE16_SHELL_PATH "$HOME/.local/share/tinted-theming/tinty/repos/tinted-shell"
    if test -s "$BASE16_SHELL_PATH"
      source "$BASE16_SHELL_PATH/profile_helper.fish"
    end
  end
end


starship init fish | source
zoxide init fish | source
~/.local/bin/mise activate fish | source


function fish_user_key_bindings
  bind -M default ctrl-x 'sessions --t'
  bind -M default ctrl-t 'sessions'
  bind -M insert ctrl-x 'sessions --t'
  bind -M insert ctrl-t 'sessions'
  bind -M visual y fish_clipboard_copy
  bind -M normal yy fish_clipboard_copy
  bind p fish_clipboard_paste
end



# pnpm
set -gx PNPM_HOME "/Users/shaikzeeshan/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
