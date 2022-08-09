--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: EmailMessages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EmailMessages" (
    "ID" integer NOT NULL,
    "MessageID" character varying,
    "ToAddresses" character varying,
    "FromAddresses" character varying,
    "Subject" text,
    "Content" text,
    "MessageDate" date
);


ALTER TABLE public."EmailMessages" OWNER TO postgres;

--
-- Name: EmailMessages_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EmailMessages_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EmailMessages_ID_seq" OWNER TO postgres;

--
-- Name: EmailMessages_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EmailMessages_ID_seq" OWNED BY public."EmailMessages"."ID";


--
-- Name: OperationClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OperationClaims" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."OperationClaims" OWNER TO postgres;

--
-- Name: UserOperationClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserOperationClaims" (
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "OperationClaimId" integer NOT NULL
);


ALTER TABLE public."UserOperationClaims" OWNER TO postgres;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    "Id" integer NOT NULL,
    "FirstName" character varying NOT NULL,
    "LastName" character varying NOT NULL,
    "Email" character varying NOT NULL,
    "PasswordHash" bytea NOT NULL,
    "PasswordSalt" bytea NOT NULL,
    "Status" boolean NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: operationclaims_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operationclaims_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operationclaims_id_seq OWNER TO postgres;

--
-- Name: operationclaims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operationclaims_id_seq OWNED BY public."OperationClaims"."ID";


--
-- Name: useroperationclaims_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.useroperationclaims_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.useroperationclaims_id_seq OWNER TO postgres;

--
-- Name: useroperationclaims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.useroperationclaims_id_seq OWNED BY public."UserOperationClaims"."Id";


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public."Users"."Id";


--
-- Name: EmailMessages ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EmailMessages" ALTER COLUMN "ID" SET DEFAULT nextval('public."EmailMessages_ID_seq"'::regclass);


--
-- Name: OperationClaims ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OperationClaims" ALTER COLUMN "ID" SET DEFAULT nextval('public.operationclaims_id_seq'::regclass);


--
-- Name: UserOperationClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserOperationClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public.useroperationclaims_id_seq'::regclass);


--
-- Name: Users Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "Id" SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: EmailMessages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EmailMessages" ("ID", "MessageID", "ToAddresses", "FromAddresses", "Subject", "Content", "MessageDate") FROM stdin;
\.


--
-- Data for Name: OperationClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OperationClaims" ("ID", "Name") FROM stdin;
1	admin
\.


--
-- Data for Name: UserOperationClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserOperationClaims" ("Id", "UserId", "OperationClaimId") FROM stdin;
1	1	1
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" ("Id", "FirstName", "LastName", "Email", "PasswordHash", "PasswordSalt", "Status") FROM stdin;
1	Samet	DOGAN	samet@samet.com	\\x5161d4a8705056dcc5493b8210f460b8a0cd209531dd759188d2dcf8cece1980560f3582389ce56596aad07fa68b6a70494a771a2f02631f4723fba6de5212ec	\\x74819178a9df229697a709de6b21edc2a5025bb2e2cdcccc2748eb220dedd5501b28ff01a5d9d8d33f47493fe828e074ec9dfb9e0d632ecdd9b3934f0afcd0be101df85a31523f3aefbcff76304c3290a10ffa4ba2f1be1c1cbea8e85878fc6e5955dc3a31dd65f25f165ae68ae7a46f8e83763507064f0eb83d0bcdce3e84d9	t
\.


--
-- Name: EmailMessages_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EmailMessages_ID_seq"', 34, true);


--
-- Name: operationclaims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operationclaims_id_seq', 1, true);


--
-- Name: useroperationclaims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.useroperationclaims_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: EmailMessages EmailMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EmailMessages"
    ADD CONSTRAINT "EmailMessages_pkey" PRIMARY KEY ("ID");


--
-- Name: OperationClaims operationclaims_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OperationClaims"
    ADD CONSTRAINT operationclaims_pkey PRIMARY KEY ("ID");


--
-- Name: UserOperationClaims useroperationclaims_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserOperationClaims"
    ADD CONSTRAINT useroperationclaims_pkey PRIMARY KEY ("Id");


--
-- Name: Users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT users_pkey PRIMARY KEY ("Id");


--
-- Name: UserOperationClaims UserOperationClaimsToOperationClaimFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserOperationClaims"
    ADD CONSTRAINT "UserOperationClaimsToOperationClaimFK" FOREIGN KEY ("OperationClaimId") REFERENCES public."OperationClaims"("ID") NOT VALID;


--
-- Name: UserOperationClaims UserOperationClaimsToUserFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserOperationClaims"
    ADD CONSTRAINT "UserOperationClaimsToUserFK" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") NOT VALID;


--
-- PostgreSQL database dump complete
--

