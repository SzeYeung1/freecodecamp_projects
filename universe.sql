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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    solar_mass integer,
    type_of_black_hole character varying(20)
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type_of_galaxy character varying(15) NOT NULL,
    constellation character varying(20),
    distance_in_mly numeric(6,2),
    number_of_stars_in_b integer,
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    earth_mass numeric(5,3),
    earth_radius numeric(5,3),
    composition text,
    has_ocean boolean
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    type_of_planet character varying(20),
    earth_mass numeric(14,2),
    earth_radius numeric(14,2),
    have_life boolean,
    no_of_moons integer
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
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    type_of_star character varying(15),
    distance_in_ly numeric(9,2),
    solar_mass numeric(6,2),
    no_of_planets integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Andromeda G N', 2, 20000000, 'supermassive');
INSERT INTO public.black_hole VALUES (2, 'Centaurus A N', 3, 55000000, 'supermassive');
INSERT INTO public.black_hole VALUES (3, 'Great Annihilator', 1, NULL, 'stellar mass');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 'sagittarius', 0.03, 400, 'home of Solar system and Earth');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral-SA(s)b', 'Andromeda', 2.45, 1000, 'closest large galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 'lenticular', 'Centaurus', 16.00, 400, 'closest radio galaxy to Earth');
INSERT INTO public.galaxy VALUES (4, 'Eye of Sauron', 'im spiral', 'Canes Venatici', 51.50, 1200, 'may have binary black hole in the necleus');
INSERT INTO public.galaxy VALUES (5, 'Cigar', 'I0', 'Ursa Major', 12.40, 1400, 'closest starburst galaxy to Earth');
INSERT INTO public.galaxy VALUES (6, 'M87', 'elliptical', 'Virgo', 53.50, 1000, 'homeland of Ultras');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.012, 0.273, 'rock', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.001, 0.002, 'rock and icce', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.001, 0.012, 'rock', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 0.015, 0.286, 'rock and iron', false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0.008, 0.245, 'rock, ice, iron and nickel', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 0.025, 0.413, 'rock, water, metal', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 0.018, 0.378, 'rock and ice', true);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 0.001, 0.002, 'ice and rock', false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 0.002, 0.040, 'water, ice, rock', true);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 0.002, 0.083, 'ice and rock', false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 0.001, 0.001, 'rock and ice', true);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 0.001, 0.001, 'ice and rock', false);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 0.023, 0.404, 'ice and rock', true);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 0.001, 0.091, 'ice and rock', false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 0.001, 0.092, 'ice and rock', false);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 0.003, 0.124, 'ice and rock', true);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 0.003, 0.119, 'ice and rock', true);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 0.004, 0.212, 'nitrogen, ice and rock', true);
INSERT INTO public.moon VALUES (19, 'Iapetus', 6, 0.001, 0.001, 'ice and rock', false);
INSERT INTO public.moon VALUES (20, 'Space Prison', 12, 3.600, 6.000, 'ice and rock', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'terrestrial', 0.06, 0.38, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'terrestrial', 0.82, 0.95, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'terrestrial', 1.00, 1.00, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'terrestrial', 0.11, 0.53, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'gas giant', 317.80, 10.97, false, 80);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'gas giant', 95.16, 9.14, false, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'ice giant', 14.54, 4.00, false, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'ice giant', 17.15, 3.88, false, 14);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'terrestrial', 1.07, 1.30, false, 0);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, 'super-Earth', 7.00, NULL, false, 0);
INSERT INTO public.planet VALUES (11, 'Gliese 876 c', 4, 'gas giant', 265.60, NULL, false, 0);
INSERT INTO public.planet VALUES (12, 'Land of Light', 6, 'terrestrial', 60.00, NULL, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'red drawf', 4.25, 0.12, 3);
INSERT INTO public.star VALUES (1, 'Sun', 1, 'yellow dwarf', 0.01, 1.00, 8);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'bi white dwarf', 8.71, 2.06, 0);
INSERT INTO public.star VALUES (4, 'Gliese 876', 1, 'red dwarf', 15.24, 0.37, 4);
INSERT INTO public.star VALUES (5, 'AE Andromedae', 2, 'LBV', 2500000.00, 120.00, 0);
INSERT INTO public.star VALUES (6, 'Ultra Star', 6, 'Yellow Dwarf', 5350000.00, 2.00, 9);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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