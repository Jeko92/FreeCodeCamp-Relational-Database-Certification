--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Homebrew)
-- Dumped by pg_dump version 16.2

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

DROP DATABASE salon;
--
-- Name: salon; Type: DATABASE; Schema: -; Owner: jemal.khachidze
--

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE salon OWNER TO "jemal.khachidze";

\connect salon

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: jemal.khachidze
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL
);


ALTER TABLE public.appointments OWNER TO "jemal.khachidze";

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: jemal.khachidze
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_appointment_id_seq OWNER TO "jemal.khachidze";

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jemal.khachidze
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: jemal.khachidze
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL
);


ALTER TABLE public.customers OWNER TO "jemal.khachidze";

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: jemal.khachidze
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO "jemal.khachidze";

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jemal.khachidze
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: jemal.khachidze
--

CREATE TABLE public.services (
    service_id integer NOT NULL
);


ALTER TABLE public.services OWNER TO "jemal.khachidze";

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: jemal.khachidze
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_service_id_seq OWNER TO "jemal.khachidze";

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jemal.khachidze
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: jemal.khachidze
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: jemal.khachidze
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: jemal.khachidze
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: jemal.khachidze
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: jemal.khachidze
--



--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: jemal.khachidze
--



--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jemal.khachidze
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 1, false);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jemal.khachidze
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jemal.khachidze
--

SELECT pg_catalog.setval('public.services_service_id_seq', 1, false);


--
-- Name: appointments appointments_pk; Type: CONSTRAINT; Schema: public; Owner: jemal.khachidze
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pk PRIMARY KEY (appointment_id);


--
-- Name: customers customers_pk; Type: CONSTRAINT; Schema: public; Owner: jemal.khachidze
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pk PRIMARY KEY (customer_id);


--
-- Name: services services_pk; Type: CONSTRAINT; Schema: public; Owner: jemal.khachidze
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pk PRIMARY KEY (service_id);


--
-- PostgreSQL database dump complete
--

