.read 5-create_countries.sql

-- Innocent enough...
INSERT INTO people (name, age, city) VALUES
    ("Dave", 30, "Cambridge")
;

-- Hey, I know two places called Cambridge!
INSERT INTO cities (name, country) VALUES
    ("Cambridge", "UK"),
    ("Cambridge", "USA")
;

-- But wait! Dave is in two places at once?!
SELECT people.name FROM people, cities WHERE people.city = cities.name AND cities.country = "UK";
SELECT people.name FROM people, cities WHERE people.city = cities.name AND cities.country = "USA";

-- What about Ed, who lives in Tokyo?
INSERT INTO people (name, age, city) VALUES
    ("Ed", 50, "Tokyo")
;

-- Wait, where is Tokyo?! Does it actually exist?
SELECT cities.country FROM people, cities WHERE people.city = cities.name AND people.name = "Ed";

-- Let's forget it and start again
DROP TABLE cities;
DROP TABLE people;
