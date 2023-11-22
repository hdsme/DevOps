abort() {
  printf "%s\n" "$@"
  exit 1
}

read -d "Enter your "$USER" password: " password

echo $password | sudo -S apt -y update || abort "Failed"

echo $password | sudo -S apt -y install apt-transport-https ca-certificates curl software-properties-common || abort "Failed"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - || abort "Failed"

echo $password | sudo -S add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" || abort "Failed"

echo $password | sudo -S apt -y update || abort "Failed"

echo $password | sudo -S apt-cache policy docker-ce || abort "Failed"

echo $password | sudo -S apt install docker-ce || abort "Failed"

echo $password | sudo -S usermod -aG docker ${USER} || abort "Failed"

sudo -S su - ${USER} || abort "Failed"

id -nG || abort "Failed"

echo $password | sudo -S usermod -aG docker ${USER} || abort "Failed"

echo $password | sudo -S systemctl status docker || abort "Failed"