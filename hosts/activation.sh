log_warning() { echo -e "\e[1;35mwarning:\e[0m $1"; }

if getent group nixers > /dev/null; then
  chown -R :nixers /etc/nixos
  chmod -R 770 /etc/nixos
else
  log_warning "Failed to update /etc/nixos permissions"
fi
