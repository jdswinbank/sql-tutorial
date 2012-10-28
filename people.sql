CREATE TABLE "people" (
    "name" VARCHAR,
    "age" INTEGER,
    "city" VARCHAR
);

INSERT INTO people (name, age, city) VALUES
    ("Alice", 21, "Amsterdam"),
    ("Bob", 21, "Berlin"),
    ("Carol", 40, "Amsterdam")
;

SELECT * FROM people;
SELECT * FROM people WHERE age = 21;
SELECT * FROM people ORDER BY age;
SELECT age FROM people WHERE name = "Bob";
SELECT name FROM people WHERE age = 21 AND city = "Amsterdam";
SELECT DISTINCT age FROM people;
SELECT DISTINCT * FROM people;

SELECT DISTINCT city FROM people;
UPDATE people SET city = "Rotterdam" WHERE name = "Carol";
SELECT DISTINCT city FROM people;

SELECT name, age+1 FROM people;
UPDATE people SET age = age+1;
SELECT DISTINCT age FROM people;

SELECT COUNT(name) FROM people;
DELETE FROM people WHERE name = "Alice";
SELECT COUNT(name) FROM people;

CREATE TABLE "cities" (
    "name" VARCHAR,
    "country", VARCHAR
);

INSERT INTO cities (name, country) VALUES
    ("Amsterdam", "Netherlands"),
    ("Berlin", "Germany")
;

SELECT people.name
    FROM people, cities
    WHERE people.city = cities.name AND cities.country = "Germany"
;

INSERT INTO people (name, age, city) VALUES
    ("Dave", 30, "Cambridge")
;

INSERT INTO cities (name, country) VALUES
    ("Cambridge", "UK"),
    ("Cambridge", "USA")
;

SELECT people.name FROM people, cities WHERE people.city = cities.name AND cities.country = "UK";
SELECT people.name FROM people, cities WHERE people.city = cities.name AND cities.country = "USA";

INSERT INTO people (name, age, city) VALUES
    ("Ed", 50, "Tokyo")
;

SELECT cities.country FROM people, cities WHERE people.city = cities.name AND people.name = "Alice";
SELECT cities.country FROM people, cities WHERE people.city = cities.name AND people.name = "Dave";
SELECT cities.country FROM people, cities WHERE people.city = cities.name AND people.name = "Ed";

DROP TABLE people;
DROP TABLE cities;

PRAGMA foreign_keys = ON; -- Necessary, or sqlite won't enforce them

CREATE TABLE "cities" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" VARCHAR,
    "country", VARCHAR
);

INSERT INTO cities (id, name, country) VALUES
    (1, "Amsterdam", "Netherlands")
; -- We *can* specify the id

INSERT INTO cities (name, country) VALUES
    ("Cambridge", "USA"),
    ("Cambridge", "UK"),
    ("Berlin", "Germany")
; -- But we don't have to

SELECT * FROM cities;

CREATE TABLE "people" (
    "name" VARCHAR,
    "age" INTEGER,
    "city" INTEGER NOT NULL,
    FOREIGN KEY(city) REFERENCES cities(id)
);

INSERT INTO people (name, age, city) VALUES
    ("Ed", 50, "Tokyo")
; -- "Tokyo" doesn't exist!

INSERT INTO cities (name, country) VALUES
    ("Tokyo", "Japan")
; -- Now it does, but...

INSERT INTO people (name, age, city) VALUES
    ("Ed", 50, 5)
; -- We need to know the city id

SELECT * FROM people;

INSERT INTO "people" (name, age, city) VALUES
    ("Dave", 30,
        (SELECT id FROM cities WHERE country = "UK" AND name = "Cambridge")
    )
; -- Unless we use a subquery to retrieve it

SELECT * FROM people;

SELECT COUNT(people.name), cities.country
    FROM people, cities
    WHERE people.city = cities.id
    GROUP BY cities.country
;

SELECT COUNT(people.name), cities.country
    FROM cities LEFT OUTER JOIN people
    ON people.city = cities.id
    GROUP BY cities.country
; -- NB RIGHT and FULL OUTER JOIN not in sqlite

CREATE VIEW population AS
    SELECT COUNT(people.name), cities.country
        FROM cities LEFT OUTER JOIN people
        ON people.city = cities.id
        GROUP BY cities.country
;

SELECT * from population; -- Save typing!
