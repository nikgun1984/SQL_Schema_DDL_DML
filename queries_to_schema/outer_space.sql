-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy VARCHAR(20) NOT NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  galaxies_id INTEGER REFERENCES galaxies ON DELETE CASCADE
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  stars_id INTEGER REFERENCES stars ON DELETE CASCADE,
  galaxies_id INTEGER REFERENCES galaxies ON DELETE CASCADE
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  planets_id INTEGER REFERENCES planets ON DELETE CASCADE
);

INSERT INTO galaxies (galaxy)
VALUES ('Milky Way');

INSERT INTO stars (name, galaxies_id)
VALUES ('The Sun',1),
       ('Proxima Centauri',1),
       ('Gliese 876',1);

INSERT INTO planets (name,orbital_period_in_years,stars_id,galaxies_id)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3,1);

INSERT INTO moons (name,planets_id)
VALUES ('The Moon',1),
       ('Phobos',2),
       ('Deimos',2),
       ('Naiad',4),
       ('Thalassa',4),
       ('Despina',4),
       ('Galatea',4),
       ('Larissa',4),
       ('S/2004 N 1',4),
       ('Proteus',4),
       ('Triton',4),
       ('Nereid',4),
       ('S/2004 N 1',4),
       ('Halemede',4),
       ('Sao',4),
       ('Laomeidia',4),
       ('Psamathe',4),
       ('Neso',4);