# Note: These commands only work for the local system with the peer authentication
# All the function works as peer authentication with the postgres server, so we
# have to create a role and database same as system user name.
# To make it possible we have to tweek settings in the pg_hba.conf to allow the
# peer authetication on the Unix systems.

# create schema
# drop schema
# create role
# delete role
# create database
# delete database
# recreate database

# psql -c "<query>" -> run in the non-interactive mode
# psql -f <file-path> -> run in the non-interactive mode from the file


function recreate_db() {
    WHO=`whoami`
    psql -U "${WHO}" -d postgres -c "DROP ROLE IF EXISTS ${ROLE_NAME};"
    psql -U "${WHO}" -d postgres -c "CREATE ROLE ${ROLE_NAME} WITH SUPERUSER LOGIN PASSWORD '${PASSWORD}';"
    psql -U "${WHO}" -d postgres -c "DROP DATABASE IF EXISTS ${DATABASE_NAME};"
    psql -U "${WHO}" -d postgres -c "CREATE DATABASE ${DATABASE_NAME};"
    psql -c ""
}
