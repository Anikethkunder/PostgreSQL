CREATE DATABASE universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    size NUMERIC NOT NULL,
    description TEXT,
    habitable BOOLEAN NOT NULL
);
-- Insert data into the galaxy table
INSERT INTO galaxy (name, size, description, habitable)
VALUES
    ('Milky Way', 100000, 'Our home galaxy', TRUE),
    ('Andromeda', 220000, 'Nearest large galaxy', TRUE),
    ('Triangulum', 60000, 'Part of the Local Group', TRUE),
    ('Sombrero', 50000, 'Bright central bulge', FALSE),
    ('Whirlpool', 80000, 'Famous spiral galaxy', FALSE),
    ('Pinwheel', 170000, 'Large spiral galaxy', TRUE);

-- Create the star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    age NUMERIC NOT NULL,
    has_planets BOOLEAN NOT NULL
);

-- Insert data into the star table
INSERT INTO star (name, galaxy_id, age, has_planets)
VALUES
    ('Sun', 1, 4.6, TRUE),
    ('Sirius', 1, 0.25, TRUE),
    ('Betelgeuse', 2, 8.0, TRUE),
    ('Rigel', 2, 8.0, TRUE),
    ('Vega', 3, 0.455, TRUE),
    ('Altair', 3, 1.2, TRUE);

-- Create the planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    mass NUMERIC NOT NULL,
    has_moon BOOLEAN NOT NULL
);

-- Insert data into the planet table
INSERT INTO planet (name, star_id, mass, has_moon)
VALUES
    ('Earth', 1, 1.0, TRUE),
    ('Mars', 1, 0.107, TRUE),
    ('Jupiter', 1, 317.8, TRUE),
    ('Venus', 1, 0.815, FALSE),
    ('Proxima b', 2, 1.3, FALSE),
    ('Sirius b Planet', 2, 1.1, FALSE),
    ('Betelgeuse a', 3, 5.0, FALSE),
    ('Rigel b', 4, 3.2, TRUE),
    ('Vega a', 5, 2.1, FALSE),
    ('Altair b', 6, 4.2, TRUE),
    ('Alpha Planet', 6, 0.9, FALSE),
    ('Beta Planet', 6, 1.5, FALSE);

-- Create the moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    size NUMERIC NOT NULL,
    has_atmosphere BOOLEAN NOT NULL
);

-- Insert data into the moon table
INSERT INTO moon (name, planet_id, size, has_atmosphere)
VALUES
    ('Moon', 1, 0.2724, FALSE),
    ('Phobos', 2, 0.0005, FALSE),
    ('Deimos', 2, 0.0003, FALSE),
    ('Io', 3, 0.286, TRUE),
    ('Europa', 3, 0.245, TRUE),
    ('Ganymede', 3, 0.413, TRUE),
    ('Callisto', 3, 0.378, TRUE),
    ('Titan', 3, 0.404, TRUE),
    ('Venus No Moon', 4, 0.0, FALSE),
    ('Proxima b Moon', 5, 0.1, FALSE),
    ('Sirius b Satellite', 6, 0.2, FALSE),
    ('Betelgeuse No Moon', 7, 0.0, FALSE),
    ('Rigel a Moon', 8, 0.5, TRUE),
    ('Rigel b Moon', 8, 0.3, TRUE),
    ('Vega a Moon', 9, 0.6, TRUE),
    ('Altair b Moon', 10, 0.7, TRUE),
    ('Alpha No Moon', 11, 0.0, FALSE),
    ('Beta Small Moon', 12, 0.2, TRUE),
    ('Beta Large Moon', 12, 0.4, TRUE),
    ('Beta Hidden Moon', 12, 0.1, FALSE);

-- Verify data
SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;
