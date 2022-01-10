#!/usr/bin/env bash

set -e

USERNAME=${1:-"www-data"}

# Ensure apt is in non-interactive to avoid prompts
export DEBIAN_FRONTEND=noninteractive

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if [ "${USERNAME}" = "root" ]; then
    user_rc_path="/root"
else
    user_rc_path="/home/${USERNAME}"
fi

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

echo 'eval "$(starship init zsh)"' >> ${user_rc_path}/.zshrc

# mkdir -p "~/.config"

# cat <<'EOF' > ${user_rc_path}/.config/starship.toml
#     add_newline = false
#     [character]
#     success_symbol = "[➜](bold green) "
#     error_symbol = "[✗](bold red) "

#     # https://github.com/starship/starship/issues/1469
#     [git_status]
#     disabled=true
# EOF
