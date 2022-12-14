--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: city_weathers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city_weathers (
    id bigint NOT NULL,
    country character varying,
    name character varying,
    temperature integer,
    weather_description text,
    wind_speed integer,
    wind_degree integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.city_weathers OWNER TO postgres;

--
-- Name: city_weathers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_weathers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_weathers_id_seq OWNER TO postgres;

--
-- Name: city_weathers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_weathers_id_seq OWNED BY public.city_weathers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    city character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: city_weathers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_weathers ALTER COLUMN id SET DEFAULT nextval('public.city_weathers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-01-03 15:14:12.31485	2023-01-03 15:14:12.31485
\.


--
-- Data for Name: city_weathers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city_weathers (id, country, name, temperature, weather_description, wind_speed, wind_degree, created_at, updated_at) FROM stdin;
1	IR	Farrokh Shahr	1	Light Rain	3	223	2023-01-05 10:25:09.207479	2023-01-05 10:25:09.207479
2	QA	Doha	22	Broken clouds	1	3	2023-01-05 10:25:24.650767	2023-01-05 10:25:24.650767
3	FR	Paris	12	Broken clouds	4	248	2023-01-05 10:25:32.690303	2023-01-05 10:25:32.690303
4	GB	City of London	11	Broken clouds	4	226	2023-01-05 10:25:46.574226	2023-01-05 10:25:46.574226
5	US	Egypt	9	Broken clouds	3	285	2023-01-05 10:26:00.81971	2023-01-05 10:26:00.81971
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20221207123157
20221207124148
20221208170028
20221212125629
20221212154616
20221216133031
20221216133154
20221216133403
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, created_at, updated_at, city) FROM stdin;
1	talakhatib4@gmail.com	2023-01-05 10:26:16.098447	2023-01-05 10:26:16.098447	Beirut
2	nazih@gmail.com	2023-01-05 10:27:14.95701	2023-01-05 10:27:14.95701	Beirut
\.


--
-- Name: city_weathers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_weathers_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: city_weathers city_weathers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_weathers
    ADD CONSTRAINT city_weathers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

