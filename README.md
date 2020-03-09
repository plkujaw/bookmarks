##database setup

It's a good idea to keep a record of how the database has been setup, both for your future reference and so that anyone contributing to your project knows how to setup the database.

First lets create a directory for the database setup called db, and a sub-directory within it, migrations.

- db/
  - migrations/
Now let's create a file called 01_create_bookmarks_table.sql in the migrations directory, to record the SQL queries we ran to create the bookmarks table:

# in migrations/01_create_bookmarks_table.sql
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
In this case the extenstion .sql is being used to indicate that the text inside is a SQL query.

This is a start, but it's not enough to simply record the SQL queries, the README needs to be updated with instructions on how to use these. Anyone needing to setup the database from scratch will need to do the following things:

Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql

# bookmarks

User story:

As a User
So I can find sites quickly
I would like to see bookmarks list.
