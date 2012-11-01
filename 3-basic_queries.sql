-- Create and populate the database
.read 2-load_data.sql

-- Retrieve everything
SELECT * FROM people;

-- Filtering with the WHERE clause
SELECT * FROM people WHERE age = 21;
SELECT * FROM people WHERE age = 21 AND city = "Amsterdam";

-- Sort the output
SELECT * FROM people ORDER BY age;

-- Pick out specific columns that we're interested in
SELECT age FROM people WHERE name = "Bob";
SELECT name FROM people WHERE age = 21 AND city = "Amsterdam";

-- SELECT DISTINCT retreives only unique values
SELECT DISTINCT * FROM people;   -- Everybody is unique!
SELECT DISTINCT age FROM people; -- But not everybody has a unique age

SELECT DISTINCT city FROM people;
UPDATE people SET city = "Rotterdam" WHERE name = "Carol";
SELECT DISTINCT city FROM people;

SELECT name, age+1 FROM people;
UPDATE people SET age = age+1;
SELECT DISTINCT age FROM people;

SELECT COUNT(name) FROM people;
DELETE FROM people WHERE name = "Alice";
SELECT COUNT(name) FROM people;
