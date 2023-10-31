abort() {
  printf "%s\n" "$@"
  exit 1
}

check_depend() {
    if command -v certbot &> /dev/null; then
        echo "certbot is installed."
    else
        apt install certbot || abort "certbot install failed"
    fi

    if dpkg -l | grep -q "python3-certbot-nginx"; then
        echo "python3-certbot-nginx is installed."
    else
        apt install python3-certbot-nginx || abort "python3-certbot-nginx install failed"
    fi
    
}

install_ssl() {
    read -p "Enter your domain to install ssl: $domain"
    sudo certbot --nginx -d "$domain"
}

check_depend || abort "Check dependencies failed"

install_ssl || abort "Install ssl failed, please read details in error message"

echo "Final installation"