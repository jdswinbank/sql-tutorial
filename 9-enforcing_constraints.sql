.read 8-new_cities.sql

-- It's not possible to refer to a city that doesn't exist
INSERT INTO people (name, age, city) VALUES
    ("Ed", 50, "Tokyo")
;

-- So we create it first
INSERT INTO cities (name, country) VALUES
    ("Tokyo", "Japan")
;

-- But we need to refer to the numeric ID on insertion
INSERT INTO people (name, age, city) VALUES
    ("Ed", 50, 5)
;

-- We can retrieve that with a subquery
INSERT INTO "people" (name, age, city) VALUES
    ("Dave", 30,
        (SELECT id FROM cities WHERE country = "UK" AND name = "Cambridge")
    )
;
