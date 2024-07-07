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

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(30),
    age_billion_yr numeric(4,2),
    dist_earth_mil_ly numeric(10,3),
    sm_blackhole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km integer,
    planet_id integer,
    orbital_period_days numeric(5,1),
    atmosphere text,
    human_exploration boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_mil_km bigint,
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planets_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_moon (
    name character varying(30),
    body_type text,
    distance bigint,
    description text,
    has_life boolean NOT NULL,
    parent_id integer,
    size_in_km integer,
    orbital_period_days numeric,
    atmosphere text,
    human_exploration boolean,
    planets_moon_id integer NOT NULL
);


ALTER TABLE public.planets_moon OWNER TO freecodecamp;

--
-- Name: planets_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planets_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_moon_id_seq OWNED BY public.planets_moon.planets_moon_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_planets integer,
    age_in_billions_of_years numeric(5,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planets_moon planets_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moon ALTER COLUMN planets_moon_id SET DEFAULT nextval('public.planets_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 13.60, 0.000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 10.00, 2.530, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', 7.50, 3.070, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic', 'irregular', 1.50, 0.163, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic', 'irregular', 1.30, 0.200, false);
INSERT INTO public.galaxy VALUES (6, 'M81', 'spiral', 12.00, 12.000, true);
INSERT INTO public.galaxy VALUES (7, 'M82', 'irregular', 10.00, 12.000, true);
INSERT INTO public.galaxy VALUES (8, 'NGC 6822', 'irregular', 11.00, 1.650, false);
INSERT INTO public.galaxy VALUES (9, 'IC 10', 'irregular', 4.00, 2.295, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3476, 1, 27.3, 'None(Exosphere)', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 4, 0.3, 'Very thin exosphere', true);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 4, 1.3, 'Very thin exosphere', true);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 5, 1.8, 'Thin atmosphere(mostly sulfur dioxide)', true);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, 5, 3.5, 'Thin atmosphere(mostly oxygen)', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, 5, 7.2, 'Thin atmoshere(oxygen)', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, 5, 16.7, 'Thin atmoshere(mostly carbon dioxide)', false);
INSERT INTO public.moon VALUES (8, 'Ttitan', 5150, 6, 16.0, 'Dense atmosphere(mostly nitrogen)', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 6, 1.4, 'Water vapor plumes', true);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, 6, 0.9, 'None(exosphere)', false);
INSERT INTO public.moon VALUES (11, 'Triton', 2706, 8, 5.9, 'Thin atmosphere(mostly nitrogen)', false);
INSERT INTO public.moon VALUES (12, 'Rhea', 1529, 6, 4.5, 'none(exosphere)', false);
INSERT INTO public.moon VALUES (13, 'Titania', 2706, 8, 5.9, 'Thin atmosphere(mostly nitrogen)', false);
INSERT INTO public.moon VALUES (14, 'Dione', 1126, 6, 2.7, 'None(exosphere)', false);
INSERT INTO public.moon VALUES (15, 'Iapetus', 1468, 6, 79.0, 'None(exosphere)', false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 1169, 7, 4.1, 'none(expsphere)', false);
INSERT INTO public.moon VALUES (17, 'Ariel', 1158, 7, 2.5, 'none (exposhere)', false);
INSERT INTO public.moon VALUES (18, 'Miranda', 471, 7, 1.4, 'Thin atmospere (mostly nitrogen)', false);
INSERT INTO public.moon VALUES (19, 'Kepler-1625b-i', NULL, 13, NULL, 'Unknown', false);
INSERT INTO public.moon VALUES (20, 'OLG-2005-BLG-390lb-Moon', NULL, 14, NULL, 'Unnkown', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 0, 'Earth is the only known planet with life, featuring a diverse ecosystem, liquid water, and a protective atmosphere.', true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 77, 'Mercury is the closest planet to the Sun with a heavily cratered surface and extreme temperature variations.
', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 42, 'Venus is Earth''s "sister planet" with a thick atmosphere of carbon dioxide, extreme surface temperatures, and a surface obscured by dense clouds.', false, 1);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 12, 'Potential terrestrial (rocky) planet. Estimated to be within the star''s habitable zone. Existence inferred from radial velocity data; confirmation pending.', false, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 55, 'Mars, known as the "Red Planet," has a rusty red appearance due to iron oxide on its surface, with polar ice caps and evidence of past liquid water.', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 970, 'Jupiter is the largest planet with a turbulent atmosphere of colorful cloud bands and the Great Red Spot—a massive storm larger than Earth.', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1653, 'Saturn is famous for its extensive ring system made of ice and rock particles, with a complex atmosphere and numerous moons.', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 3153, 'Uranus is an ice giant planet lying on its side with a faint ring system, composed mostly of hydrogen, helium, and icy materials.', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4555, 'Neptune, the farthest planet from the Sun, is an ice giant with a dynamic atmosphere of high-speed winds and a striking blue color.', false, 1);
INSERT INTO public.planet VALUES (9, 'Tau Ceti b', 112490, 'Potential terrestrial (rocky) planet. Estimated to be within the star''s habitable zone. Existence inferred from radial velocity data; confirmation pending.', false, 2);
INSERT INTO public.planet VALUES (10, 'Tau Ceti c', 112490, 'Another candidate planet around Tau Ceti. Inferred existence from radial velocity measurements; properties such as composition and orbit require further study.', false, 2);
INSERT INTO public.planet VALUES (11, 'Tau Ceti d', 112490, 'Another candidate planet around Tau Ceti. Inferred existence from radial velocity measurements; properties such as composition and orbit require further study.', false, 2);
INSERT INTO public.planet VALUES (13, 'Kepler-1625b', NULL, NULL, false, 10);
INSERT INTO public.planet VALUES (14, 'OGLE-2005-BGL-390LB', NULL, NULL, false, 11);


--
-- Data for Name: planets_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_moon VALUES ('Earth', 'planet', 0, 'Earth is the only known planet with life, featuring a diverse ecosystem, liquid water, and a protective atmosphere.', true, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planets_moon VALUES ('Mercury', 'planet', 77, 'Mercury is the closest planet to the Sun with a heavily cratered surface and extreme temperature variations.
', false, 1, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planets_moon VALUES ('Venus', 'planet', 42, 'Venus is Earth''s "sister planet" with a thick atmosphere of carbon dioxide, extreme surface temperatures, and a surface obscured by dense clouds.', false, 1, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planets_moon VALUES ('Tau Ceti e', 'planet', 12, 'Potential terrestrial (rocky) planet. Estimated to be within the star''s habitable zone. Existence inferred from radial velocity data; confirmation pending.', false, 2, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planets_moon VALUES ('Mars', 'planet', 55, 'Mars, known as the "Red Planet," has a rusty red appearance due to iron oxide on its surface, with polar ice caps and evidence of past liquid water.', false, 1, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planets_moon VALUES ('Jupiter', 'planet', 970, 'Jupiter is the largest planet with a turbulent atmosphere of colorful cloud bands and the Great Red Spot—a massive storm larger than Earth.', false, 1, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planets_moon VALUES ('Saturn', 'planet', 1653, 'Saturn is famous for its extensive ring system made of ice and rock particles, with a complex atmosphere and numerous moons.', false, 1, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planets_moon VALUES ('Uranus', 'planet', 3153, 'Uranus is an ice giant planet lying on its side with a faint ring system, composed mostly of hydrogen, helium, and icy materials.', false, 1, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.planets_moon VALUES ('Neptune', 'planet', 4555, 'Neptune, the farthest planet from the Sun, is an ice giant with a dynamic atmosphere of high-speed winds and a striking blue color.', false, 1, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.planets_moon VALUES ('Tau Ceti b', 'planet', 112490, 'Potential terrestrial (rocky) planet. Estimated to be within the star''s habitable zone. Existence inferred from radial velocity data; confirmation pending.', false, 2, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.planets_moon VALUES ('Tau Ceti c', 'planet', 112490, 'Another candidate planet around Tau Ceti. Inferred existence from radial velocity measurements; properties such as composition and orbit require further study.', false, 2, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.planets_moon VALUES ('Tau Ceti d', 'planet', 112490, 'Another candidate planet around Tau Ceti. Inferred existence from radial velocity measurements; properties such as composition and orbit require further study.', false, 2, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.planets_moon VALUES ('Kepler-1625b', 'planet', NULL, NULL, false, 10, NULL, NULL, NULL, NULL, 13);
INSERT INTO public.planets_moon VALUES ('OGLE-2005-BGL-390LB', 'planet', NULL, NULL, false, 11, NULL, NULL, NULL, NULL, 14);
INSERT INTO public.planets_moon VALUES ('Moon', 'moon', NULL, NULL, false, 1, 3476, 27.3, 'None(Exosphere)', true, 15);
INSERT INTO public.planets_moon VALUES ('Phobos', 'moon', NULL, NULL, false, 4, 22, 0.3, 'Very thin exosphere', true, 16);
INSERT INTO public.planets_moon VALUES ('Deimos', 'moon', NULL, NULL, false, 4, 12, 1.3, 'Very thin exosphere', true, 17);
INSERT INTO public.planets_moon VALUES ('Io', 'moon', NULL, NULL, false, 5, 3643, 1.8, 'Thin atmosphere(mostly sulfur dioxide)', true, 18);
INSERT INTO public.planets_moon VALUES ('Europa', 'moon', NULL, NULL, false, 5, 3121, 3.5, 'Thin atmosphere(mostly oxygen)', true, 19);
INSERT INTO public.planets_moon VALUES ('Ganymede', 'moon', NULL, NULL, false, 5, 5262, 7.2, 'Thin atmoshere(oxygen)', true, 20);
INSERT INTO public.planets_moon VALUES ('Callisto', 'moon', NULL, NULL, false, 5, 4821, 16.7, 'Thin atmoshere(mostly carbon dioxide)', false, 21);
INSERT INTO public.planets_moon VALUES ('Ttitan', 'moon', NULL, NULL, false, 6, 5150, 16.0, 'Dense atmosphere(mostly nitrogen)', true, 22);
INSERT INTO public.planets_moon VALUES ('Enceladus', 'moon', NULL, NULL, false, 6, 504, 1.4, 'Water vapor plumes', true, 23);
INSERT INTO public.planets_moon VALUES ('Mimas', 'moon', NULL, NULL, false, 6, 396, 0.9, 'None(exosphere)', false, 24);
INSERT INTO public.planets_moon VALUES ('Triton', 'moon', NULL, NULL, false, 8, 2706, 5.9, 'Thin atmosphere(mostly nitrogen)', false, 25);
INSERT INTO public.planets_moon VALUES ('Rhea', 'moon', NULL, NULL, false, 6, 1529, 4.5, 'none(exosphere)', false, 26);
INSERT INTO public.planets_moon VALUES ('Titania', 'moon', NULL, NULL, false, 8, 2706, 5.9, 'Thin atmosphere(mostly nitrogen)', false, 27);
INSERT INTO public.planets_moon VALUES ('Dione', 'moon', NULL, NULL, false, 6, 1126, 2.7, 'None(exosphere)', false, 28);
INSERT INTO public.planets_moon VALUES ('Iapetus', 'moon', NULL, NULL, false, 6, 1468, 79.0, 'None(exosphere)', false, 29);
INSERT INTO public.planets_moon VALUES ('Umbriel', 'moon', NULL, NULL, false, 7, 1169, 4.1, 'none(expsphere)', false, 30);
INSERT INTO public.planets_moon VALUES ('Ariel', 'moon', NULL, NULL, false, 7, 1158, 2.5, 'none (exposhere)', false, 31);
INSERT INTO public.planets_moon VALUES ('Miranda', 'moon', NULL, NULL, false, 7, 471, 1.4, 'Thin atmospere (mostly nitrogen)', false, 32);
INSERT INTO public.planets_moon VALUES ('Kepler-1625b-i', 'moon', NULL, NULL, false, 13, NULL, NULL, 'Unknown', false, 33);
INSERT INTO public.planets_moon VALUES ('OLG-2005-BLG-390lb-Moon', 'moon', NULL, NULL, false, 14, NULL, NULL, 'Unnkown', false, 34);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sol', 8, 4.60, 1);
INSERT INTO public.star VALUES (2, 'Tau Ceti', 4, 5.80, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4.85, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 6.00, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 1, 6.00, 1);
INSERT INTO public.star VALUES (6, 'Barnards Star', 0, 11.00, 1);
INSERT INTO public.star VALUES (7, 'Wolf 359', 0, 5.00, 1);
INSERT INTO public.star VALUES (8, 'Lalande 21185', 0, 7.50, 1);
INSERT INTO public.star VALUES (9, 'Sirius', 0, 0.30, 1);
INSERT INTO public.star VALUES (10, 'Kepler-1625', NULL, NULL, 1);
INSERT INTO public.star VALUES (11, 'OGLE-2005-BLG-390L', NULL, NULL, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 14, true);


--
-- Name: planets_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_moon_id_seq', 34, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 11, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planets_moon planets_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moon
    ADD CONSTRAINT planets_moon_pkey PRIMARY KEY (planets_moon_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planets_moon uc_celestial_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moon
    ADD CONSTRAINT uc_celestial_name UNIQUE (name);


--
-- Name: galaxy uc_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uc_galaxy_name UNIQUE (name);


--
-- Name: moon uc_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uc_moon_name UNIQUE (name);


--
-- Name: star uc_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uc_name UNIQUE (name);


--
-- Name: planet uc_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uc_planet_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

