abort() {
  printf "%s\n" "$@"
  exit 1
}


apt-get install nginx || abort "Install nginx failed"

echo "Setup Nginx successfully"
nginx -v
