-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE TABLE players(
id serial primary key,
name text
);

CREATE TABLE matches(
id serial primary key,
winner integer references players(id),
loser integer references players(id)
);

CREATE VIEW player_standings AS
SELECT players.id, players.name, count(wins.winner) as player_wins, (count(wins.winner) + count(losses.loser)) as player_matches
FROM players as players
LEFT JOIN matches as wins ON players.id = wins.winner
LEFT JOIN matches as losses ON players.id = losses.loser
GROUP BY players.id
ORDER BY player_wins DESC, player_matches;





