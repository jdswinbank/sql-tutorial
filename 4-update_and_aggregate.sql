-- Create and populate the database
.read 2-load_data.sql

-- We can use the UPDATE statement to change database contents
SELECT DISTINCT city FROM people;
UPDATE people SET city = "Rotterdam" WHERE name = "Carol";
SELECT DISTINCT city FROM people;

-- We can operate upon the data and use the results in a SELECT or UPDATE
SELECT name, age+1 FROM people;
UPDATE people SET age = age+1;
SELECT DISTINCT age FROM people;

-- We can calculate "aggregates" over the data
SELECT COUNT(name) FROM people;
SELECT MAX(age) FROM people;

-- And DELETE data we don't want anymore
DELETE FROM people WHERE name = "Alice";
SELECT COUNT(name) FROM people;
