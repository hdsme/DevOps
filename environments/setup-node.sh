abort() {
  printf "%s\n" "$@"
  exit 1
}

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash || abort "Download errors"
source ~/.bashrc || abort "Error"
nvm list-remote

read -p "Enter node version (default: v16.20.0): " version
if [ -z "$version" ]; then
    version="v16.20.0"
fi
nvm install "$version" || abort "Error when installing"

echo "Installed successfully"

node -v
