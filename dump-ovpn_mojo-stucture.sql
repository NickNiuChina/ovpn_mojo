--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-12-25 09:21:33

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 17756)
-- Name: ovpn_clients_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ovpn_clients_config (
    id uuid NOT NULL,
    ovpn_client uuid NOT NULL,
    http_port character varying(100) NOT NULL,
    https_port character varying(100) NOT NULL,
    http_proxy_template character varying(1024) NOT NULL,
    ssh_proxy_port integer NOT NULL,
    create_time timestamp with time zone DEFAULT now() NOT NULL,
    update_time timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ovpn_clients_config OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17763)
-- Name: ovpn_clients_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ovpn_clients_list (
    id uuid NOT NULL,
    server uuid NOT NULL,
    site_name character varying(100) NOT NULL,
    cn character varying(100) NOT NULL,
    ip character varying(100) NOT NULL,
    toggle_time timestamp with time zone DEFAULT now() NOT NULL,
    expire_date timestamp with time zone DEFAULT now() NOT NULL,
    create_time timestamp with time zone DEFAULT now() NOT NULL,
    update_time timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ovpn_clients_list OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17770)
-- Name: ovpn_common_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ovpn_common_config (
    id uuid NOT NULL,
    plain_req_file_dir character varying(200) NOT NULL,
    encrypt_req_file_dir character varying(200) NOT NULL,
    plain_cert_file_dir character varying(200) NOT NULL,
    encrypt_cert_file_dir character varying(200) NOT NULL,
    zip_cert_dir character varying(200) NOT NULL
);


ALTER TABLE public.ovpn_common_config OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17775)
-- Name: ovpn_servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ovpn_servers (
    id uuid NOT NULL,
    server_name character varying(50) NOT NULL,
    configuration_dir character varying(200) NOT NULL,
    configuration_file character varying(200) NOT NULL,
    status_file character varying(200) NOT NULL,
    log_file_dir character varying(200) NOT NULL,
    log_file character varying(200) NOT NULL,
    startup_type integer NOT NULL,
    startup_service character varying(200) NOT NULL,
    certs_dir character varying(200) NOT NULL,
    learn_address_script integer NOT NULL,
    managed integer NOT NULL,
    management_port integer NOT NULL,
    management_password character varying(100) NOT NULL,
    comment character varying(1024) NOT NULL,
    creation_time timestamp with time zone DEFAULT now() NOT NULL,
    update_time timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ovpn_servers OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17782)
-- Name: system_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_config (
    item character varying(50) NOT NULL,
    ivalue character varying(200),
    category character varying(50) NOT NULL
);


ALTER TABLE public.system_config OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17785)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id uuid NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(200) NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(100) NOT NULL,
    group_id uuid NOT NULL,
    line_size integer NOT NULL,
    page_size integer NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

----
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-12-25 11:14:29

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 17788)
-- Name: om_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.om_group (
    id uuid NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.om_group OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17782)
-- Name: om_system_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.om_system_config (
    item character varying(50) NOT NULL,
    ivalue character varying(200),
    category character varying(50) NOT NULL
);


ALTER TABLE public.om_system_config OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17785)
-- Name: om_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.om_users (
    id uuid NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(200) NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(100) NOT NULL,
    group_id uuid NOT NULL,
    line_size integer NOT NULL,
    page_size integer NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.om_users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17756)
-- Name: ovpn_clients_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ovpn_clients_config (
    id uuid NOT NULL,
    ovpn_client uuid NOT NULL,
    http_port character varying(100) NOT NULL,
    https_port character varying(100) NOT NULL,
    http_proxy_template character varying(1024) NOT NULL,
    ssh_proxy_port integer NOT NULL,
    create_time timestamp with time zone DEFAULT now() NOT NULL,
    update_time timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ovpn_clients_config OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17763)
-- Name: ovpn_clients_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ovpn_clients_list (
    id uuid NOT NULL,
    server uuid NOT NULL,
    site_name character varying(100) NOT NULL,
    cn character varying(100) NOT NULL,
    ip character varying(100) NOT NULL,
    toggle_time timestamp with time zone DEFAULT now() NOT NULL,
    expire_date timestamp with time zone DEFAULT now() NOT NULL,
    create_time timestamp with time zone DEFAULT now() NOT NULL,
    update_time timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ovpn_clients_list OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17770)
-- Name: ovpn_common_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ovpn_common_config (
    id uuid NOT NULL,
    plain_req_file_dir character varying(200) NOT NULL,
    encrypt_req_file_dir character varying(200) NOT NULL,
    plain_cert_file_dir character varying(200) NOT NULL,
    encrypt_cert_file_dir character varying(200) NOT NULL,
    zip_cert_dir character varying(200) NOT NULL
);


ALTER TABLE public.ovpn_common_config OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17775)
-- Name: ovpn_servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ovpn_servers (
    id uuid NOT NULL,
    server_name character varying(50) NOT NULL,
    configuration_dir character varying(200) NOT NULL,
    configuration_file character varying(200) NOT NULL,
    status_file character varying(200) NOT NULL,
    log_file_dir character varying(200) NOT NULL,
    log_file character varying(200) NOT NULL,
    startup_type integer NOT NULL,
    startup_service character varying(200) NOT NULL,
    certs_dir character varying(200) NOT NULL,
    learn_address_script integer NOT NULL,
    managed integer NOT NULL,
    management_port integer NOT NULL,
    management_password character varying(100) NOT NULL,
    comment character varying(1024) NOT NULL,
    creation_time timestamp with time zone DEFAULT now() NOT NULL,
    update_time timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ovpn_servers OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 17788)
-- Dependencies: 220
-- Data for Name: om_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.om_group (id, name) FROM stdin;
\.


--
-- TOC entry 3373 (class 0 OID 17782)
-- Dependencies: 218
-- Data for Name: om_system_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.om_system_config (item, ivalue, category) FROM stdin;
\.


--
-- TOC entry 3374 (class 0 OID 17785)
-- Dependencies: 219
-- Data for Name: om_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.om_users (id, username, password, name, email, group_id, line_size, page_size, status) FROM stdin;
\.


--
-- TOC entry 3369 (class 0 OID 17756)
-- Dependencies: 214
-- Data for Name: ovpn_clients_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ovpn_clients_config (id, ovpn_client, http_port, https_port, http_proxy_template, ssh_proxy_port, create_time, update_time) FROM stdin;
\.


--
-- TOC entry 3370 (class 0 OID 17763)
-- Dependencies: 215
-- Data for Name: ovpn_clients_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ovpn_clients_list (id, server, site_name, cn, ip, toggle_time, expire_date, create_time, update_time) FROM stdin;
\.


--
-- TOC entry 3371 (class 0 OID 17770)
-- Dependencies: 216
-- Data for Name: ovpn_common_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ovpn_common_config (id, plain_req_file_dir, encrypt_req_file_dir, plain_cert_file_dir, encrypt_cert_file_dir, zip_cert_dir) FROM stdin;
\.


--
-- TOC entry 3372 (class 0 OID 17775)
-- Dependencies: 217
-- Data for Name: ovpn_servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ovpn_servers (id, server_name, configuration_dir, configuration_file, status_file, log_file_dir, log_file, startup_type, startup_service, certs_dir, learn_address_script, managed, management_port, management_password, comment, creation_time, update_time) FROM stdin;
\.


--
-- TOC entry 3205 (class 2606 OID 17792)
-- Name: ovpn_clients_config ovpn_clients_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_config
    ADD CONSTRAINT ovpn_clients_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 17794)
-- Name: ovpn_clients_list ovpn_clients_list_cn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_list
    ADD CONSTRAINT ovpn_clients_list_cn_key UNIQUE (cn);


--
-- TOC entry 3209 (class 2606 OID 17796)
-- Name: ovpn_clients_list ovpn_clients_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_list
    ADD CONSTRAINT ovpn_clients_list_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 17798)
-- Name: ovpn_common_config ovpn_common_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_common_config
    ADD CONSTRAINT ovpn_common_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 17800)
-- Name: ovpn_servers ovpn_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_servers
    ADD CONSTRAINT ovpn_servers_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 17802)
-- Name: ovpn_servers ovpn_servers_server_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_servers
    ADD CONSTRAINT ovpn_servers_server_name_key UNIQUE (server_name);


--
-- TOC entry 3217 (class 2606 OID 17804)
-- Name: om_system_config system_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.om_system_config
    ADD CONSTRAINT system_config_pkey PRIMARY KEY (item);


--
-- TOC entry 3221 (class 2606 OID 17806)
-- Name: om_group user_group_group_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.om_group
    ADD CONSTRAINT user_group_group_key UNIQUE (name);


--
-- TOC entry 3223 (class 2606 OID 17808)
-- Name: om_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.om_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 17810)
-- Name: om_users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.om_users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 17811)
-- Name: ovpn_clients_config ovpn_clients_config_ovpn_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_config
    ADD CONSTRAINT ovpn_clients_config_ovpn_client_fkey FOREIGN KEY (ovpn_client) REFERENCES public.ovpn_servers(id);


--
-- TOC entry 3225 (class 2606 OID 17816)
-- Name: ovpn_clients_list ovpn_clients_list_server_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_list
    ADD CONSTRAINT ovpn_clients_list_server_fkey FOREIGN KEY (server) REFERENCES public.ovpn_servers(id);


--
-- TOC entry 3226 (class 2606 OID 17821)
-- Name: om_users user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.om_users
    ADD CONSTRAINT user_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.om_group(id);


-- Completed on 2024-12-25 11:14:30

--
-- PostgreSQL database dump complete
--


-- TOC entry 220 (class 1259 OID 17788)
-- Name: user_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group (
    id uuid NOT NULL,
    group_name character varying(50) NOT NULL
);


ALTER TABLE public.user_group OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 17756)
-- Dependencies: 214
-- Data for Name: ovpn_clients_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ovpn_clients_config (id, ovpn_client, http_port, https_port, http_proxy_template, ssh_proxy_port, create_time, update_time) FROM stdin;
\.


--
-- TOC entry 3370 (class 0 OID 17763)
-- Dependencies: 215
-- Data for Name: ovpn_clients_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ovpn_clients_list (id, server, site_name, cn, ip, toggle_time, expire_date, create_time, update_time) FROM stdin;
\.


--
-- TOC entry 3371 (class 0 OID 17770)
-- Dependencies: 216
-- Data for Name: ovpn_common_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ovpn_common_config (id, plain_req_file_dir, encrypt_req_file_dir, plain_cert_file_dir, encrypt_cert_file_dir, zip_cert_dir) FROM stdin;
\.


--
-- TOC entry 3372 (class 0 OID 17775)
-- Dependencies: 217
-- Data for Name: ovpn_servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ovpn_servers (id, server_name, configuration_dir, configuration_file, status_file, log_file_dir, log_file, startup_type, startup_service, certs_dir, learn_address_script, managed, management_port, management_password, comment, creation_time, update_time) FROM stdin;
\.


--
-- TOC entry 3373 (class 0 OID 17782)
-- Dependencies: 218
-- Data for Name: system_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_config (item, ivalue, category) FROM stdin;
\.


--
-- TOC entry 3374 (class 0 OID 17785)
-- Dependencies: 219
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, password, name, email, group_id, line_size, page_size, status) FROM stdin;
\.


--
-- TOC entry 3375 (class 0 OID 17788)
-- Dependencies: 220
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group (id, group_name) FROM stdin;
\.


--
-- TOC entry 3205 (class 2606 OID 17792)
-- Name: ovpn_clients_config ovpn_clients_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_config
    ADD CONSTRAINT ovpn_clients_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 17794)
-- Name: ovpn_clients_list ovpn_clients_list_cn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_list
    ADD CONSTRAINT ovpn_clients_list_cn_key UNIQUE (cn);


--
-- TOC entry 3209 (class 2606 OID 17796)
-- Name: ovpn_clients_list ovpn_clients_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_list
    ADD CONSTRAINT ovpn_clients_list_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 17798)
-- Name: ovpn_common_config ovpn_common_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_common_config
    ADD CONSTRAINT ovpn_common_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 17800)
-- Name: ovpn_servers ovpn_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_servers
    ADD CONSTRAINT ovpn_servers_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 17802)
-- Name: ovpn_servers ovpn_servers_server_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_servers
    ADD CONSTRAINT ovpn_servers_server_name_key UNIQUE (server_name);


--
-- TOC entry 3217 (class 2606 OID 17804)
-- Name: system_config system_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_config
    ADD CONSTRAINT system_config_pkey PRIMARY KEY (item);


--
-- TOC entry 3221 (class 2606 OID 17806)
-- Name: user_group user_group_group_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_group_key UNIQUE (group_name);


--
-- TOC entry 3223 (class 2606 OID 17808)
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 17810)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 17811)
-- Name: ovpn_clients_config ovpn_clients_config_ovpn_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_config
    ADD CONSTRAINT ovpn_clients_config_ovpn_client_fkey FOREIGN KEY (ovpn_client) REFERENCES public.ovpn_servers(id);


--
-- TOC entry 3225 (class 2606 OID 17816)
-- Name: ovpn_clients_list ovpn_clients_list_server_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ovpn_clients_list
    ADD CONSTRAINT ovpn_clients_list_server_fkey FOREIGN KEY (server) REFERENCES public.ovpn_servers(id);


--
-- TOC entry 3226 (class 2606 OID 17821)
-- Name: user user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.user_group(id);


-- Completed on 2024-12-25 09:21:34

--
-- PostgreSQL database dump complete
--

