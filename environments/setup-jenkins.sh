abort() {
  printf "%s\n" "$@"
  exit 1
}

curl -fsSL https://raw.githubusercontent.com/hdsme/DevOps/main/jenkins/Dockerfile
curl -fsSL https://raw.githubusercontent.com/hdsme/DevOps/main/jenkins/docker-compose.yml
curl -fsSL https://raw.githubusercontent.com/hdsme/DevOps/main/jenkins/.env

docker compose up -d || abort "Failed to start Jenkins"

printf "Copy secret key and continue install: $(cat jenkins_home/secrets/initialAdminPassword)"
