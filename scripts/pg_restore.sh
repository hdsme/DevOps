abort() {
  printf "%s\n" "$@"
  exit 1
}

check_depend() {
    if command -v psql &> /dev/null; then
        echo "PostgreSQL (psql) is installed."
    else
        echo "PostgreSQL (psql) is not installed."
    fi

}

restore() {
    read -p "Enter a hostname (default: localhost): " host
    if [ -z "$host" ]; then
        host="localhost"
    fi
    echo "Hostname: $host"
    
    read -p "Enter a port (default: 5432): " port
    if [ -z "$port" ]; then
        port="port"
    fi
    echo "Port: $port"
    
    read -p "Enter a user (default: postgres): " user
    if [ -z "$user" ]; then
        user="postgres"
    fi
    echo "User: $user"

    read -p "Enter a database name: " db
    if [ -z "$db" ]; then
        abort "Database name is required"
    fi
    echo "Database: $db"
    
    read -p "Enter a file name: " file
    if [ -z "$file" ]; then
        abort "File is required"
    fi
    echo "File: $file"

    params="--no-owner"
    echo "$params"

    psql -h "$host" -p "$port" -U "$user" -d "$db" -f "$file" "$params" || abort "Failed restore database $db"
}

check_depend || abort "Check depend failed"

restore || abort "Restore failed please read detail in error message"

echo "Final restore"