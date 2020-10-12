DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE soccer_league
(
    id SERIAL PRIMARY KEY,
    league_name VARCHAR(20) NOT NULL
);

CREATE TABLE season_has_league
(
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES season ON DELETE CASCADE,
    league_id INTEGER REFERENCES soccer_league ON DELETE CASCADE
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(20) NOT NULL,
    win INTEGER DEFAULT 0,
    lose INTEGER DEFAULT 0,
    tie INTEGER DEFAULT 0,
    league_id INTEGER REFERENCES soccer_league ON DELETE CASCADE
);

CREATE TABLE game
(
    id SERIAL PRIMARY KEY,
    team_1_id INTEGER REFERENCES teams ON DELETE CASCADE,
    team_2_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    referee_name VARCHAR(20)
);

CREATE TABLE game_has_referees
(
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES game ON DELETE CASCADE,
    referee_id INTEGER REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_name VARCHAR(20),
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES game ON DELETE CASCADE,
    player_id INTEGER REFERENCES players ON DELETE CASCADE
);

INSERT INTO season (start_date,end_date)
VALUES ('2020-09-12','2021-05-12');

INSERT INTO soccer_league (league_name)
VALUES ('Premier League');

INSERT INTO season_has_league(season_id,league_id)
VALUES (1,1);

INSERT INTO teams (team_name,league_id)
VALUES ('Chelsea',1),
       ('Liverpool',1);

INSERT INTO game (team_1_id,team_2_id)
VALUES (1,2);

INSERT INTO referees (referee_name)
VALUES ('Martin Atkinson'),
       ('Stuart Attwell');

INSERT INTO game_has_referees (game_id,referee_id)
VALUES (1,2);

INSERT INTO players (player_name,team_id)
VALUES ('Kai Havertz',1),
       ('Christian Pulisic',1),
       ('Mohamed Salah',2),
       ('Sadio Manee',2);

INSERT INTO goals (game_id,player_id)
VALUES (1,1),
       (1,3),
       (1,4),
       (1,1),
       (1,2);

UPDATE teams SET win = 1 WHERE team_name = 'Chelsea';
UPDATE teams SET lose = 1 WHERE team_name = 'Liverpool';



