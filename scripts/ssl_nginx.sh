#!/bin/bash

abort() {
  printf "%s\n" "$@"
  exit 1
}


check_depend() {
  t=$1
  if [ -z "$t" ]; then
    t="0"
  fi

  root=$(pwd)
  crt_files=($(find "$root" -type f -name "*.crt"))

  if [ ${#crt_files[@]} -eq 0 ]; then
      echo "No .crt files found."
  else
      echo "List of .crt files:"
      for file in $files; do
          if grep -q "^AAA" "$file"; then
              aaa_cert="$file"
          elif grep -q "^Sectigo" "$file"; then
            sec_cert="$file"
          elif grep -q "^USERTrust" "$file"; then
            user_cert="$file"
          else
            domain_cert="$file"
          fi
      done
      if [ "$t" = "0" ]; then
        echo "AAA Certificate: $aaa_cert"
        echo "SectigoRSADomainValidation Certificate: $sec_cert"
        echo "USERTrustRSAAAACA Certificate: $user_cert"
        echo "Domain Certificate: $domain_cert"
      else
        printf "$domain_cert $user_cert $sec_cert $aaa_cert"
      fi
  fi
}

merge_cert() {
  file=$1
  cert=$(check_depend "1")
  cat "$cert" >> "$file".crt
}

check_merge_cert() {
  file=$1
  root=$(pwd)

  if test -e "$root/$file.crt"; then
      echo "Cert found."
  else
      abort "File does not exist."
  fi
}

copy_cert() {
  file=$1
  cp "$file.crt" "/etc/ssl"
  prinf "/etc/ssl/$file.crt"
}

copy_key() {
  directory=$(pwd)
  key_files=($(find "$directory" -type f -name "*.key"))
  if [ ${#key_files[@]} -gt 0 ]; then
      cp "${key_files[0]}" "/etc/ssl"
      printf "/etc/ssl/${key_files[0]}"
  fi
}


backup_nginx() {
  domain=$1
  conf="/etc/nginx/sites-enabled/$domain.conf"
  root=$(pwd)
  if [ -f "$file" ]; then
    cp "$conf" "$domain.conf"
    echo "Copy nginx backup successfully."
  else
    abort "Nginx config not found"
  fi
}
config_nginx() {
  domain=$1
  ssl_cert=$2
  ssl_cert_key=$3
  conf="/etc/nginx/sites-enabled/$domain.conf"
  if [ -f "$conf" ]; then
    sed -i "/^ *server_name /a \ \ \ \ ssl_certificate $ssl_cert;\n\ \ \ \ ssl_certificate_key $ssl_cert_key;" "$conf"
  else
    abort "Config file not found"
  fi
}

validation_nginx() {
  nginx -t || abort "Invalid nginx configuration"
  systemctl nginx reload
}

check_validation() {
  domain=$1
  echo "https://www.ssllabs.com/ssltest/analyze.html?d=$domain"
}

install_ssl() {
  # Enter domain
  read -d "Enter your domain install ssl: $domain"
  echo "Installing SSL for $domain"
  echo "Check depedencies"

  # Check depend 
  check_depend || abort "Check depedencies failed"

  # Merge cert
  merge_cert "$domain" || abort "Merge cert failed"

  # Check cert after merge
  check_merge_cert "$domain" || abort "Certificate not found, please try again!"
  cert=$(copy_cert "$domain")
  key=$(copy_key)

  # Backup nginx
  backup_nginx "$domain" || abort "Backup failed"

  # Insert config nginx
  config_nginx "$domain $cert $key" || abort "Config nginx failed"

  # Validation and restart nginx
  validation_nginx || abort "Validation failed"

  # Check ssl after installed
  check_validation "$domain"
}

install_ssl || abort "Install SSL failed"