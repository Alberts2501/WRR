--
-- PostgreSQL database cluster dump
--

-- Started on 2023-06-08 03:37:48

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:A+mQuEw4h6LbjK+tLRvWeA==$x2w/Dir4T1+u1YFU7VqncgceKyDe5C98CLiFepKrch0=:YkQu/40BEoPYzP8vZzM5iA9BAIJPG5tp3xETkrK3YOw=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\c wrr_diagramma

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-08 03:37:48

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

-- Completed on 2023-06-08 03:37:49

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-08 03:37:49

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

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 857 (class 1247 OID 16429)
-- Name: relation_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.relation_type AS ENUM (
    'relative',
    'familiar',
    'none'
);


ALTER TYPE public.relation_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16469)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    user_id integer NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: deceaseds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deceaseds (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    personal_code text NOT NULL,
    birth_date date NOT NULL,
    death_date date NOT NULL,
    funeral_date date NOT NULL,
    necrologue text
);


ALTER TABLE public.deceaseds OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16405)
-- Name: deceaseds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.deceaseds ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.deceaseds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16450)
-- Name: graveyards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.graveyards (
    id integer NOT NULL,
    name text,
    email text NOT NULL,
    phone text NOT NULL,
    web text NOT NULL,
    address text NOT NULL,
    places integer NOT NULL
);


ALTER TABLE public.graveyards OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16449)
-- Name: graveyards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.graveyards ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.graveyards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16413)
-- Name: relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relations (
    user_id integer NOT NULL,
    deceased_id integer NOT NULL,
    id integer NOT NULL,
    type public.relation_type DEFAULT 'none'::public.relation_type NOT NULL
);


ALTER TABLE public.relations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16422)
-- Name: relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.relations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16442)
-- Name: tombs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tombs (
    id integer NOT NULL,
    tomb_nr integer NOT NULL,
    deceased_id integer NOT NULL,
    graveyard_id integer NOT NULL
);


ALTER TABLE public.tombs OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16441)
-- Name: tombs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tombs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tombs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16398)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    personal_code text NOT NULL,
    birth_date date NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16455)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3375 (class 0 OID 16469)
-- Dependencies: 225
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admins (user_id) VALUES (1);
INSERT INTO public.admins (user_id) VALUES (3);


--
-- TOC entry 3367 (class 0 OID 16406)
-- Dependencies: 217
-- Data for Name: deceaseds; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.deceaseds (id, first_name, last_name, personal_code, birth_date, death_date, funeral_date, necrologue) OVERRIDING SYSTEM VALUE VALUES (3, 'Some', 'User
', '112343-21213', '2023-06-07', '2023-06-07', '2023-06-07', NULL);
INSERT INTO public.deceaseds (id, first_name, last_name, personal_code, birth_date, death_date, funeral_date, necrologue) OVERRIDING SYSTEM VALUE VALUES (5, 'ThisIsTestOf', 'Relative', '12312312', '2023-06-07', '2023-06-07', '2023-06-07', NULL);
INSERT INTO public.deceaseds (id, first_name, last_name, personal_code, birth_date, death_date, funeral_date, necrologue) OVERRIDING SYSTEM VALUE VALUES (6, 'Mary', 'Vakifoe', '228833-11111', '1991-06-13', '2021-06-25', '2021-06-30', NULL);


--
-- TOC entry 3373 (class 0 OID 16450)
-- Dependencies: 223
-- Data for Name: graveyards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.graveyards (id, name, email, phone, web, address, places) OVERRIDING SYSTEM VALUE VALUES (1, 'Some Test Graveyard', 'someemail@email.com', '+37129888371', 'www.somewebpage.eu', 'Some Street 12', 122);


--
-- TOC entry 3368 (class 0 OID 16413)
-- Dependencies: 218
-- Data for Name: relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.relations (user_id, deceased_id, id, type) OVERRIDING SYSTEM VALUE VALUES (1, 3, 1, 'familiar');
INSERT INTO public.relations (user_id, deceased_id, id, type) OVERRIDING SYSTEM VALUE VALUES (1, 5, 3, 'relative');
INSERT INTO public.relations (user_id, deceased_id, id, type) OVERRIDING SYSTEM VALUE VALUES (1, 6, 4, 'none');


--
-- TOC entry 3371 (class 0 OID 16442)
-- Dependencies: 221
-- Data for Name: tombs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tombs (id, tomb_nr, deceased_id, graveyard_id) OVERRIDING SYSTEM VALUE VALUES (1, 12, 3, 1);


--
-- TOC entry 3365 (class 0 OID 16398)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email, phone, personal_code, birth_date, password, first_name, last_name) OVERRIDING SYSTEM VALUE VALUES (1, 'abobus123@gmail.com', '+37129362884', '472284-22775', '2012-04-06', 'root', 'Alex', 'Scrubb');
INSERT INTO public.users (id, email, phone, personal_code, birth_date, password, first_name, last_name) OVERRIDING SYSTEM VALUE VALUES (2, 'someemail@b.eu', '+37120472633', '884724-22815', '2023-06-07', 'root', 'Mary', 'Test');
INSERT INTO public.users (id, email, phone, personal_code, birth_date, password, first_name, last_name) OVERRIDING SYSTEM VALUE VALUES (3, 'test@admin.su', '+37122374912', '223958-11148', '2023-06-08', 'pass', 'Admin', 'Add');


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 216
-- Name: deceaseds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deceaseds_id_seq', 6, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 222
-- Name: graveyards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.graveyards_id_seq', 3, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 219
-- Name: relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relations_id_seq', 4, true);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 220
-- Name: tombs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tombs_id_seq', 1, true);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 3217 (class 2606 OID 16484)
-- Name: admins admins_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_key UNIQUE (user_id);


--
-- TOC entry 3205 (class 2606 OID 16486)
-- Name: deceaseds deceaseds_personal_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deceaseds
    ADD CONSTRAINT deceaseds_personal_code_key UNIQUE (personal_code);


--
-- TOC entry 3207 (class 2606 OID 16410)
-- Name: deceaseds deceaseds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deceaseds
    ADD CONSTRAINT deceaseds_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 16482)
-- Name: graveyards graveyards_address_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.graveyards
    ADD CONSTRAINT graveyards_address_name_key UNIQUE (address, name);


--
-- TOC entry 3215 (class 2606 OID 16462)
-- Name: graveyards graveyards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.graveyards
    ADD CONSTRAINT graveyards_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16427)
-- Name: relations relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 16448)
-- Name: tombs tombs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tombs
    ADD CONSTRAINT tombs_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 16404)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 16435)
-- Name: relations deceased_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT deceased_id FOREIGN KEY (deceased_id) REFERENCES public.deceaseds(id);


--
-- TOC entry 3220 (class 2606 OID 16456)
-- Name: tombs deceased_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tombs
    ADD CONSTRAINT deceased_id FOREIGN KEY (deceased_id) REFERENCES public.deceaseds(id);


--
-- TOC entry 3221 (class 2606 OID 16463)
-- Name: tombs graveyard_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tombs
    ADD CONSTRAINT graveyard_id FOREIGN KEY (graveyard_id) REFERENCES public.graveyards(id);


--
-- TOC entry 3219 (class 2606 OID 16417)
-- Name: relations user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3222 (class 2606 OID 16472)
-- Name: admins user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2023-06-08 03:37:49

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-06-08 03:37:49

--
-- PostgreSQL database cluster dump complete
--

