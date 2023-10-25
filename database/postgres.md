# show database
`\l`

# login
psql -h localhost -p 5432 -U postgres

# restore

p0stgr3s


## unaccent extension

delete all function have unaccent prefix in Functions

## Granted read access
GRANT SELECT ON ALL TABLES IN SCHEMA public TO read_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO read_user;