#!/bin/bash
abort() {
  printf "%s\n" "$@"
  exit 1
}

migrate() {
    echo "Migrating" 
    php artisan migrate
}

rollback() {
    echo "Migrate failed, rolling back"
    php artisan migrate:rollback || abort "Rollback failed"
}


# Execution
npm run build || abort "Build failed"
php artisan optimize:clear || abort "Optimize failed"
migrate || rollback