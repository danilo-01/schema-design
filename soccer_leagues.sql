DROP DATABASE IF EXISTS soccer_leagues;

CREATE DATABASE soccer_leagues;

\c soccer_leagues;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_data DATE ,
    end_date DATE
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL,
    height TEXT NOT NULL,
    team_id INTEGER REFERENCES referees (id) NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams (id) NOT NULL,
    away_team_id INTEGER REFERENCES teams (id) NOT NULL,
    location TEXT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    season_id INTEGER REFERENCES seasons (id) NOT NULL,
    head_referee_id INTEGER REFERENCES referees (id) NOT NULL,
    assistant_referee_id INTEGER REFERENCES referees (id),
    assistant_referee_2_id INTEGER REFERENCES referees (id)
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams (id) NOT NULL,
    match_id INTEGER REFERENCES matches (id) NOT NULL,
    result TEXT CHECK(result='win' OR result='loss' OR result='draw') NOT NULL
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES referees (id) NOT NULL,
    match_id INTEGER REFERENCES referees (id) NOT NULL,
    team_id INTEGER REFERENCES referees (id) NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players (id) NOT NULL,
    match_id INTEGER REFERENCES matches (id) NOT NULL
);
