--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellations (
    constellations_id integer NOT NULL,
    name character varying(60) NOT NULL,
    symbolism character varying(60)
);


ALTER TABLE public.constellations OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellations.constellations_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    size_by_light_years integer,
    type text,
    constellations_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.missions (
    name character varying(60) NOT NULL,
    launch_year integer,
    manned boolean,
    planet_id integer,
    moon_id integer,
    missions_id integer NOT NULL
);


ALTER TABLE public.missions OWNER TO freecodecamp;

--
-- Name: missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.missions_mission_id_seq OWNER TO freecodecamp;

--
-- Name: missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.missions_mission_id_seq OWNED BY public.missions.missions_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    reached_by_humans boolean,
    planet_id integer,
    discovery_year integer
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
    name character varying(60) NOT NULL,
    size_in_earth_volume integer,
    distance_in_au numeric(6,2),
    discovered_by text,
    discovery_year integer,
    reached_by_humans boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    spectral_classification text,
    stage character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellations constellations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations ALTER COLUMN constellations_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: missions missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.missions ALTER COLUMN missions_id SET DEFAULT nextval('public.missions_mission_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellations VALUES (1, 'Sagittarius', 'The Archer');
INSERT INTO public.constellations VALUES (2, 'Andromeda', 'The Chained Woman');
INSERT INTO public.constellations VALUES (3, 'Virgo', 'The Maiden');
INSERT INTO public.constellations VALUES (5, 'Ursa Major', 'The Great Bear');
INSERT INTO public.constellations VALUES (4, 'Mensa', 'The Table Mountain');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Sb', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 200000, 'SA(s)b', 2);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 60000, 'SA(s)a', 3);
INSERT INTO public.galaxy VALUES (4, 'LMC', 32200, 'SB(s)m', 4);
INSERT INTO public.galaxy VALUES (5, 'Cigar', 40800, 'I0', 5);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 170000, 'SAB(rs)cd', 5);


--
-- Data for Name: missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.missions VALUES ('Luna 1', 1959, false, NULL, 1, 1);
INSERT INTO public.missions VALUES ('Apollo 11', 1969, true, NULL, 1, 2);
INSERT INTO public.missions VALUES ('Mars Pathfinder', 1996, false, 2, NULL, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 2, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 2, 1877);
INSERT INTO public.moon VALUES (4, 'Io', false, 3, 1610);
INSERT INTO public.moon VALUES (5, 'Ganymede', false, 3, 1610);
INSERT INTO public.moon VALUES (6, 'Metis', false, 3, 1979);
INSERT INTO public.moon VALUES (7, 'Adrastea', false, 3, 1979);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 3, 1892);
INSERT INTO public.moon VALUES (9, 'Thebe', false, 3, 1979);
INSERT INTO public.moon VALUES (10, 'Europa', false, 3, 1610);
INSERT INTO public.moon VALUES (11, 'Callisto', false, 3, 1610);
INSERT INTO public.moon VALUES (12, 'Themisto', false, 3, 1975);
INSERT INTO public.moon VALUES (13, 'Leda', false, 3, 1974);
INSERT INTO public.moon VALUES (14, 'Ersa', false, 3, 2018);
INSERT INTO public.moon VALUES (15, 'Himalia', false, 3, 2018);
INSERT INTO public.moon VALUES (16, 'Pandia', false, 3, 2017);
INSERT INTO public.moon VALUES (17, 'Lysithea', false, 3, 1938);
INSERT INTO public.moon VALUES (18, 'Elara', false, 3, 1905);
INSERT INTO public.moon VALUES (19, 'Dia', false, 3, 2000);
INSERT INTO public.moon VALUES (20, 'Carpo', false, 3, 2003);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, NULL, NULL, true, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 0, 0.61, NULL, NULL, false, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 0.60, NULL, NULL, false, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1321, 4.20, NULL, NULL, false, 1);
INSERT INTO public.planet VALUES (3, 'Saturn', 764, 4.20, NULL, NULL, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 63, 20.50, 'William Herschel', 1781, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 58, 29.09, 'Galileo Galilei', 1612, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 0, 50.00, 'Clyde W. Tombaugh', 1930, false, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, 2.32, 'Giuseppe Piazzi', 1801, false, 1);
INSERT INTO public.planet VALUES (11, 'Orcus', 0, 48.07, 'M. E. Brown', 2004, false, 1);
INSERT INTO public.planet VALUES (12, 'Eris', 0, 96.26, 'M. E. Brown', 2005, false, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 0, 2.10, NULL, NULL, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 'main sequence');
INSERT INTO public.star VALUES (2, 'Sirius A', 1, 'A0mA1 Va', 'main sequence');
INSERT INTO public.star VALUES (3, 'Sirius B', 1, 'DA2', 'white dwarf');
INSERT INTO public.star VALUES (6, 'Aldebaran', 1, 'K5+ III', 'red giant');
INSERT INTO public.star VALUES (7, 'Alpha Cassiopeiae', 1, 'K0-IIIa', 'red giant');
INSERT INTO public.star VALUES (8, 'Antares', 1, 'M1.5Iab-Ib + B2.5V', 'red supergiant');


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.missions_mission_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellations_id);


--
-- Name: constellations constellations_symbolism_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_symbolism_key UNIQUE (symbolism);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: missions missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_name_key UNIQUE (name);


--
-- Name: missions missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_pkey PRIMARY KEY (missions_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_fkey FOREIGN KEY (constellations_id) REFERENCES public.constellations(constellations_id);


--
-- Name: missions missions_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: missions missions_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--