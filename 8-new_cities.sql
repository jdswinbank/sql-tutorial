-- SQLite formatting
.mode column
.header on
PRAGMA foreign_keys = ON; -- Necessary, or sqlite won't enforce them

-- A PRIMARY KEY uniquely identifies an entry in the table
-- We can't use city names, since we know that Cambridge (for eg) isn't unique,
-- so let's use an integer and have the database ensure its uniqueness.
CREATE TABLE "cities" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" VARCHAR,
    "country", VARCHAR
);

-- We can specify the city ID if we want
INSERT INTO cities (id, name, country) VALUES
    (1, "Amsterdam", "Netherlands")
; -- We *can* specify the id

-- But the database does it automatically if we don't
INSERT INTO cities (name, country) VALUES
    ("Cambridge", "USA"),
    ("Cambridge", "UK"),
    ("Berlin", "Germany")
;

-- A FOREIGN KEY tells us that this is a reference to another table.
-- The database won't let us add people living in cities that aren't stored in
-- the cities table.
CREATE TABLE "people" (
    "name" VARCHAR,
    "age" INTEGER,
    "city" INTEGER NOT NULL,
    FOREIGN KEY(city) REFERENCES cities(id)
);

-- Note we need to refer to the cities by ID
INSERT INTO people (name, age, city) VALUES
    ("Alice", 21, 1),
    ("Bob", 21, 4),
    ("Carol", 40, 1)
;
