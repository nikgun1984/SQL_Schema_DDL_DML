DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    region VARCHAR(45)
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    patient_created TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    region_id INTEGER REFERENCES region ON DELETE CASCADE
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(20)
);

CREATE TABLE loc
(
    id SERIAL PRIMARY KEY,
    loc_name VARCHAR(45),
    region_id INTEGER REFERENCES region ON DELETE CASCADE
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(45),
    txt TEXT,
    loc VARCHAR(45),
    region_id INTEGER REFERENCES region ON DELETE CASCADE,
    loc_id INTEGER REFERENCES loc ON DELETE CASCADE,
    categories_id INTEGER REFERENCES categories ON DELETE CASCADE,
    users_id INTEGER REFERENCES users ON DELETE CASCADE
);

INSERT INTO region (region)
VALUES ('San Francisco'),
       ('New York City'),
       ('South Florida'),
       ('Texas');

INSERT INTO users (user_name,email,region_id)
VALUES ('stevie_chicks','stevie@yahoo.com',1),
       ('best_pred','predat@gmail.com',2),
       ('program321','comp983@aol.com',4),
       ('dade_dude','ddm@gmail.com',3);

INSERT INTO loc (loc_name)
VALUES ('sfc',1),
       ('sby',1),
       ('eby',1),
       ('pen',1),
       ('bkl',2),
       ('qns',2),
       ('mnh',2),
       ('mdc',3),
       ('brw',3);

INSERT INTO categories (category_name)
VALUES ('community'),
       ('housing'),
       ('services'),
       ('jobs');

INSERT INTO posts (title,txt,loc,region_id,loc_id,categories_id,users_id)
VALUES ('$1,800 / 1br','Very nice and quiet Efficiency, Flat Screen TV, New Bed, Pool, $325.00 week','Dania Beach',3,9,2,4);


