# All (maybe) Python database interfaces provide the standard "DB-API" interface
# The sqlite3 module does so for SQLite databases
import sqlite3
import os
import subprocess

filename = "people.db"

# Create the database if it doesn't already exist
# Simply call sqlite3 with a filename argument and feed it our existing SQL
if not os.path.exists(filename):
    subprocess.check_call(
        ['sqlite3', 'people.db'],
        stdin=open("10-explicit_joins_and_views.sql"),
        stdout=open("/dev/null", "w")
    )

# Make a connection to the database
connection = sqlite3.connect(filename)

# Our individual operations on the database are done through a "cursor"
# A single connection can support multiple cursors
cursor = connection.cursor()

# We can feed the cursor ordinary SQL statements
cursor.execute("SELECT * FROM population")

# And iterate over the results
for row in cursor:
    print row # Note that we get sane python types in the results

# We can also handle insertions -- let's add two more people
people = [
    ("Fred", 12, 1),
    ("Gina", 36, 2)
]

# Note the weird parameter substition syntax
# "executemany" is a convenient shortcut for bulk insertion, etc.
cursor.executemany("INSERT INTO people (name, age, city) VALUES (?, ?, ?)", people)

# And we can grab all the data at once
cursor.execute("SELECT * FROM people")
print cursor.fetchall()
