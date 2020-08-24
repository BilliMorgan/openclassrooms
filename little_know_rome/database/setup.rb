require 'sqlite3'
db = SQLite3::Database.new "development.db"

#Create a table

db.execute <<-SQL
create table posts(
  title varchar(50),
  body varchar(5000),
  author varchar(50)
);
SQL