abort() {
  printf "%s\n" "$@"
  exit 1
}

apt-get -y install nginx || abort "Install nginx failed"

echo "Setup Nginx successfully"
nginx -v
