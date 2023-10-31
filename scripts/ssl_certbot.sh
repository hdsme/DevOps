abort() {
  printf "%s\n" "$@"
  exit 1
}

check_server() {
    if dpkg -l | grep -q "nginx"; then
        printf "[N]ginx"
    elif dpkg -l | grep -q "apache2"; then
        printf "[A]pache"
    else
        prinf "None"
    fi
}
check_depend() {
    if command -v certbot &> /dev/null; then
        echo "certbot is installed."
    else
        apt install certbot || abort "certbot install failed"
    fi

    server=$(check_server)
    
    if [ "$server" = "[N]ginx" ]; then
        if dpkg -l | grep -q "python3-certbot-nginx"; then
            echo "python3-certbot-nginx is installed."
        else
            apt install python3-certbot-nginx || abort "python3-certbot-nginx install failed"
        fi
    elif [ "$server" = "[A]pache" ]; then
        if dpkg -l | grep -q "python3-certbot-apache"; then
            echo "python3-certbot-apache is installed."
        else
            apt install python3-certbot-apache || abort "python3-certbot-apache install failed"
        fi
    else
        abort "No server found"
    fi
}

install_ssl() {
    read -p "Enter your domain to install ssl: $domain"
    current_server=$(check_server)
    echo "Current server: $current_server"
    read -p "Enter your server name to install ssl ([A]pache / [N]ginx): $server"

    if [ -z "$server" ]; then
        server="$current_server"
    fi

    if [ "$server" = "[A]pache" ]; then
        params="--apache"
    elif [ "$server" = "[N]ginx" ]; then
        params="--nginx"
    else
        abort "Server not found"
    fi
    sudo certbot "$params" -d "$domain" || abort "Install ssl for $server failed"
}


check_depend || abort "Check dependencies failed"

install_ssl || abort "Install ssl failed, please read details in error message"

echo "Final installation"