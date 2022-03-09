--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: rolebasedapp_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolebasedapp_device (
    deviceid integer NOT NULL,
    devicename character varying(30) NOT NULL
);


ALTER TABLE public.rolebasedapp_device OWNER TO postgres;

--
-- Name: rolebasedapp_device_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolebasedapp_device_permission (
    id bigint NOT NULL,
    lastupdate timestamp with time zone NOT NULL,
    device_id integer NOT NULL,
    permission_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.rolebasedapp_device_permission OWNER TO postgres;

--
-- Name: rolebasedapp_device_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rolebasedapp_device_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rolebasedapp_device_permission_id_seq OWNER TO postgres;

--
-- Name: rolebasedapp_device_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rolebasedapp_device_permission_id_seq OWNED BY public.rolebasedapp_device_permission.id;


--
-- Name: rolebasedapp_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolebasedapp_permission (
    permissionid integer NOT NULL,
    permissionname character varying(30) NOT NULL
);


ALTER TABLE public.rolebasedapp_permission OWNER TO postgres;

--
-- Name: rolebasedapp_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolebasedapp_role (
    roleid integer NOT NULL,
    rolename character varying(30) NOT NULL
);


ALTER TABLE public.rolebasedapp_role OWNER TO postgres;

--
-- Name: rolebasedapp_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolebasedapp_user (
    userid integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.rolebasedapp_user OWNER TO postgres;

--
-- Name: rolebasedapp_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolebasedapp_user_role (
    id bigint NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    lastupdate timestamp with time zone NOT NULL
);


ALTER TABLE public.rolebasedapp_user_role OWNER TO postgres;

--
-- Name: rolebasedapp_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rolebasedapp_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rolebasedapp_user_role_id_seq OWNER TO postgres;

--
-- Name: rolebasedapp_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rolebasedapp_user_role_id_seq OWNED BY public.rolebasedapp_user_role.id;


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: rolebasedapp_device_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_device_permission ALTER COLUMN id SET DEFAULT nextval('public.rolebasedapp_device_permission_id_seq'::regclass);


--
-- Name: rolebasedapp_user_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_user_role ALTER COLUMN id SET DEFAULT nextval('public.rolebasedapp_user_role_id_seq'::regclass);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	rolebasedapp	0001_initial	2022-03-09 05:36:55.02229+00
2	rolebasedapp	0002_auto_20220308_1758	2022-03-09 05:36:55.051692+00
3	rolebasedapp	0003_user_role_lastupdate	2022-03-09 05:36:55.05623+00
4	rolebasedapp	0004_alter_user_role_lastupdate	2022-03-09 05:36:55.059476+00
5	rolebasedapp	0005_device_device_permission_permission	2022-03-09 05:36:55.103059+00
\.


--
-- Data for Name: rolebasedapp_device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolebasedapp_device (deviceid, devicename) FROM stdin;
1	Camera-A
2	Camera-B
3	Camera-C
4	Camera-D
5	Camera-E
\.


--
-- Data for Name: rolebasedapp_device_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolebasedapp_device_permission (id, lastupdate, device_id, permission_id, role_id) FROM stdin;
1	2022-03-09 05:37:54.639369+00	1	1	1
2	2022-03-09 05:37:54.645689+00	1	2	1
3	2022-03-09 05:37:54.646921+00	1	3	1
4	2022-03-09 05:37:54.648031+00	1	4	1
5	2022-03-09 05:37:54.649086+00	1	5	1
6	2022-03-09 05:37:54.650204+00	1	6	1
7	2022-03-09 05:37:54.651777+00	1	7	1
8	2022-03-09 05:37:54.652852+00	2	5	1
9	2022-03-09 05:37:54.653877+00	2	6	1
10	2022-03-09 05:37:54.65491+00	2	7	1
11	2022-03-09 05:37:54.655931+00	3	2	1
12	2022-03-09 05:37:54.65697+00	3	3	1
13	2022-03-09 05:37:54.658312+00	3	5	1
14	2022-03-09 05:37:54.659662+00	3	6	1
15	2022-03-09 05:37:54.660987+00	3	7	1
16	2022-03-09 05:37:54.662316+00	1	2	2
17	2022-03-09 05:37:54.663651+00	1	7	2
\.


--
-- Data for Name: rolebasedapp_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolebasedapp_permission (permissionid, permissionname) FROM stdin;
1	add-setting
2	read-setting
3	update-setting
4	delete-setting
5	read-log
6	delete-log
7	view-camera
\.


--
-- Data for Name: rolebasedapp_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolebasedapp_role (roleid, rolename) FROM stdin;
1	IT-Admin
2	Facility-Team-A
\.


--
-- Data for Name: rolebasedapp_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolebasedapp_user (userid, username) FROM stdin;
1	Vijay
2	Kumar
3	Joseph
4	Margaret
5	Carol
\.


--
-- Data for Name: rolebasedapp_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolebasedapp_user_role (id, role_id, user_id, lastupdate) FROM stdin;
1	1	1	2022-03-09 05:37:54.589623+00
2	2	2	2022-03-09 05:37:54.594157+00
3	2	3	2022-03-09 05:37:54.595247+00
4	2	4	2022-03-09 05:37:54.596307+00
5	2	5	2022-03-09 05:37:54.597331+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 5, true);


--
-- Name: rolebasedapp_device_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rolebasedapp_device_permission_id_seq', 17, true);


--
-- Name: rolebasedapp_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rolebasedapp_user_role_id_seq', 5, true);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: rolebasedapp_device_permission rolebasedapp_device_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_device_permission
    ADD CONSTRAINT rolebasedapp_device_permission_pkey PRIMARY KEY (id);


--
-- Name: rolebasedapp_device rolebasedapp_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_device
    ADD CONSTRAINT rolebasedapp_device_pkey PRIMARY KEY (deviceid);


--
-- Name: rolebasedapp_permission rolebasedapp_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_permission
    ADD CONSTRAINT rolebasedapp_permission_pkey PRIMARY KEY (permissionid);


--
-- Name: rolebasedapp_role rolebasedapp_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_role
    ADD CONSTRAINT rolebasedapp_role_pkey PRIMARY KEY (roleid);


--
-- Name: rolebasedapp_user rolebasedapp_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_user
    ADD CONSTRAINT rolebasedapp_user_pkey PRIMARY KEY (userid);


--
-- Name: rolebasedapp_user_role rolebasedapp_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_user_role
    ADD CONSTRAINT rolebasedapp_user_role_pkey PRIMARY KEY (id);


--
-- Name: rolebasedapp_device_permission_device_id_64abfab7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rolebasedapp_device_permission_device_id_64abfab7 ON public.rolebasedapp_device_permission USING btree (device_id);


--
-- Name: rolebasedapp_device_permission_permission_id_2a2e5d01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rolebasedapp_device_permission_permission_id_2a2e5d01 ON public.rolebasedapp_device_permission USING btree (permission_id);


--
-- Name: rolebasedapp_device_permission_role_id_d7568f91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rolebasedapp_device_permission_role_id_d7568f91 ON public.rolebasedapp_device_permission USING btree (role_id);


--
-- Name: rolebasedapp_user_role_roleid_id_78aa7ae1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rolebasedapp_user_role_roleid_id_78aa7ae1 ON public.rolebasedapp_user_role USING btree (role_id);


--
-- Name: rolebasedapp_user_role_userid_id_e0a097dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rolebasedapp_user_role_userid_id_e0a097dd ON public.rolebasedapp_user_role USING btree (user_id);


--
-- Name: rolebasedapp_device_permission rolebasedapp_device__device_id_64abfab7_fk_rolebased; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_device_permission
    ADD CONSTRAINT rolebasedapp_device__device_id_64abfab7_fk_rolebased FOREIGN KEY (device_id) REFERENCES public.rolebasedapp_device(deviceid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rolebasedapp_device_permission rolebasedapp_device__permission_id_2a2e5d01_fk_rolebased; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_device_permission
    ADD CONSTRAINT rolebasedapp_device__permission_id_2a2e5d01_fk_rolebased FOREIGN KEY (permission_id) REFERENCES public.rolebasedapp_permission(permissionid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rolebasedapp_device_permission rolebasedapp_device__role_id_d7568f91_fk_rolebased; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_device_permission
    ADD CONSTRAINT rolebasedapp_device__role_id_d7568f91_fk_rolebased FOREIGN KEY (role_id) REFERENCES public.rolebasedapp_role(roleid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rolebasedapp_user_role rolebasedapp_user_ro_role_id_a4176486_fk_rolebased; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_user_role
    ADD CONSTRAINT rolebasedapp_user_ro_role_id_a4176486_fk_rolebased FOREIGN KEY (role_id) REFERENCES public.rolebasedapp_role(roleid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rolebasedapp_user_role rolebasedapp_user_ro_user_id_e9a62551_fk_rolebased; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolebasedapp_user_role
    ADD CONSTRAINT rolebasedapp_user_ro_user_id_e9a62551_fk_rolebased FOREIGN KEY (user_id) REFERENCES public.rolebasedapp_user(userid) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

