.read 2-load_data.sql

-- Create a relation between cities and countries
CREATE TABLE "cities" (
    "name" VARCHAR,
    "country", VARCHAR
);

-- And populate it with some values
INSERT INTO cities (name, country) VALUES
    ("Amsterdam", "Netherlands"),
    ("Berlin", "Germany")
;
