--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE galaxy (
    galaxy_id integer SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(40) NOT NULL,
    description TEXT,
    age_in_millions_of_years INTEGER,
    distance_from_earth NUMERIC
);


ALTER TABLE galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE galaxy_types (
    galaxy_types_id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(40) NOT NULL,
    description TEXT
);


ALTER TABLE galaxy_types OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(40) NOT NULL,
    description TEXT,
    planet_id INTEGER,
    age_in_millions_of_years INTEGER,
    distance_from_earth NUMERIC,
    is_spherical boolean DEFAULT true
);


ALTER TABLE moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE planet (
    planet_id SERIAL,
    name VARCHAR(40) NOT NULL,
    description TEXT,
    has_life boolean DEFAULT false NOT NULL,
    star_id INTEGER,
    age_in_millions_of_years INTEGER,
    distance_from_earth NUMERIC,
    is_spherical boolean DEFAULT true
);


ALTER TABLE planet OWNER TO freecodecamp;

--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE planet_types (
    planet_types_id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(40) NOT NULL,
    description TEXT
);


ALTER TABLE planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(40) NOT NULL,
    description TEXT,
    galaxy_id INTEGER,
    age_in_millions_of_years INTEGER,
    distance_from_earth NUMERIC,
    is_spherical boolean DEFAULT true
);


ALTER TABLE star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO galaxy VALUES ('Milky Way', 'The galaxy containing our Solar System.', 13600, 100000000000000);
INSERT INTO galaxy VALUES ('Andromeda', 'A spiral galaxy similar to the Milky Way.', 10000, 2537000000000000);
INSERT INTO galaxy VALUES ('Whirlpool', 'A stunning spiral galaxy with a notable companion galaxy.', 23, 37000000000000);
INSERT INTO galaxy VALUES ('Sombrero', 'A spiral galaxy known for its distinctive shape resembling a hat.', 10000, 29000000000000);
INSERT INTO galaxy VALUES ('Triangulum', 'A small, spiral galaxy near Andromeda and the Milky Way.', 13000, 2723000000000000);
INSERT INTO galaxy VALUES ('Centaurus A', 'A peculiar galaxy with an elliptical core and prominent dust lane.', 13000, 13000000000000);
INSERT INTO galaxy VALUES ('Pinwheel', 'A beautiful face-on spiral galaxy with prominent spiral arms.', 21000, 23500000000000);
INSERT INTO galaxy VALUES ('Leo I', 'A dwarf spheroidal galaxy located in the Leo constellation.', 10000, 800000000000000);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO galaxy_types VALUES 'spiral', 'Thgalaxies have a distinct spiral structure with arms that wrap around a central bulge. The arms contain young stars, while the bulge typically contains older stars. Examples include the Milky Way and the Andromeda Galaxy.');
INSERT INTO galaxy_types VALUES ('elliptical', 'Elliptical galaxies have a smooth and elongated shape, resembling an ellipse or a flattened sphere. They lack the spiral arms seen in spiral galaxies and are composed mainly of older stars. Elliptical galaxies come in different sizes, from giant ellipticals to smaller dwarf ellipticals.');
INSERT INTO galaxy_types VALUES ('irregular', 'Irregular galaxies do not have a specific shape and lack the characteristic structures seen in spiral or elliptical galaxies. They often exhibit chaotic and irregular patterns. These galaxies can contain a mix of young and old stars, as well as gas and dust. The Large Magellanic Cloud is an example of an irregular galaxy.');
INSERT INTO galaxy_types VALUES ('lenticular', 'Lenticular galaxies, also known as S0 galaxies, have a disc-like shape similar to spiral galaxies but lack the prominent spiral arms. They have a central bulge and a flattened, disk-like structure. Lenticular galaxies contain both older and younger stars.');
INSERT INTO galaxy_types VALUES ('dwarf', 'Dwarf galaxies are smaller and less massive than typical spiral or elliptical galaxies. They come in various forms, such as dwarf elliptical galaxies, dwarf irregular galaxies, and dwarf spheroidal galaxies. These galaxies often exist as satellite galaxies around larger galaxies.');
INSERT INTO galaxy_types VALUES ('barred spiral', 'Barred spiral galaxies have a distinct bar-like structure crossing through the central bulge, with spiral arms extending from the ends of the bar. The Milky Way is an example of a barred spiral galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO moon VALUES ('Moon', 'Earth''s natural satellite.', 1, 4600, 384400, true);
INSERT INTO moon VALUES ('Phobos', 'Mars'' larger moon.', 2, 4600, 9377, true);
INSERT INTO moon VALUES ('Deimos', 'Mars'' smaller moon.', 2, 4600, 23460, true);
INSERT INTO moon VALUES ('Ganymede', 'Jupiter''s largest moon.', 5, 4600, 628300, true);
INSERT INTO moon VALUES ('Callisto', 'Jupiter''s second-largest moon.', 5, 4600, 628300, true);
INSERT INTO moon VALUES ('Io', 'Jupiter''s volcanic moon.', 5, 4600, 628300, true);
INSERT INTO moon VALUES ('Europa', 'Jupiter''s icy moon.', 5, 4600, 628300, true);
INSERT INTO moon VALUES ('Titan', 'Saturn''s largest moon.', 6, 4600, 1272000, true);
INSERT INTO moon VALUES ('Enceladus', 'Saturn''s moon with geysers.', 6, 4600, 1272000, true);
INSERT INTO moon VALUES ('Miranda', 'Uranus'' smallest spherical moon.', 7, 4600, 2743000, true);
INSERT INTO moon VALUES ('Ariel', 'Uranus'' moon with icy surface.', 7, 4600, 2743000, true);
INSERT INTO moon VALUES ('Triton', 'Neptune''s largest moon.', 8, 4600, 4352000, true);
INSERT INTO moon VALUES ('Charon', 'Pluto''s largest moon.', 9, 4600, 5874000, true);
INSERT INTO moon VALUES ('Metis', 'Jupiter''s innermost moon.', 5, 4600, 628300, true);
INSERT INTO moon VALUES ('Tethys', 'Saturn''s icy moon with a large crater.', 6, 4600, 1272000, true);
INSERT INTO moon VALUES ('Oberon', 'Uranus'' outermost major moon.', 7, 4600, 2743000, true);
INSERT INTO moon VALUES ('Nereid', 'Neptune''s third-largest moon.', 8, 4600, 4352000, true);
INSERT INTO moon VALUES ('Hydra', 'Pluto''s second-largest moon.', 9, 4600, 5874000, true);
INSERT INTO moon VALUES ('Himalia', 'Jupiter''s irregular-shaped moon.', 5, 4600, 628300, true);
INSERT INTO moon VALUES ('Phoebe', 'Saturn''s irregular-shaped moon.', 6, 4600, 1272000, true);
INSERT INTO moon VALUES ('Mimas', 'Saturn''s moon with a prominent crater.', 6, 4600, 1272000, true);
INSERT INTO moon VALUES ('Rhea', 'Saturn''s second-largest moon with a cratered surface.', 6, 4600, 1272000, true);
INSERT INTO moon VALUES ('Iapetus', 'Saturn''s moon with a two-tone coloration.', 6, 4600, 1272000, true);
INSERT INTO moon VALUES ('Dione', 'Saturn''s moon with prominent icy cliffs.', 6, 4600, 1272000, true);
INSERT INTO moon VALUES ('Hyperion', 'Saturn''s irregular-shaped moon with a sponge-like surface.', 6, 4600, 1272000, false);
INSERT INTO moon VALUES ('Umbriel', 'Uranus'' moon with a dark surface.', 7, 4600, 2743000, true);
INSERT INTO moon VALUES ('Proteus', 'Neptune''s second-largest moon with an irregular shape.', 8, 4600, 4352000, true);
INSERT INTO moon VALUES ('Naiad', 'Neptune''s innermost moon with an elongated shape.', 8, 4600, 4352000, true);
INSERT INTO moon VALUES ('Amalthea', 'Jupiter''s red-colored irregular-shaped moon.', 5, 4600, 628300, true);
INSERT INTO moon VALUES ('Puck', 'Uranus'' small moon with a low-density surface.', 7, 4600, 2743000, false);
INSERT INTO moon VALUES ('Larissa', 'Neptune''s fifth-largest moon with a heavily cratered surface.', 8, 4600, 4352000, true);
INSERT INTO moon VALUES ('Methone', 'Saturn''s small and elongated moon with a smooth surface.', 6, 4600, 1272000, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO planet VALUES ('Earth', 'Our home planet.', true, 1, 4600, 0, true);
INSERT INTO planet VALUES ('Mars', 'The red planet with potential for life.', false, 1, 4600, 78340000, true);
INSERT INTO planet VALUES ('Mercury', 'The closest planet to the Sun.', false, 1, 4600, 77340000, true);
INSERT INTO planet VALUES ('Venus', 'The second planet from the Sun.', false, 1, 4600, 40040000, true);
INSERT INTO planet VALUES ('Jupiter', 'The largest planet in our solar system.', false, 1, 4600, 628730000, true);
INSERT INTO planet VALUES ('Saturn', 'The ringed planet with beautiful rings.', false, 1, 4600, 1275000000, true);
INSERT INTO planet VALUES ('Uranus', 'The seventh planet from the Sun. Uranus is big and gassy.', false, 1, 4600, 2723950000, true);
INSERT INTO planet VALUES ('Neptune', 'The farthest known planet from the Sun.', false, 1, 4600, 4351400000, true);
INSERT INTO planet VALUES ('Pluto', 'A dwarf planet in the Kuiper Belt.', false, 1, 4600, 5913520000, true);
INSERT INTO planet VALUES ('Kepler-452b', 'An exoplanet in the habitable zone of its star.', false, 2, 6000, 1792000000000, true);
INSERT INTO planet VALUES ('Proxima b', 'The closest known exoplanet to Earth.', false, 3, 4850, 39900000000000, true);
INSERT INTO planet VALUES ('Gliese 667Cc', 'An exoplanet within the habitable zone of its star.', false, 4, 7000, 22339000000000, true);
INSERT INTO planet VALUES ('Kepler-22b', 'A potentially habitable exoplanet.', false, 5, 4600, 600000000000, true);
INSERT INTO planet VALUES ('Proxima c', 'A potential exoplanet orbiting Proxima Centauri.', false, 3, 4850, 39900000000000, true);
INSERT INTO planet VALUES ('Gliese 581d', 'An exoplanet within the habitable zone of its star.', false, 6, 7000, 20440000000000, true);
INSERT INTO planet VALUES ('Kepler-186f', 'An exoplanet within the habitable zone of its star.', false, 6, 4000, 561000000000, true);
INSERT INTO planet VALUES ('Andromeda Prime', 'A fictional exoplanet in the Andromeda system.', false, 7, NULL, NULL, true);
INSERT INTO planet VALUES ('Whirlpool Prime', 'A fictional exoplanet in the Whirlpool system.', false, 8, NULL, NULL, true);
INSERT INTO planet VALUES ('Triangulum Alpha', 'A fictional exoplanet in the Triangulum system.', false, 10, NULL, NULL, true);
INSERT INTO planet VALUES ('Centaurus Prime', 'A fictional exoplanet in the Centaurus A system.', false, 11, NULL, NULL, true);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO planet_types VALUES ('Terrestrial Planets', 'Terrestrial planets, also known as rocky planets, are similar in composition to Earth. They have solid surfaces primarily made up of rocks and metals. Examples include Mercury, Venus, Earth, and Mars.');
INSERT INTO planet_types VALUES ('Gas Giants', 'Gas giants, also called jovian planets, are composed mostly of hydrogen and helium gases. They have thick atmospheres and lack a well-defined solid surface. Examples include Jupiter and Saturn.');
INSERT INTO planet_types VALUES ('Ice Giants', 'Ice giants are similar to gas giants but have a higher proportion of "ices" such as water, ammonia, and methane in their composition. They also have significant hydrogen and helium atmospheres. Examples include Uranus and Neptune.');
INSERT INTO planet_types VALUES ('Super-Earths', 'Super-Earths are planets that have a larger mass and size than Earth but are smaller than gas giants. They can have rocky surfaces and thick atmospheres. The term "super-Earth" refers to the planet''s mass and does not necessarily imply Earth-like conditions.');
INSERT INTO planet_types VALUES ('Mini-Neptunes', 'Mini-Neptunes are intermediate-sized planets that have a solid core surrounded by a thick hydrogen and helium atmosphere. They are larger than Earth but smaller than gas giants.');
INSERT INTO planet_types VALUES ('Exoplanets', 'Exoplanets are planets that orbit stars outside of our solar system. They come in various types, including hot Jupiters (gas giants close to their host stars), rocky exoplanets (similar to terrestrial planets), and mini-Neptunes, among others. Exoplanets exhibit a wide range of characteristics and provide valuable insights into planetary diversity.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO star VALUES ('Sun', 'The star at the center of our Solar System.', 1, 4600, 149597870.7, false);
INSERT INTO star VALUES ('Vega', 'A bright star in the constellation Lyra.', 1, 455, 25000000, false);
INSERT INTO star VALUES ('Proxima Centauri', 'The closest star to the Sun.', 1, 4850, 39900000000000, false);
INSERT INTO star VALUES ('Deneb', 'A supergiant star in the constellation Cygnus.', 1, 8000, 2615000, false);
INSERT INTO star VALUES ('Betelgeuse', 'A red supergiant in the constellation Orion.', 1, 8000, 642500000, false);
INSERT INTO star VALUES ('Alpha Centauri A', 'A close binary star system in the Alpha Centauri system.', 1, 6000, 41346000000000, false);
INSERT INTO star VALUES ('Alpheratz', 'A binary star system in the constellation Andromeda.', 2, 120, 97000000, false);
INSERT INTO star VALUES ('Whirlpool Star 1', 'A young massive star in the Whirlpool Galaxy.', 3, 5, 37000000000000, false);
INSERT INTO star VALUES ('Sombrero Star', 'A blue supergiant in the Sombrero Galaxy.', 4, 20000, 29000000000000, false);
INSERT INTO star VALUES ('Triangulum Star', 'A main sequence star in the Triangulum Galaxy.', 5, 50000, 2723000000000000, false);
INSERT INTO star VALUES ('Centaurus A Star', 'A red giant in the Centaurus A Galaxy.', 6, 10000, 13000000000000, false);
INSERT INTO star VALUES ('Pinwheel Star', 'A massive star in the Pinwheel Galaxy.', 7, 15000, 23500000000000, false);
INSERT INTO star VALUES ('Leo I Star', 'A dwarf star in the Leo I Galaxy.', 8, 8000, 800000000000000, false);



--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES star(star_id);


--
-- PostgreSQL database dump complete
--
