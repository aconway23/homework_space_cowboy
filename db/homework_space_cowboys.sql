DROP TABLE IF EXISTS space_cowboy;

CREATE TABLE space_cowboy (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  homeworld VARCHAR(255),
  favourite_weapon VARCHAR(255)

);
