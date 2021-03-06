
CREATE TABLE "city" (
	city_id int,
	official_name VARCHAR(100),
	status VARCHAR(100),
	area_km_2 FLOAT,
	population FLOAT,
	census_ranking VARCHAR(100),
	primary key (city_id)
) AS NODE;


CREATE TABLE "farm" (
	farm_id int,
	year int,
	total_horses FLOAT,
	working_horses FLOAT,
	total_cattle FLOAT,
	oxen FLOAT,
	bulls FLOAT,
	cows FLOAT,
	pigs FLOAT,
	sheep_and_goats FLOAT,
	primary key (farm_id)
) AS NODE;


CREATE TABLE "farm_competition" (
	competition_id int,
	year int,
	theme VARCHAR(100),
	host_city_id int,
	hosts VARCHAR(100),
	primary key (competition_id),
	foreign key (host_city_id) references city(city_id)
) AS NODE;


CREATE TABLE "competition_record" (
	competition_id int,
	farm_id int,
	rank int,
	primary key (competition_id,farm_id),
	foreign key (competition_id) references farm_competition(competition_id),
	foreign key (farm_id) references farm(farm_id)
) AS NODE;

INSERT INTO city (city_id, official_name, status, area_km_2, population, census_ranking) VALUES (1, 'Grand Falls/Grand-Sault', 'Town', '18.06', '5706', '636 of 5008');
INSERT INTO city (city_id, official_name, status, area_km_2, population, census_ranking) VALUES (2, 'Perth-Andover', 'Village', '8.89', '1778', '1442 of 5,008');
INSERT INTO city (city_id, official_name, status, area_km_2, population, census_ranking) VALUES (3, 'Plaster Rock', 'Village', '3.09', '1135', '1936 of 5,008');
INSERT INTO city (city_id, official_name, status, area_km_2, population, census_ranking) VALUES (4, 'Drummond', 'Village', '8.91', '775', '2418 of 5008');
INSERT INTO city (city_id, official_name, status, area_km_2, population, census_ranking) VALUES (5, 'Aroostook', 'Village', '2.24', '351', '3460 of 5008');
INSERT INTO farm (farm_id, year, total_horses, working_horses, total_cattle, oxen, bulls, cows, pigs, sheep_and_goats) VALUES (1, '1927', '5056.5', '3900.1', '8374.5', '805.5', '31.6', '3852.1', '4412.4', '7956.3');

INSERT INTO farm (farm_id, year, total_horses, working_horses, total_cattle, oxen, bulls, cows, pigs, sheep_and_goats) VALUES (2, '1928', '5486.9', '4090.5', '8604.8', '895.3', '32.8', '3987.0', '6962.9', '8112.2');
INSERT INTO farm (farm_id, year, total_horses, working_horses, total_cattle, oxen, bulls, cows, pigs, sheep_and_goats) VALUES (3, '1929', '5607.5', '4198.8', '7611.0', '593.7', '26.9', '3873.0', '4161.2', '7030.8');
INSERT INTO farm (farm_id, year, total_horses, working_horses, total_cattle, oxen, bulls, cows, pigs, sheep_and_goats) VALUES (4, '1930', '5308.2', '3721.6', '6274.1', '254.8', '49.6', '3471.6', '3171.8', '4533.4');
INSERT INTO farm (farm_id, year, total_horses, working_horses, total_cattle, oxen, bulls, cows, pigs, sheep_and_goats) VALUES (5, '1931', '4781.3', '3593.7', '6189.5', '113.8', '40.0', '3377.0', '3373.3', '3364.8');
INSERT INTO farm (farm_id, year, total_horses, working_horses, total_cattle, oxen, bulls, cows, pigs, sheep_and_goats) VALUES (6, '1932', '3658.9', '3711.6', '5006.7', '105.2', '71.6', '2739.5', '2623.7', '2109.5');
INSERT INTO farm (farm_id, year, total_horses, working_horses, total_cattle, oxen, bulls, cows, pigs, sheep_and_goats) VALUES (7, '1933', '2604.8', '3711.2', '4446.3', '116.9', '37.6', '2407.2', '2089.2', '2004.7');
INSERT INTO farm (farm_id, year, total_horses, working_horses, total_cattle, oxen, bulls, cows, pigs, sheep_and_goats) VALUES (8, '1934', '2546.9', '2197.3', '5277.5', '156.5', '46.7', '2518.0', '4236.7', '2197.1');
INSERT INTO farm_competition (competition_id, year, theme, host_city_id, hosts) VALUES (1, '2013', 'Carnival M is back!', 1, 'Miley Cyrus Jared Leto and Karen Mok');

INSERT INTO farm_competition (competition_id, year, theme, host_city_id, hosts) VALUES (2, '2006', 'Codehunters', 2, 'Leehom Wang and Kelly Rowland');
INSERT INTO farm_competition (competition_id, year, theme, host_city_id, hosts) VALUES (3, '2005', 'MTV Asia Aid', 3, 'Alicia Keys');
INSERT INTO farm_competition (competition_id, year, theme, host_city_id, hosts) VALUES (4, '2004', 'Valentines Day', 4, 'Vanness Wu and Michelle Branch');
INSERT INTO farm_competition (competition_id, year, theme, host_city_id, hosts) VALUES (5, '2003', 'MTV Cube', 5, 'Shaggy and Coco Lee');
INSERT INTO farm_competition (competition_id, year, theme, host_city_id, hosts) VALUES (6, '2002', 'Aliens', 5, 'Mandy Moore and Ronan Keating');
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (1, 8, 1);

INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (1, 2, 2);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (1, 3, 3);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (2, 1, 3);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (2, 4, 1);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (2, 3, 2);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (3, 7, 1);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (3, 1, 3);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (4, 3, 2);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (4, 1, 4);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (5, 5, 1);
INSERT INTO competition_record (competition_id, farm_id, rank) VALUES (5, 3, 2);

CREATE TABLE city_to_farm AS EDGE;
CREATE TABLE city_to_farm_competition AS EDGE;
CREATE TABLE city_to_competition_record AS EDGE;
CREATE TABLE farm_to_farm_competition AS EDGE;
CREATE TABLE farm_to_competition_record AS EDGE;
CREATE TABLE farm_competition_to_competition_record AS EDGE;

INSERT INTO city_to_farm VALUES
	 ((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm WHERE farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm WHERE farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm WHERE farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm WHERE farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm WHERE farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm WHERE farm_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm WHERE farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm WHERE farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm WHERE farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm WHERE farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm WHERE farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm WHERE farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm WHERE farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm WHERE farm_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm WHERE farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm WHERE farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm WHERE farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm WHERE farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm WHERE farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm WHERE farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm WHERE farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm WHERE farm_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm WHERE farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm WHERE farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm WHERE farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm WHERE farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm WHERE farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm WHERE farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm WHERE farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm WHERE farm_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm WHERE farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm WHERE farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm WHERE farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm WHERE farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm WHERE farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm WHERE farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm WHERE farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm WHERE farm_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm WHERE farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm WHERE farm_id = 8))
;

INSERT INTO city_to_farm_competition VALUES
	 ((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
;

INSERT INTO city_to_competition_record VALUES
	 ((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM city WHERE city_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
;

INSERT INTO farm_to_farm_competition VALUES
	 ((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM farm_competition WHERE competition_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM farm_competition WHERE competition_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM farm_competition WHERE competition_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM farm_competition WHERE competition_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM farm_competition WHERE competition_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM farm_competition WHERE competition_id = 6))
;

INSERT INTO farm_to_competition_record VALUES
	 ((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 7), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm WHERE farm_id = 8), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
;

INSERT INTO farm_competition_to_competition_record VALUES
	 ((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 1), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 2), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 3), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 4), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 5), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 8))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 2))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 1 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 4))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 2 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 7))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 3 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 3))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 4 AND farm_id = 1))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 5))
	,((SELECT $node_id FROM farm_competition WHERE competition_id = 6), (SELECT $node_id FROM competition_record WHERE competition_id = 5 AND farm_id = 3))
;

