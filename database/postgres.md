# show database
`\l`

# login
psql -h localhost -p 5432 -U postgres

# restore

psql -h localhost -p 5432 -U postgres -f filename.sql -d database_name

pg_restore -h localhost -p 5432 -U postgres -d database_name filename.sql

## unaccent extension

delete all function have unaccent prefix in Functions

## Granted read access
GRANT SELECT ON ALL TABLES IN SCHEMA public TO read_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO read_user;