# CachyOS defaults (fastfetch greeting, handy aliases)
test -f /usr/share/cachyos-fish-config/cachyos-config.fish; and source /usr/share/cachyos-fish-config/cachyos-config.fish

fish_add_path ~/.local/bin ~/.cargo/bin ~/tools

set -gx EDITOR nvim
set -gx VISUAL nvim

alias vim="nvim"
alias ll="ls -a"
alias cd="z"
alias lg="lazygit"

# 1Password SSH agent
set -gx SSH_AUTH_SOCK "$HOME/.1password/agent.sock"

set -g fish_key_bindings fish_vi_key_bindings

if status is-interactive
    atuin init fish | source

    set BASE16_SHELL_PATH "$HOME/.local/share/tinted-theming/tinty/repos/tinted-shell"
    if test -s "$BASE16_SHELL_PATH"
        source "$BASE16_SHELL_PATH/profile_helper.fish"
    end

    starship init fish | source
    zoxide init fish | source
    mise activate fish | source
end

function fish_user_key_bindings
    bind -M visual y fish_clipboard_copy
    bind -M default yy fish_clipboard_copy
    bind -M default p fish_clipboard_paste
end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
