#!/bin/bash
# Script to enable auto-login for a given user on TTY1

set -e

USERNAME="${1:-iar}"  
TTY="tty1"
OVERRIDE_DIR="/etc/systemd/system/getty@${TTY}.service.d"
OVERRIDE_FILE="${OVERRIDE_DIR}/override.conf"

if [[ "$(id -u)" -ne 0 ]]; then
    echo "Please run this script as root"
    exit 1
fi

mkdir -p "$OVERRIDE_DIR"

cat > "$OVERRIDE_FILE" <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin $USERNAME --noclear %I \$TERM
EOF

systemctl daemon-reexec
systemctl restart "getty@${TTY}.service"

echo "Auto-login enabled for user '$USERNAME' on $TTY"
