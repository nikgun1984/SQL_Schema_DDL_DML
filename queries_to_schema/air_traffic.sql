-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE people
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  person_id INTEGER REFERENCES people ON DELETE CASCADE
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline VARCHAR(20) NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country_name VARCHAR(20) NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name VARCHAR(20) NOT NULL,
  country_id INTEGER REFERENCES countries ON DELETE CASCADE
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines ON DELETE CASCADE,
  from_city INTEGER REFERENCES cities ON DELETE CASCADE,
  to_city INTEGER REFERENCES cities ON DELETE CASCADE
);

CREATE TABLE flight_has_seats
(
  id SERIAL PRIMARY KEY,
  seat_id INTEGER REFERENCES seats ON DELETE CASCADE,
  flight_id INTEGER REFERENCES flight ON DELETE CASCADE
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  ticket_info_id INTEGER REFERENCES flight_has_seats ON DELETE CASCADE
);

INSERT INTO people (first_name,last_name) 
VALUES ('Jennifer', 'Finch'),
       ('Thadeus', 'Gathercoal'),
       ('Sonja', 'Pauley'),
       ('Waneta', 'Skeleton'),
       ('Berkie', 'Wycliff'),
       ('Alvin', 'Leathes'),
       ('Cory', 'Squibbes');

INSERT INTO seats (seat, person_id)
VALUES ('33B',1),
       ('8A',2),
       ('12F',3),
       ('20A',1),
       ('23D',4),
       ('18C',2),
       ('9E',5),
       ('1A',6),
       ('32B',5),
       ('10D',7);

INSERT INTO airlines (airline)
VALUES ('United'),
       ('British Airways'),
       ('Delta'),
       ('TUI Fly Belgium'),
       ('Air China'),
       ('American Airlines'),
       ('Avianca Brazil');

INSERT INTO countries (country_name)
VALUES ('United States'),
       ('United Kingdom'),
       ('Japan'),
       ('France'),
       ('UAE'),
       ('Mexico'),
       ('Morocco'),
       ('China'),
       ('Brazil'),
       ('Chile');

INSERT INTO cities (city_name, country_id)
VALUES ('Washington DC',1),
       ('Seattle',1),
       ('Tokyo',3),
       ('London',2),
       ('Los Angeles',1),
       ('Las Vegas',1),
       ('Mexico City',6),
       ('Paris',4),
       ('Casablanca',7),
       ('Dubai',5),
       ('Beijing',8),
       ('New York',1),
       ('Charlotte', 1),
       ('Cedar Rapids',1),
       ('Chicago',1),
       ('New Orleans',1),
       ('Sao Paolo',9),
       ('Santiago',10);

INSERT INTO flight (airline_id,from_city,to_city)
VALUES (1,1,2),
       (2,3,4),
       (3,5,6),
       (3,2,7),
       (4,8,9),
       (5,10,11),
       (1,12,13),
       (6,14,15),
       (6,13,16),
       (7,17,18);

INSERT INTO flight_has_seats (seat_id, flight_id)
VALUES (1,1),
       (2,2),
       (3,3),
       (4,4),
       (5,5),
       (6,6),
       (7,7),
       (8,8),
       (9,9),
       (10,10);

INSERT INTO tickets (departure,arrival,ticket_info_id)
VALUES ('2018-04-08 09:00:00', '2018-04-08 12:00:00',1),
       ('2018-12-19 12:45:00', '2018-12-19 16:15:00',2),
       ('2018-01-02 07:00:00', '2018-01-02 08:03:00',3),
       ('2018-04-15 16:50:00', '2018-04-15 21:00:00',4),
       ('2018-08-01 18:30:00', '2018-08-01 21:50:00',5),
       ('2018-10-31 01:15:00', '2018-10-31 12:55:00',6),
       ('2019-02-06 06:00:00', '2019-02-06 07:47:00',7),
       ('2018-12-22 14:42:00', '2018-12-22 15:56:00',8),
       ('2019-02-06 16:28:00', '2019-02-06 19:18:00',9),
       ('2019-01-20 19:30:00', '2019-01-20 22:45:00',10);


      
