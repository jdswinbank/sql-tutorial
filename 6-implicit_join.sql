.read 5-create_countries.sql

-- Note that we could make the join predicate ("WHERE clause")
-- as elaborate as we like
SELECT people.name
    FROM people, cities
    WHERE people.city = cities.name AND cities.country = "Germany"
;
