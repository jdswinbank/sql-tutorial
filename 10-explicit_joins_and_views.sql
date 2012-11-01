.read 8-new_cities.sql

-- GROUP BY is a convenient way of working with aggregates
-- But our implicit join only shows us cities which have people living in them
SELECT COUNT(people.name), cities.country
    FROM people, cities
    WHERE people.city = cities.id
    GROUP BY cities.country
;

-- An explicit LEFT OUTER JOIN includes all rows from the table
-- on the left of the JOIN statement.
-- RIGHT and FULL OUTER JOINs are conceptually possible, but
-- not implemented in SQLite
SELECT COUNT(people.name), cities.country
    FROM cities LEFT OUTER JOIN people
    ON people.city = cities.id
    GROUP BY cities.country
;

-- That was a lot of typing, though.
-- What if we want to look up the population frequently?
CREATE VIEW population AS
    SELECT COUNT(people.name) AS population, cities.country
        FROM cities LEFT OUTER JOIN people
        ON people.city = cities.id
        GROUP BY cities.country
;
SELECT * from population;
