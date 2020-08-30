--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: actors; Type: TABLE; Schema: public; Owner: lindachen
--

CREATE TABLE public.actors (
    id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    gender character varying NOT NULL,
    movie_id integer NOT NULL
);


ALTER TABLE public.actors OWNER TO lindachen;

--
-- Name: actors_id_seq; Type: SEQUENCE; Schema: public; Owner: lindachen
--

CREATE SEQUENCE public.actors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_id_seq OWNER TO lindachen;

--
-- Name: actors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindachen
--

ALTER SEQUENCE public.actors_id_seq OWNED BY public.actors.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: lindachen
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying NOT NULL,
    release_date timestamp without time zone NOT NULL
);


ALTER TABLE public.movies OWNER TO lindachen;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: lindachen
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO lindachen;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindachen
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: actors id; Type: DEFAULT; Schema: public; Owner: lindachen
--

ALTER TABLE ONLY public.actors ALTER COLUMN id SET DEFAULT nextval('public.actors_id_seq'::regclass);


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: lindachen
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: lindachen
--

COPY public.actors (id, name, age, gender, movie_id) FROM stdin;
2	Margot Robbie	30	F	2
3	Leonardo DiCaprio	45	M	3
4	Carey Mulligan	35	F	3
5	Johnny Depp	57	M	4
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: lindachen
--

COPY public.movies (id, title, release_date) FROM stdin;
2	Birds of Prey	2020-02-07 00:00:00
3	The Great Gatsby	2013-03-10 00:00:00
4	Pirates of the Caribbean: On Stranger Tides	2011-05-20 00:00:00
6	once upon a time in hollywood	2019-07-24 00:00:00
\.


--
-- Name: actors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindachen
--

SELECT pg_catalog.setval('public.actors_id_seq', 10, true);


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindachen
--

SELECT pg_catalog.setval('public.movies_id_seq', 15, true);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: lindachen
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: lindachen
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: actors actors_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lindachen
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- PostgreSQL database dump complete
--

