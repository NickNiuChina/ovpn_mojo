--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-12-25 13:18:51

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
25ae1ce0-91a9-4723-a31f-7c4506db4022	ADMIN
1f47f9ff-de59-4ca9-80b9-7d1d7d92e590	SUPER
7add9b1a-ef69-4c2d-add6-c5ff94e8943d	USER
fb413ecc-b27b-4629-9ccf-c4f9fc6b9e48	GUEST
\.


--
-- TOC entry 3373 (class 0 OID 17782)
-- Dependencies: 218
-- Data for Name: om_system_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.om_system_config (item, ivalue, category) FROM stdin;
CUSTOMER_SITE	Local Test	dedicated
DIR_APACHE_ROOT	/etc/apache2	dedicated
DIR_APACHE_SUB	site-enabled	dedicated
DIR_EASYRSA		dedicated
DIR_GENERIC_CLIENT	generic	dedicated
DIR_REQ	reqs	dedicated
DIR_REQ_DONE	reqs-done	dedicated
DIR_VALIDATED	validated	dedicated
DIR_VPN_SCRIPT	vpn_tool_script	dedicated
IP_PORT		dedicated
IP_REMOTE		dedicated
PROXY_PREFIX		dedicated
\.


--
-- TOC entry 3374 (class 0 OID 17785)
-- Dependencies: 219
-- Data for Name: om_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.om_users (id, username, password, name, email, group_id, line_size, page_size, status) FROM stdin;
0ccdbd02-490c-46bf-beb2-f5f82b111d77	user2	scrypt:32768:8:1$ZlJGZSlUU2uHK1Hz$eecef6dd6ad4f6a38ca53760cfa3de72d100ee00f18117c9651317d07e039e497b1647590f0fdba856e69133562b151c56cdfebec315073aeb395092f58ee303	user2	user2@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d10d4723-6811-4c96-af46-723920e53d76	super	scrypt:32768:8:1$w9bF49DTkWff845U$db6e502a902ea537404d968479261a8ab1bc3399f5a1ed359fe88af53a59312f56939e75606384ec0850c94dbbcbd62efbd527aa380e5d8584f16b36a3acbacc	super	super@example.com	1f47f9ff-de59-4ca9-80b9-7d1d7d92e590	300	50	1
2f557e51-df48-4b76-87b0-06bb5ce3d9c4	user3	scrypt:32768:8:1$N5ZzMm1kuqgV9lCg$c071282f953ca3fdc8738c1e4f80ffd69657bdb7afb23175cfca5b0b6a81e796bd7712ec88f0fae160341582c0e51c88a3fec933649d4f1ed7dd3ff4ad414d36	user3	user3@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f7407445-2b50-4ca3-891c-af2ad06e46db	user4	scrypt:32768:8:1$S5gZ3bfqUsayomXF$e20b7c31c149bc6a6c195208c1dbd3c0633e8aa7bd3816ae0a9fce163a52760cda2c4699d1a35be0f165edf9e78833d2ec38e6f7a6d90f2dad6cccb53b9d6576	user4	user4@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
b697cfc5-e94f-48b9-aa71-106e3e749435	user5	scrypt:32768:8:1$aLR2txQTxCzrqeSi$e04497967c1c255b7a437d98ca15f85e890339edcb8cf5b09226991d185603453d9c6ad0ce2b69e3b5b48b86e4bc77e1e7353982fb62b3e5312ad66ab74b33ec	user5	user5@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6c1751f9-2143-4d08-aab6-a3e30c539ae9	user6	scrypt:32768:8:1$DMOCs6dQhdRDBdVm$526502bf043dfaa77e0298995c9443a97b313a960903589b394fc75302c07bcd8964cd1a414a18dba7831751dbabd17a2bfb50864b1a0d43e23f827657381e44	user6	user6@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
2b00525a-21df-4254-a76c-ef62d6a6faff	user7	scrypt:32768:8:1$5lXX4no9XOmOu9m3$a8c37fa69c942964452397ae04ac543c92f80295545a97939e10b853963c1c04f92b05d2330159573822e1f24c48d2ddae4976054cd1da3b6b56717c33f57e96	user7	user7@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
4c1bc924-1782-4993-8f7a-2ade49f503ec	user8	scrypt:32768:8:1$NhGrauARkY3teL8s$3e9a3950f904fb00ebe4662ebb742dfdcf5de9e5bf303bfba7ed5c940c36b521847761210e05ccbe1e3b8016b766528d77b3482620b61987eed3f5bec59b4b86	user8	user8@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0605ee46-2b22-4a5f-830b-9115e71065ba	user9	scrypt:32768:8:1$mzaVekyIOR9JwIDK$2a3dd5d85c676d6587ea1f65a786bcd523bab9f0b857157fbeb176fb136fc2c8a333e10f0390998c8f03c6c3d8ff33e52c8dc14e33c0c8f8c468ea840c45446e	user9	user9@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
55e0ce7e-5699-42ad-a657-210eb2766eed	user10	scrypt:32768:8:1$23vYlQI9AaJAxQgm$56eca57b29ff796fad11b863e8c6546829f2108808eec74fe09cfda83a8483c00c015138071f4dd9fcb8992b8847cffb9faf9c3c0f9be5030f896b4389060758	user10	user10@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
8b0313ef-f120-427f-a411-288a3a9445d2	user11	scrypt:32768:8:1$zECrtz1av5lJdjPj$bb40b6fdbcdd30b532b21fa407c4b0cae7639c641e508600915862c2389a1ab142e485c942b82aa7955d060d64c696dfa6628c7509ca78dfb2fd001f0f4e12b8	user11	user11@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
700f9c60-74be-4352-a15d-500341f42dea	user12	scrypt:32768:8:1$Qq5kuOOKSZTlj3HP$212ebe2dc3c0eeda92c6d316d2fbb02d0e77d4d85bdcc9badea4df7c0113725a6827fcfb718fca79adc608caca52804e03607ffefa3388bce3310111efde98b3	user12	user12@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
be80c109-2c63-4bb7-8e82-46dac3bc3fb5	user13	scrypt:32768:8:1$qepW9ZXltk0vVclw$c91500734bc86cdb59363192d28b8cd2d8246e32457336b1740526583d27a46f795270caea3df35e75fb206433973d8fa396469677cf5bff0a55273e9ea53027	user13	user13@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f58fcd25-a7c9-4184-8efa-04f23c4a7957	user14	scrypt:32768:8:1$xvZXNHWHcCaw3qgc$5edb0c46db44ddb7428324f96916f4d316fe6cf4eb5d1463539433ed436c463d7b53e20a79b7fa5bd247d2fb1139d1f6276c7041eed754ba47dac28c6843ff5f	user14	user14@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d68f5892-adb5-4cf2-89ba-5bf6ed4b79f8	user15	scrypt:32768:8:1$noM2gLiX0oXSNOhN$f876e6a1f789327c491db35336b4b29cf45502bf7166cb9fb80069a40be94e5ea74ce5fb457666c0a97d367c09d082304d9df07fe606666c901182327af9c4cb	user15	user15@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1e1efbc7-57ec-4088-b4de-e07745142972	user16	scrypt:32768:8:1$NA83uXxuNizfgVOL$2ccaa815196a4b715ff0cc233d2ef8dec4b7354586a36611e05c0e96c45eff3213b67f4d9911a613c2e594b06b6b67f8a4c8db53e9c04f786e6204bf5bd58a74	user16	user16@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
9ecd8740-1912-424d-a01d-07b01f2eb840	user17	scrypt:32768:8:1$L8HIrExSbaSGgS6K$d172965039c7b348b773321c41d229e54549d853dc44d440fdabbd7c3e9a5bfbd49a5ef3c0fa2fcbe797646229a81d7544ad64bed57690cbe576ba062ae6ad00	user17	user17@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
4f3bf196-9fc0-4604-8b0f-fc3731e31a5f	user18	scrypt:32768:8:1$r56W42PVp5xOlLZv$1c91b0cd452dedd60eeabbc2c3aed9b62f8f1c682751e45bdc5553b7e4bd8b44fdf102acfc7b2ea98ae5f0a8781630c0a59291050b8fc1d6ec62a8e818f1d772	user18	user18@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ca46078c-80ae-4281-8fc5-f76a21e3e342	user19	scrypt:32768:8:1$zIcnKjYzEBQdJPHc$3256e77aacca5c5d62c9658eba1643f70cf05fb9b81b4723e641cbe7d393661edb6d0407a1a7f1d971fef37a21b777cd6bec648325d7024341db6a1da4091d3d	user19	user19@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ca6ceef3-ef7e-4d9c-bde6-9ec20492adb7	user20	scrypt:32768:8:1$PDoBb56dBAoMA6xQ$3f3dd3c2c64021031271302ebaf586f0252055c8d42b157a982e4fb73fbaaf2e87b7b3c8bdb294ff3d716bdf5c2b350b483026d2aa53f13412358d550dacd4e4	user20	user20@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
15e697e5-5e8e-41d1-b28d-d5c2d9c440df	user21	scrypt:32768:8:1$eFTpEjFp0L76mRHA$50229af162b85f9311ebe115506d9a5a9cf80f2ea40f71555459a8ccf6e1286483593f02c6f0a58685b277e6f6f041c84adfccb07d785c25d18c657ec70110a4	user21	user21@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6d49d636-46c5-457d-90e0-3e2efc5478f0	user22	scrypt:32768:8:1$tXvMAHQp7jr8geaO$ee73f44d6c727d2361094b169eab221a6ed57d6a9a9d1404caf4d7b189ffd78164689e1eb68fcd9506a2d8718cc6bbf831f87d81afe9776167e67b2192964356	user22	user22@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ad31eb18-e399-4433-8708-971547da53b0	user23	scrypt:32768:8:1$i1HcgXRSr42rwXwt$195d54a3e14bf7affbb7aea84a05ea1c120dd832ec86340263debceffa2a10cb995e60fbe25b8cadec5239eb45694a4793edd854f8760579dec77ead3de5db94	user23	user23@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
97398c0a-4e2f-48d1-818b-4400419c50fd	user24	scrypt:32768:8:1$wuJbSLGHLlwNEQ3C$3cf6a1939622e25c80dedba7711b411e1bad2b957d2b7a75a8e754106ccb681c4a7c93b59cbfcafbddf8fdcb6426bbc7ca76f46cdf3caa7cbea459ed79886a1f	user24	user24@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
50602695-4e66-48e8-8841-4d928b893648	user25	scrypt:32768:8:1$5aHWU2x7aYgSu6Iy$dcfce13797060efe555bbda5f7dc62db8e95a6fff6637b09317fa00763dcb459e81bb2470a9bcd43518f5addf04c7b899e6e70afef66076457f91aa45366588a	user25	user25@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6fe6a84c-6118-4b14-b0db-6b2e72ea12a1	user0	scrypt:32768:8:1$9DTt27PRTwvrTqbl$dc7e12ba8d45f934b54e968cecf385a73afbed5c1087831a150240c8a5483d761b3d75977bb6fe2fef888edd35fb95e5b397e7283ee07ea58b26ba64e7e3cff2	user0	user0@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	100	1
9e1c298a-d0df-4404-9929-9be064682f73	user1	scrypt:32768:8:1$oKM66K0qS7Iv8JsO$cc6f70157e3bbd85bd7a0e61af85ac3a6b22320a49d6c4f1de31a1211d6a4758d962be31c92c2c96defe4b4b382aebe7c285e547b4268cab693e1c907fce68a6	user1	user1@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
388a351e-3aac-4454-a225-3f9938638965	user26	scrypt:32768:8:1$PdZYvsFdADNwBoT4$dfbc35c8989e626d98307c51a147ba099ac6ae3fa1c789eecf17010480f3a28d36a9a058a78f3f4bd20459ab3a3cd6caca295e6fb08d9726cedbcb238ba31fb3	user26	user26@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
473560c2-b816-40cb-abc8-7cc472dc1030	user27	scrypt:32768:8:1$GwnhcJRyUWYSuiLW$c9467fd59eeb5d1591a17dbe3b01a11d4b9b2b0e7458fb92e2fb019377f5cc2d412c5a13124a15488956523ce6ed7c0ff0a787d6a06bd16a5085ee603d71ab47	user27	user27@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
80f7c5c8-3685-4b90-8b83-6676d1fa623d	user28	scrypt:32768:8:1$oZdHw0pP21p5fUNM$7a2f8255af9955309d8f54d5c0239b33d17a221a3e67720bb48bf21a12402af26f5b19efb34acf03bc58413b3715d23cf77a4e674f63fd61c738a000adeb3176	user28	user28@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
5fcd7507-8a03-4914-a9a4-ce3444b81696	user29	scrypt:32768:8:1$AQZ9ecbBcekjpXlW$1365b632c658ba1ccab11d451c2f3b1377d370bc817e99e4cbd11d1fe2e078588691577a605d4ec732d65c9441998ed0ff7ba75e5391a1f117a0a0a02ef047bc	user29	user29@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0b53f5b7-0676-4212-9f0d-7484e8000eeb	user30	scrypt:32768:8:1$PlM1XA6ck5nyGWgW$1c7f31a664c641f2b011f0712dcf2e9b1db7cd80aede042dfa2258f2629026a921574e029e4924f03c8106ae53942d836c349778e1e7a01e5a58bbbfe92b28b4	user30	user30@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0e458bc8-d3b7-428a-876e-ae3aef5ea8eb	user31	scrypt:32768:8:1$wb7Yw8j772MFZK9U$3b03b1001595097b8fa59e8d4248570edfb20f475fc591c4393ab1f61840f671ddbe6ff9c2ffb5179ed10c5ca47a64e05f697a680d1cf9d99caf49f6d719f185	user31	user31@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
05997363-c333-4519-ba78-62884ecfa086	user32	scrypt:32768:8:1$qMF9M7EvcZ80yXU9$2bf649530cfd973ff3e971c05219479ca94c0ee3d4ce8d9d1205873dc57b40f45121f682a7ad90925e0dda36a31f15e578e6232a147c8cabe9d34f04aa5bc20f	user32	user32@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
5d8357b6-0ce1-48c8-bec5-53762671e914	user33	scrypt:32768:8:1$A4HShENXMiXy8FE1$e17866450ad03f6e039567c5298eed0101f6f6abebc41602ed6750188d16ec2ade737dc789c1156a166b8b5ba597dc6363aa0d468dfa0d2499ab74f1b086eb8b	user33	user33@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
64a1d3cd-004b-4ac0-8e3b-bbe39e6b6724	user34	scrypt:32768:8:1$yuv5gunY2axWHAaE$fbdea19eff5871c729292684332e3b613db10ea1817a2db4447881eb77b9bfb27d74b7efa5f5c9fef38b7333127609c2075654cd84e09d65747ab81296ea44ac	user34	user34@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
eaa65bad-933d-4b3f-acc7-709340de0517	user35	scrypt:32768:8:1$hj8M1FFemKs15lhR$29a861118aa058f081b3b944a1749beb03d19b251ca3133836782af54f14ecc6df79d1adf4ad923c29bd7b10e552422e1e73f346a373515a7b6b83413dd003bd	user35	user35@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
72154548-c315-4759-941b-d6508d2299aa	user36	scrypt:32768:8:1$JkCoCNds7DPSiYDB$c1d34dbf1772c4a0c859c4584b58f41d61ba99136aaab1e2a9c708e6062a764b2bd7771770113edd52ed188b56a547bc8b174b6a0cc6e557056f8220ab659be8	user36	user36@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
abb051e3-d091-4366-b330-f58225015e95	user37	scrypt:32768:8:1$hg8o7Oxas3JT57D7$50114412fc99e7ab3281a55a1b623839b674db9bd111cf1e6dd4d642f20f59e8b1d5d72114e0c4c46fcc69dee7ae6a942879d22ea192562e4a2f320a3b80259f	user37	user37@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ddadf2a7-96d3-455d-81ff-bb78bb792460	user38	scrypt:32768:8:1$FAorXLBAfrhUCN0c$49aed03d6112211108026beef4265384e3d74f5f830bdbeeea3446cfd39d68ffae5a1eb1b4e7fe013b941e03c7d8f39b6b782f4453d7085802e4d11e381b2bd2	user38	user38@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
cb6d41ae-0e6d-42cd-963e-a41670022e7c	user39	scrypt:32768:8:1$DoZSNW1ivy4TuFxZ$0aca765870a605b16f18cb7f1c30d886469ab04b897581f2369f5a4c78a674123f44e3c85ace0a67f30d4ff2619cd605c36d28a2ecbd9d0348e0fec97a9a7aad	user39	user39@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
965f158d-2f98-41eb-84a6-c0512bae317e	user40	scrypt:32768:8:1$tJ4KK2RngdRNazkO$5947ed9c3d33ec499bdc13f68cb02682a754ecb73de0f4f66b54ecbddbb2ed5b28040b06d0827352970710bd5d376af6e0deb1e542309d02271262d510d80720	user40	user40@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
a6575ddc-4870-44f6-b774-da9f21f34c6b	user41	scrypt:32768:8:1$fsvdmE2WkPzLP24p$0bbd60db241b3c400c6f649936d04fac5599918350ecc805a3bcdcefc630c9d8ff2282da6d511fa6171fdab04c1214202d45f47bc8d9c4886bda542f939e92bc	user41	user41@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
e43f62b7-b161-4d91-9dbe-c3df5bd98d68	user42	scrypt:32768:8:1$H0SoC2BIn7ZYB4zh$da7f10dcd9513c3b0582be731d1c20f9af81ad275915fbc70a71f8c4a76b4d87e44f8c2df8d7bdd7abe9ec87c3998d2be2ea8cccc8785929638e6707dc09912a	user42	user42@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1e7c0987-e6fd-4191-89e8-56679f9ae391	user43	scrypt:32768:8:1$zjv7knI70r0wrIhB$3ccda8b403fc97ee26eacbec958198f60f6a86e8763ae4f7b3b43cb1fa0395416730a74e20fdc94da02185c42c156cc67d9899aaeb728edfb724c8efadece2db	user43	user43@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
9704c7ee-f15b-44c6-b30c-375c1017b43d	user44	scrypt:32768:8:1$DXOZolTnuUI2uweg$9cc11cfec688c6a7db0b07b25cb947199a5369a8e1272fd12e4a3d0ceafda9ec4345ade78c30897e8174dcec2be0d4bb5a5e75ff6c6c101e1027536be9f630aa	user44	user44@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d0723f01-8bbe-40b5-bdf8-fbaa8014cf4f	user45	scrypt:32768:8:1$6QPGR7KWdrXK2eCQ$91a24e8f941881ee83c90ed0cc0cb2a4d1e7cca718c84f2e719c0b020bd87f44ab109bdb96e678c2ba42de2c82ef74ef2f9aaf6c7f17d197ff65976d7696f6ca	user45	user45@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
9e51e39d-9422-474a-bfd5-052598cbd010	user46	scrypt:32768:8:1$1Tu1h4IVUN4yMo5j$cdca0bd43fcb0f8d2bd98e3b63735736175ebdd75b7339131e9ed221f1c6ea3a25e2972211fc765d7e2301df9d5264775e87ef369563c7d5cfcaf3c7c9f912bf	user46	user46@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
536a85b3-7a39-4dc2-a44b-b749a3d23648	user47	scrypt:32768:8:1$PjKgzTc6YfBvzYRu$a3f4f1fe12aa8f7f9faa226bb8858c294448cfa133058500f26525d69a125c3295e1692fc7a7d721e36b830109de9b889cd612ef317d0ac5e41c26b29f40fda6	user47	user47@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1d7cf59b-7a19-4d06-854b-75e8ed6f730a	user48	scrypt:32768:8:1$DgaOQe5shRswPcap$45a49d354dbcb9226f6b800bc8e06569f468ace7a0db478746c84fee04e266d666d5fda92bc9b6347b4a86074b6c9844f62a1aa944f63f2e21efca086788a703	user48	user48@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
cd7f8324-4631-4119-99e8-c17cec80cef1	user49	scrypt:32768:8:1$hsYPtkpO9Nfeiiz1$040f33e16ec51820bb9b413fec8c9866ff84af6d28615783f1a9c924a95142d3a631f9f1179d2a2ea693d889f9ba1471ca36ddbe6d0b178fc10ada63304fb2e3	user49	user49@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
83f22985-5789-4f8f-892e-e8f926d008ca	user50	scrypt:32768:8:1$S1DVFN8UBnB9yeHK$630bac124045dfac02ce4a27a06db379502d36c8153c4fa7953b3e053ac28448021c7769588c02def5bc06243a7751376fb3d85abf87cd53882e826b59c90778	user50	user50@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
9856f6eb-1074-47e9-85ef-5e4a7b423684	user51	scrypt:32768:8:1$1uwYfVWNZbpy1R6X$8f98e131bc74b652c2faa0c9c267b20b14e127e955865123eff366a33fd54d2f08770d483d0291d6f9a5bd8d9a560b793d30acf61a960b2aa1da24aa4d69d07e	user51	user51@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
82c52a74-e757-4fb5-be92-6d6f682ff10e	user52	scrypt:32768:8:1$sFcFsIhTkcWTFJje$92e54c6e8ec3ceaaccac2b8d23b45d9e105c32760d8992946724b782eea71f0b3137b065d570bbb61b1e047359af5a2fcedbdb4dfb0d2f7cce6e88e78828b522	user52	user52@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ff4581cf-9a77-4b65-9418-8c325b6b282c	user53	scrypt:32768:8:1$BWMwuQxvMfFoabpG$187706fc28e89bad890cfdf0ab3e8e2909c1872ba4132566ead34ddaf71c6c87b970e8bfcea4d57607d5e46c918597ef9cad6a4f8692e094ed1a0bd42608d9ce	user53	user53@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
807579ea-e7e0-4fb0-aac3-a30c2d4f61c2	user54	scrypt:32768:8:1$A7z3vDtuRovfKnEc$1595edfa37dae6e4eb1b4c9eb3bf800f2625d1e0ef8510c920974ad510875ab864cea8b9371128259665c0bfc3b65fbebaa2a30f42822f4687bc8edea3188aca	user54	user54@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
2c16d312-fc89-40ce-a555-130962023578	user55	scrypt:32768:8:1$bUJ9TkrvLKLZLqqQ$1f675f8437c7ec5a7890b77643872de4f2114013b639ba24831c1dcec2c63011b19c99a814ea0f362b4df8586ca2767d558a176c15162a81afdfcf4d95166927	user55	user55@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
a6c1f449-afd6-42f4-a47b-435a02c21a39	user56	scrypt:32768:8:1$ZfCUBuN2GEArvCz6$58f65b7a7a16ead9f95cde7197b2d93ec05b19d463ab3986468214ce2a519998378dc0079d9997271ef33c7f9134dca902dc940f9e71441c02041f83249ebf23	user56	user56@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
926cca4d-08b3-4406-983c-138f110fae78	user57	scrypt:32768:8:1$HE1kdJzSNrsRJE3q$c916e75ebcfc33ef9cc798171fedbf4c576cee54a6a27d7b02db7602b35fdbc0a63a4c7168edae5fefd21af2f4b46db8e114f2e6af6baf620ab8ab2629efdc61	user57	user57@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
53d077df-c589-4e18-bf00-45fbbdbbe320	user58	scrypt:32768:8:1$ctZcYelWJndrN2Tw$60710a21c068f82ce7b32d258fc48092350c2ecefd1b465029c24508a1b439494777ced5df97e8bac8d618955aaf33eb1551139d83ab5959e33244885af1bf43	user58	user58@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
84a3ba4d-53fc-40c6-960e-82df62425874	user59	scrypt:32768:8:1$kBm6knuOHg1ZXmiM$f472949b93d0cc7d81b208331a7de8535c04eb867092f4ac0b62a0451775dba476e679e05a6840ed3b40f5fce57e39d2fb961c686b337bf73c872d54c80159e0	user59	user59@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f29a338d-8575-437b-a20f-a7576436c8a1	user60	scrypt:32768:8:1$HrQhJLunLqJyq59B$f03dff588990aa5c3f43d8f30a18050a766d8bcbaead9e756a12aacd18ffe838ddb2d03894c1ec909ec25379010831e5f7db96a17402a87085fb354088030968	user60	user60@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
a64c14a3-269a-45e7-9c15-9f878792de38	user61	scrypt:32768:8:1$n0GqAGByDmrLA9pk$10db72c17811a99320f7d4a110dab8b440e1469f26d799b5939b23b4082b73c03586f262b65b652a835f70531a7cfc3a601a18078eec20ff5fbf604363466faa	user61	user61@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
01f75269-cd62-4c94-b38a-5edf650193d8	user62	scrypt:32768:8:1$OfqN84F5iBE97Oqr$20fe7d1f9a7149458ca65827b3b9ccc44589f9b1cd2813e8a17bb92d1c2ea77b39a6e0c8d72c871dc98612dc0d775f0171e3d786792f3933c43c09784f463937	user62	user62@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
3840653e-68db-49b1-8da6-4e5738b0fd23	user63	scrypt:32768:8:1$oQQhgfBCdGJruTmd$db6929683c08c09b7aec9294344722a030e3cdc099c9ec069c4f1e7e8eaac0f28d8b4fea1f5bf589a35f061b03d6dd1bb2894b0a0330b32f5289676ceecb18bb	user63	user63@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
150b42d6-c683-4a18-942f-3c09221487df	user64	scrypt:32768:8:1$STETinhGohqYXI2j$a9fa0ca8673aade18dfd6aa4527c5eb4dd52e8d5a004fa402c6aaac581f8c8052277e76b63b526f20f99c0affb768f843761ca215a801787662888ada8db8ea0	user64	user64@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1502046f-ad49-40c5-8987-3d668ec03e08	user65	scrypt:32768:8:1$Zbqo4TohTCdpGsjz$0a51ef5811f5658b304f431f7f1640026cc6cf31512a44987071e0a0e98166e6dd5f0363838868d3c83e42a189fbc471c5decaf5b74ccaa30cd19316d7f81893	user65	user65@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
a3921810-d91f-4582-8f8a-2cf64dad16ae	user66	scrypt:32768:8:1$gIC44sVcbNaFftz0$48f71ba6121bf32e3e76e047e0e45449f28b5edda403fa6c6d320263bdf65bc0f1f57b7da31132780dc8bae3bda48154dbd66cd3db65717d21a824e21fddc8d4	user66	user66@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
39d90338-a323-4e82-8270-59dba36b7fdb	user67	scrypt:32768:8:1$7ncgrvTnpSt34JSx$e3745a823e89d6768aa412ae565df5264160d0b55295a5ed32e576ec5c97c36298cdaf0087557dd2f553d17a41712d596a5c9b91b789efbeee698d1d3e3d3e42	user67	user67@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0b253a75-5517-4f8b-96d8-811a5229eba7	user68	scrypt:32768:8:1$wuKCBbUy0jX27Fo3$729486cd1702167f36bbebdd849ec06156850152d3f0841086126e56518968d01fe6221714155483bffab773f6ce1101e8ab332c1754efe33dc326cee3cff18a	user68	user68@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
5942d324-86e8-419d-89d9-6c30a701185a	user69	scrypt:32768:8:1$UEe1PA7GgGu0jSpI$55a29959fdbf9f382dd99e14d17497e6ecdc509862f3045f57d0096d5682b17fa54f7c722cb03d082b8ae51d973a2abecf0e5c202ef61168970336997388b1ed	user69	user69@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
e6ead382-7313-43d1-9d6d-f6df9d493f69	user70	scrypt:32768:8:1$s40az3F3KHYf6Ez5$945e791a395eda0639117c708f9c41209b5cbd421d50dae9cd3c1d332b0630f24c62d00c18361df549fbacc4bce0c65a0fe5c13e9fef6038f8914e9e6d85f57e	user70	user70@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
cc87f524-1944-4bc5-95a9-ba63d6c78488	user71	scrypt:32768:8:1$T7onAupEbUCN8XNK$81c5cda3dfe6594b8c4c313fcefa6500b1c6332d2937405221ff8c9f4fed4ff1c094399da0f463aa893a3c7a90e09bdff395ab62f7faded218ca0d7064ab8425	user71	user71@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d804d302-b7ea-4d14-81c3-1b43a8342e5f	user72	scrypt:32768:8:1$WLyOS04GB0ujhVqu$e729cfc82cfe94bc5decdd3b6fc09a2402efb90466fa45994e1de82e96b0266f174c35003d49899698bc76eb78d69e9f067b01bfe50a8debd591e4458211c07d	user72	user72@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
03f775e4-7acd-4516-9d0b-14cde7719372	user73	scrypt:32768:8:1$XLhsgvTTFXGIcVHZ$270b64bbef8407d1a5f873a5780ff2a661a13146ef759b32911cffa18cad799631d506946a4df69f94a5d01664f930173065c73581afc2a0099e6ba0c0fced1b	user73	user73@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
518c15c9-9e42-41e0-bebd-8e4d9f4b19ce	user74	scrypt:32768:8:1$mfN4qkENDoeS4wui$3731b4200411d48db35d626574d10c050282667665e5680c1484c8164f410a053f8342e7f892ae6aa7b25b940be755b9faef1da675a2f53fae1304ad80fe5998	user74	user74@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1f8f080a-4a8f-432f-9ddd-0bcc83952e2a	user75	scrypt:32768:8:1$pm6T2lodg5bqjj8O$d661f1d82c6d198429ecd29c421ba459ce24c4d636c2563bc3f2eb86efeb9afcd32d4c423e859b9df47f92786ad9fff604513590621067b89b1cc22dc490d5c2	user75	user75@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
034337d7-d0e1-4b57-98e9-a3a4f7f4bb50	user76	scrypt:32768:8:1$O6x3WbuSxQWwqMHo$641c200bad943ab8833f5672b4716b6c71ab4bcd9bfb3963d9f541e5a7e5d1c98b0550fed9fe1bea0703f29efdd5ea073007b079ffa73d2142ec66707388eda5	user76	user76@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
b1a38d5a-c110-4662-9dae-be85b46d9872	user77	scrypt:32768:8:1$VczcxrcGKjr2hMHo$8524e624d462756bcfd94b83079d2046e496120fc1584c4cad541a8735cb193410e6eb85054800e571dc9aba433550a2381d61edd4723c1252ec3cdb30fe8449	user77	user77@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
a8ecc2f4-6009-4eb3-87fa-a07b05913bd2	user78	scrypt:32768:8:1$lWZhPIgip491zWRO$e9f4668f7c2170b8ecd2ee4c6aef905cf485d6abe795cf66e418b9b440cff2f159fc3c43dfa8ddf4a4bc9cc8c2adb86d9809d712ce1e0262bba7dee95829eb98	user78	user78@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d1ba053a-20b0-4b97-8e24-3c88054191f8	user79	scrypt:32768:8:1$yhrlrYsFA9s4cSwh$d40d1f4a295e5b440a87dd6ced4b82254b6b0d3407d31c158b801003e9b9ff057be5fccf48f5c89cf805fb87b831cf12448f663067f09c973a4f6c538325e4a1	user79	user79@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
e9dcab9c-b048-45d4-9b0b-89d948357482	user80	scrypt:32768:8:1$498LFkZkX1LSrqmW$5ceb6e2f4990cc0db3df89021021b6f1a8e3003ab906259f180b22f0d8330927a17f9844a6f65822a3411d73dd7f3b79c4a0e1d5df3d0b08a3470cfc4c92d3b1	user80	user80@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
5a936e26-8e02-4325-bd7c-4eaa30c2cac2	user81	scrypt:32768:8:1$sclVaMUZSQVXPkam$6366df46a9be0c96e8b4e17d545d92890241e55558a84819099e8376278f1b295ec2b98b23f053ba3cf82592f73098d9f0f769ad087d95063788f937a94dc962	user81	user81@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ce640301-192b-452e-9395-444eae62260c	user82	scrypt:32768:8:1$ZxJfNqhEI8VU93Wl$f0eee4e77f370b8b4061c2e2a2bad3ddecd449f14fb8e65ea2f8c2e09cbdfc836afffd8515518b8e28474055d2ba8ef83adf6d09a99e4982fa5d030f875b1d38	user82	user82@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
24350e6f-dca5-4b07-acb0-4dcd25691389	user83	scrypt:32768:8:1$FAw0dwNU0pG3JkR1$2f069fb2be45ee949f347bbb80f7048ff11442c617a26a63d314099f0835c53e6d20f81118ef6851f7829bbe9f06f5c52cd2ca5ea5a4524236f0fe5c9c25ce2c	user83	user83@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
df720cf1-43ea-48ed-bcd9-85702eaa7c6c	user84	scrypt:32768:8:1$J12TSMIXP9mj8yFN$9de32f1cba637919b96d98b90a9cdf03f9900f33b5b61cbb02564446c71790958897483ad8197674066ed0ba4bd2063c5a80adab8c4788d56f45f0d38e77d747	user84	user84@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
b859da1e-ea46-49e5-9668-09ac3ab3dad9	user85	scrypt:32768:8:1$tSna8DbDKboN5xeL$79846abcd862642c9f265604b5bfe69ec1bd2d5beb4a05442727fe720a782df447b807b85a17c5483863e34475baf41ac053badb43df7d331b41927187dcd810	user85	user85@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
8da0adac-22db-4a88-9e76-65a680f6958a	user86	scrypt:32768:8:1$9DAevXns1A5CxAXF$aa03437116df319a610710fa95802281986aab3f6cfda699e7f1530055cb52276aa1708e25acfabd7d71482746626a398a68d71dea984de4d9e075bf351c6519	user86	user86@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
cdae356a-f4e5-4b4a-9523-1b5b564e5fd7	user87	scrypt:32768:8:1$n0xPbUg2FD7EjgB5$f868772ac99b3b807d5f72ce40705983190f5230a993bfbbd97c61acbacd72ffe2e1be93c798fc9c2d95b989a8590cf49efc6dd3ed5c133d3d743bf72719c592	user87	user87@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
9dbddef8-bcdd-456a-9066-347d75138cad	user88	scrypt:32768:8:1$ikho8Y5MVc0L78is$080793d4af5c0f4ee19a2b307736e1d06f0bef59bf36a502ce50ee0d2e9d45787b5f7e112093978bd3fa3d6806b8caa5132d04c5ea450cd7e2d6c9d8e34697dc	user88	user88@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
38995567-0696-450c-b12c-e66039cde8c1	user89	scrypt:32768:8:1$CU4nbxYByJqculFj$4ca3edc9b4987b5e573f9f245028eb042c5490bc616df5b14839d2cad2e71a9b9a5b7f567e812d52f29d4e3eaaffb1f80904b090a8f5f8b53348a07f59505575	user89	user89@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
e462094e-dac1-49f0-a66d-5b9006d74320	user90	scrypt:32768:8:1$uSpPVPNByptNUQho$ba318d30d4c8ae81d67a35980107a6e9c3d400e069310c77359a02bf701d583c28af471c18b643f6bd92e8d8bf0c051bcc3f50b7f6cf7896dda3884cfea88d58	user90	user90@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
896c1266-d4ff-4bfe-916f-bddbdce2b7ea	user91	scrypt:32768:8:1$nWs7jBIT7F2YVghj$04f8fc0fab36a7b4336edea20a0efdab2935164647eca70199ad1fea926eda111f0fe20c4a61a72c32d0fbadf75acaa9c3cf931f29acd63a574e4d2eaac82e61	user91	user91@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
93a954d4-835b-4976-8e48-93401c53c502	user92	scrypt:32768:8:1$RR8zLqo9xuuFKgJM$15e9c82ac7e3ca1a11f83248efac1eddb072b5deebfe4cb5661012d758d6084cbbf3711366acf335ce67cea8a4624156e0c8e78a0bd04af4f5ee70070951cf15	user92	user92@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6a6ed0ff-6730-42ac-82c6-faff18bf7cea	user93	scrypt:32768:8:1$mjvM3TPTWDv3DeNM$4b6b7fc41c08ae490c9ee994653d1c4b5212764e884068e8cfe942d4b5a6854720ad3f7951bc6712f816c715d25e0950a69a1423125222985e7a697e7d288ceb	user93	user93@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
34636c43-6c4b-4f28-a8c4-82f01ab80724	user94	scrypt:32768:8:1$ZF9cjtTxFUC6e2Wa$6aae17b91b7be160c157b1a44515b9216fd2d785117e170afe0cf4c67f0d5236ba7ac4b6eb07289e81688c3b743326b401a41ea215615825552f3be7ba782f41	user94	user94@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f836e72f-df1c-47a0-ad31-c91b374e56da	user95	scrypt:32768:8:1$LJTsz4OziX3mS8jo$aabb91d91dde1fe45febdf02e6adda794568814dac2750ca216cc1fcb2dbd4f484d72287723a119b951a7b2efd54079372bc1575e41d78a02afadcc85e250410	user95	user95@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0f46d0f4-2114-4615-82ed-eac07d08d06d	user96	scrypt:32768:8:1$B8YMmjelU29GJ51f$d5740eadd328e23ff8a5f06b56f3ecb0f7891d66371ea27b74e1a487418c9777fcd376d9477271af7b1b929d7b8a9c92cfb83386a6e93d2af48c12d6ee11fc9b	user96	user96@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
211d7df0-7480-401a-95a0-54930f08b27e	user97	scrypt:32768:8:1$qmUE4DTVHNG2d6gq$ee7a39470d9426a542800a4ca4b4555ec7a5e49223a2ec31c6bb5bc666ab41f94a2ea7e7262b0e1b68d054058d388a27f6b500d00da3f7557f097f106466042f	user97	user97@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
86450f74-dc8a-4f04-9b21-df9af019f395	user98	scrypt:32768:8:1$1fgOPWaCIaraQ0m2$f24181bd4190c23a0741425c34d8b7890e692166131f2db6b61faf48af973b24223a24766c6b007a55a0607540c0b6a176414379123a7e184cc47ff370bb34e5	user98	user98@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1a79cd34-a4ef-4a84-8221-8c6a1ae34ee8	user99	scrypt:32768:8:1$kQVc93oujFy9uC8W$e8aa126b63cc5a5443177f5f77dd30ae4c8d9084df0c2eec8b5cdf00fb61e0065bf934d814bdab0011fc3ff29577295a8fe6418677ae2390e2b292d101c66b66	user99	user99@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
885b6444-ea67-4375-813e-bc6380982009	user100	scrypt:32768:8:1$Tx8jPlmLRxohHPtR$08751ba4c4cb8e98ada5f337991cd7a0cfa49ccce25aa74b70143805a5db9557c0f55efa1a985575fbcd12cfb4321315c6264dde8d0bc54f9203d8d672deb0a2	user100	user100@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
2b2450ff-4201-4f6d-bceb-fdc5375a0815	user101	scrypt:32768:8:1$PblajyNLSi6MVlRX$a05f3b2b9eeb95d14b1f3861a0491bf62e931d9e18afed2b72e5332c605973a04967fd59a12884a3e6f6c53b2079e3c1ef3f8a087aec74885a79930e0088808e	user101	user101@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d91f2521-9a36-4a05-8413-0a69e0d585c9	user102	scrypt:32768:8:1$LKKov0ZvakWZlwJL$ba7e0dcffcf7f14f04893178ee81d3d1a0bffe094e21134cc740aed47d0e8c4167c2208b0dfc5dd5972b997c1671b713603a2f94ebaf407e30bc32bdf4e1fc4f	user102	user102@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1a67029d-0cdb-4167-828f-18a5e5fa577d	user103	scrypt:32768:8:1$X15YaPb8c9Hi9kDC$c5a801d0086daccc27f93b2b1106b305b2c52d65f0dccff4877a8fe20d6fccc072cdd6b54a2f1a007e2a35f78b96206627e856d698c43862820c409ff9b9ac52	user103	user103@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
a0fc951f-8719-45a9-ac87-6494c06d7adb	user104	scrypt:32768:8:1$n4Z1v4Zd0y2TnBEB$14b98a5a7bd7523531b715e70fef96296f4e5c1080d532947cc31b8b3f40fd6d32b8d70dcc00015ae7d0f16362bd4bedb3171c9ab86b3dac8450bbc1759243eb	user104	user104@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
c0d61cd1-33f4-4ad6-8a42-a9a176ff7682	user105	scrypt:32768:8:1$H1f1yV5PAKWUw7PD$ca7d6dc96bdb29030c0b2ae16ae8443dc54547968cbf1daacd383a9c90341cfef0f7bd09a2a7d8b369270df0f0684179c6abf49ce023c2692e48193d74e051dc	user105	user105@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
aad31c4a-12f9-4d59-a78a-2af91da8a9d6	user106	scrypt:32768:8:1$FvSRJlnUp5fej7Cz$b91e11094335a40aeebc68d920714ff8d64553ab6aa83bb82e688288e12c5ac68e41314ccb3c8478edd1826f664423c2d17c21812d6992de4502490b4dbcecd0	user106	user106@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f3195277-3673-4d97-bb78-5935c987fc0c	user107	scrypt:32768:8:1$zXDNQzB3Rt6BTIYz$e21a2403f13d93ffdef708381750e0822340f44967347d51d19d33b733605462ee300bc6ede6aed5550c20c1e383d095763390109fb0ee73c3dd6843524689e0	user107	user107@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
539da2cb-d4ec-4f71-8d8a-7099e5a0fc61	user108	scrypt:32768:8:1$BfYG6YXpdilF9z7t$1be996a94df9bfdd7f0551462f2a86e4fa321998d92d659d61d4d2a668e7d6936b69e927b92c4dbca871c9cc81ec324641bf4caf3e36afa7a4f28a2c75120665	user108	user108@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
9ccd9d60-1708-4361-bcbe-dee0af05e7e7	user109	scrypt:32768:8:1$BPVrXOmQJKBY26oF$6077cfba2373a6a3c20c83ab39d5c199b039382df3516d6aa3f53607884b9a850a6268114a33c92481f14d3dd7e6d24dc8b831f9a5d4afb3f0698949b4b38e9a	user109	user109@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
fbb03007-abc5-4d49-93d8-fa847eb6aad0	user110	scrypt:32768:8:1$ZVuX7jbJ40uKprhT$bff5829e942c7dfbcdf22f70f86fc035d98d1657107a34073cf13bccabb2c2fa6fb821ad207aa772d018e45ea2d2453981e370b50583c96b7e932a4ef629dbdd	user110	user110@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6a15ca75-dccd-4638-8164-f9d26ee4816a	user111	scrypt:32768:8:1$DzDf2xQsb73TfD8u$42b68ff73b0a154bc2b5dee90a63088037161431fbef776a3eb78d57b0ed2a9b9b1d8e183b572f04f7e7670769bf74a3316d65918235a04358b63025839660ed	user111	user111@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
e039a37c-eb9b-448e-adea-c480c027439d	user112	scrypt:32768:8:1$WVJEmNmyBYfUH6H3$3f50f7f7f9e00b3229202e2c27134f8b272cc62b882a2ead3d5f902f0396a72c41c21960d9cfd0069178199defbd49827e5a12ce008e19efa2a9f13fa2f158b2	user112	user112@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
c6d07a96-c5f4-4505-8364-7fe8a309019b	user113	scrypt:32768:8:1$UeM8uzV0XtFFuhYq$febec482b8604fdc3351d5afb9443e56297cf6b9c143bbd0f24cb7352341a5cc8601fcd19d3367e28bbb88f88f468cf3babb71dfcedce82ef426b1017c10713b	user113	user113@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
8fa10857-3c62-4f71-92ea-be86f5a4b4e9	user114	scrypt:32768:8:1$gBcy0SvdgZ3BBY8l$5926212843977dc38dc150200b827db157d47a6d034562a96291adeb379ba7a4041dc40c2cc144cfecc7adfd1b622d8bd6227756bb8b2c3b23cd972f2b466b42	user114	user114@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
92d2e7a0-9eef-49f9-b0cb-dea2df7a92e7	user115	scrypt:32768:8:1$nISBEcCfgqaGSxTm$72d45f68c135f2e11a3bcb9045796fd3ba29c69586506a2ba9b1cf2df739c7eb7f01aff54bc5cb9cb84e91ac59ea115344221683dbd3ef80fda9c142534cd9b2	user115	user115@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6fc6bee7-cf0c-4f9f-a4d4-7ecd23652648	user116	scrypt:32768:8:1$Yph6B7o2gsKL0zt8$7f204bf2f748bf054c68d7aae80e31ee4c0691878e143256b9ca42df1d559511caab935966a9ff2af68e7d3bf6c467a97c800b1c0dad4907867f68c717551533	user116	user116@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
3d114087-7bf1-4058-a364-cea74dffb132	user117	scrypt:32768:8:1$zTvJBwGD0AiQTb46$0009dddcda5a81c72f120fae3093a6e3671b49aab200f6729ce5585efb70ba84f210e9e061cf2cdeafdec42671546aec32e0dcb2c40bd814e274b26aaa9a2962	user117	user117@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
99e7ff05-141f-4af7-9506-03442fd9ed92	user118	scrypt:32768:8:1$44Pw3rEyJKpiDSHr$bbf11637b97367405813648c54caf0e7fc5edf04d32d0a76f674c23c2b2d58bd94997c1f096dd479190f157de928c89db09e303d25c26f0ad24f87854b0b4d61	user118	user118@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
9e41b704-aac5-4063-8ca8-289cd55d96e0	user119	scrypt:32768:8:1$fM5HehqjGcNsS1LH$fadffcb182fbcd76b4f4d68bd2a2947131ee3d08b4787f86a4e0e9b9be3e0d677d3ff57676207b1502c620dd9201787ca8a9dedae22f2ccc6d5ecad9062afad8	user119	user119@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
c387edbd-daf2-428c-b35c-5e9abdf0c5ab	user120	scrypt:32768:8:1$1MWmQeuOLqp2j4Or$ebe17e444d04c76990c39b1ccca73bb03063af5607e4b274c62cffdbdd92e525e4e3d9f0e6c0a56b5cbf3152bfff9115a2cab9544ae12582d3e6fda3df81fd87	user120	user120@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
06c63d48-8e2a-4aea-ae10-d3997fad24a1	user121	scrypt:32768:8:1$e3RtXH2XYLU7ydWK$9b2ac18d10184003b1ecf34db7d7ef8bf3f91dfa63d2b2a4e0e074314785715a731b6a9d5cc1443b9e156a8babf562cf29498feb5c3e47e4aa34f0e8fd5ca589	user121	user121@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
3295e88c-df4c-498d-b979-cf6853e6610c	user122	scrypt:32768:8:1$jjN5WiAmK7obzQpE$91a6d8b32bab4e0ed0561b2065fe57501c4beeaac5eeac0ddd52761e70c25cc726f683cd429aaf32a6ae74b3b36621b5974f70d2dc680c7338634ca488e04639	user122	user122@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d72f5ce6-9f73-43ac-86c5-5ada672550b5	user123	scrypt:32768:8:1$YZ4iVujt3NfJ0o2z$271e8236b75242626d3a50a9f3d6609766fc94c8fb70c1cf4e82d7e5977c1e57ede27e717531f7ddbec544f77c316093f98066dd1bf10a8be13d48a31c5b8d88	user123	user123@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
9ba5a135-5043-4a79-a899-ad6c797ffc45	user124	scrypt:32768:8:1$tyZ9OTxTwsx8acUH$d7e98b1b0e2ec9836d57e3f03e2e6b9d89e49086d7002d0eb1f3fb42a262affb80ad4c7b0e2cf2000b1cc4df0397c4fbebb6af14c3380998a2cbb03de508e5b0	user124	user124@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
901b29d8-7993-4f95-adc9-dd020ebce898	user125	scrypt:32768:8:1$lZNBfqmXAXW1tSO2$01efee64bd255b1c3c638bc4e8c899006de1ca371f8d2265eff93456e18e2868af615754d63c59375bc01b9b909c3a3b7668206ea7f41f9d528d9ab35357f228	user125	user125@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f86fc413-07e3-410d-87b7-3de6d4820fd4	user126	scrypt:32768:8:1$vaLxJdkzM86PcUrw$1b02d28bdb2b349d830b8c8cf7586f14cb6411693dd8727056972757a2646d8b8177f4acc519487d678fb372693e3b8a10dd782755a6a4da3f7c8ab1097f7607	user126	user126@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f6a9a5cc-e7f3-4125-8f3e-d9690f85e03f	user127	scrypt:32768:8:1$symUszUioHfN2txc$72e62071d0901ec1ec44654e5b17c55b7369afc7931a63cb30331bd735820c9575722dd1b6521a8789156a09ad1521cb19fac27d791da3354fa66cb44d3e7da4	user127	user127@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f5696b99-99ab-4504-94e7-efe1b1098f47	user128	scrypt:32768:8:1$WM7DqwGqIk7bBL5p$aef26c6d603f48f57dcf1763ef943501245801d589e2f8e70718d96561150f87e7693a66f8e02126b386376fb4d3c98dd5ac5dddc7359f99f653bbee7df1aa3c	user128	user128@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ba864af1-e063-4576-a1d6-f99c2d01e4d2	user129	scrypt:32768:8:1$Mi9UKgRkdAXys5FC$d97cffde3d955dbb07a1f32cb307d645516ccef506ce97e6c24efc0ee39a7b31570271ff0d80dd798e0c2d20d44c6bc53c491ffa4c6a2f9f4d16190c86b79009	user129	user129@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
c85c9171-a2a0-4c9e-872f-d442ce5bc6a5	user130	scrypt:32768:8:1$EhEYROTaLJhOn80g$9d29a4ec533e3cc863fcb2eb750d3ad02f2bbb57767444f58b4dcecb1fc2df220f59665a3372d944d84317769e076bfe78e36b40b232f740704336d2e1a8d302	user130	user130@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
4325abaa-39a1-427d-9e4f-e3a5d15dd4d4	user131	scrypt:32768:8:1$ortJcJsrN6ychznm$6342db75d1047d897c2b151ebf38d6d67ddba3c7d34a2715f73a8c3cbbeaf9ad6720d06027fee7283b8658f1ccc8f210b8d9359cd115cd90b0d3d3121d5aada5	user131	user131@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ddeae2de-f1b2-44d7-acef-9454514a869e	user132	scrypt:32768:8:1$4SDCwb3Hp7IIsErI$47717873b6dcf6b54a16428c4c158a33953a75128d72d5a4498dc7be3a425c95df91d3e5f6078573bebf092e43317554c2ccb1aebefa36d0e8580753b02f9482	user132	user132@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0a2ce8fb-1901-462c-ac45-3e78b7b7eec8	user133	scrypt:32768:8:1$uJQmufpyD0UUXziX$6aa86311bc726c739f692c336a8ecf01dbd896e1f0dfa1627cb83862a00f39a9a4288b15a7e5182983fc478a92f17891da9f804fd973fa24e0b20332ed80b4c0	user133	user133@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
7a42753c-2287-41a5-bcd8-68ad2ed8bffd	user134	scrypt:32768:8:1$NP0j7MuGdlfaf344$25329f1598986333c389e7796bd8d60cbbc6e57d31ead56061178f3e68b00e514154e5816a983e56afdf85462ee934150faefe8b35c703ecd0ecb88cefe5649a	user134	user134@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1b1502f4-e745-459b-b10f-e82ffc920e41	user135	scrypt:32768:8:1$Nzf9cx8dSnQw4l4G$c8df5079262dfa698f1599ccfcb88a8cdd3c1d36f180f3fbd05755de5fbb537a632cf034a8c365bf86dda53ffc029029c79487f2306aa3916e0c5c3fd918a1b9	user135	user135@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f5833049-f66f-4522-8dbc-6cc90c40e1b7	user136	scrypt:32768:8:1$gFt2lyQk5L5LRJKu$3b1de9b9ba1ae2a274a1beb4d42903deb25eb94359fd034a9526e7c996691c0d9ae0f9d5e03211e93e78d162369216c53d623209709b24994d457888530634d3	user136	user136@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ad49ff42-8e74-4b06-8420-e62da4eb1721	user137	scrypt:32768:8:1$Ejs574u5TQnrcRkI$db001d8a5175a45577ed27ed81a63b2725d9ca8020aeacfd0f0e532432edc7042816ac1190a3cee37f210aefecc6bce3f50df805bc3d7490fb09a9ec021e9c3b	user137	user137@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
1ec4fd16-34d7-4e9c-90c9-d3b2c25bed95	user138	scrypt:32768:8:1$10dmFVVxlfw1llf5$f827ef6d3871969a1118d1f50149a242dbba47321e78511ba97f51617e43354da9b0e2b1f6b81fcfb48d20d6d8530f51b4d850546de5b39ed4c05cac4e5c3596	user138	user138@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
fffcd806-5106-41c0-ba0b-d8e1d95422b5	user139	scrypt:32768:8:1$1CZPL4OvTmc8NZNR$b84fa45d4dbbf627e0389882ecf2fedd3b69598ed95c9d45339fd8efa5b38f24a651bb3407c336b400f23ca3bc5cb6f70ed00c9e1c60b7710aca30b51b607364	user139	user139@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
8a345aff-ae49-4184-ae8a-a08490d53348	user140	scrypt:32768:8:1$Y1YCOlHUEClwGHqQ$5c5af32402f75051d26f7d9384b882c70060769ee222812de3fc9fe804bdc85d3f686efe7e3527c2836b3b01935d3d4f88b72fd9d3133f61158f84dfbdc346cd	user140	user140@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
aeec2839-bd64-4f68-8c66-f5e39e63b6b8	user141	scrypt:32768:8:1$wKOQSuoncMZtfu9Z$09c6f5168d09d2e348e822d298a453bc6fdcd4e78e1e21a79613b451b573af334fbe912db38aa8c4c08bd8b9bce3c56e865547f15ca35b988f9470f58ec59876	user141	user141@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
2c5f07d3-faef-46d6-9e0d-82921fe7e571	user142	scrypt:32768:8:1$5RfBsqBws3vqMRkT$268ef9dbda4b7d190756d49fba4097c1077a27a106866cf000960fddf418309d98d847e721d524e7d926f23976316190689b5a6fff2799c1eb663d6a87c18b20	user142	user142@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
69d2e089-dc00-49d3-97b0-40184c8d1e3f	user143	scrypt:32768:8:1$RQlDYV90b4XxYrUs$1f6cce65947239a622b8c567b1a2738260b263da4dd6b0e261d3e214bc01e23ac7148f703b5e298a091191cd6e3b9a3bd1fbed41e34b457bc83dcf504a1bc13f	user143	user143@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
3a0dff49-eb32-420e-8fc1-44b1362d2590	user144	scrypt:32768:8:1$cBFcV5Ba84KBE3eC$801af1bc3256269c4facb2f72a4894aa13969bfd460e628d3f5f6884dbae0087acb008ff19fb162e2f9b57d337d05104ad715398576d5599676584b061f83582	user144	user144@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
228a3fa3-21cb-48ef-85f3-13e01562032a	user145	scrypt:32768:8:1$LbbwJWfrGHeP8A9d$e69b802caa808ddf40b041459aceb2e8424207ead7a45feece8b11d0dc1df69b8ed376577bf7a0a24431f763e710adafb3045646bc777f3d53712a83b9baa67b	user145	user145@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
932403ed-2b20-403b-bb55-684cfb6c65ad	user146	scrypt:32768:8:1$2Dc2HRiQxtsbOVAz$4a521286ffbb4b2d0dd8a6266edf5f37224f9aa873c592df122764245e9deb7d88a7b5e4f2b159b58943ffefe9037b9625d690e824f929f7e7e577f7ea1878f6	user146	user146@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
38f32839-1a4f-4b31-a6e5-4a310cc9a82f	user147	scrypt:32768:8:1$HF75C8ozAQfRtSSy$1c263fa9f71b059f76d43bca3a84de2ebed540351ed08927c85f4e7874e1d3b7325e3f0eb2883335ee7428e20bd28de0c63920aa01b26c08ec92720313a0b091	user147	user147@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
c5d9e9d7-c044-4aed-ac74-49a54de50715	user148	scrypt:32768:8:1$pEYEOTjMEYE2YLIS$bb5f21e71af7f9f9f38a3886614f48d7010b866a3fbfb6f3af084b52df7b834f265496135e782ca95ea905e660c41d86fe9015c69abd7a8cc5d82baa1a5922a7	user148	user148@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
2c88dd7f-81a7-4af2-9520-98b6b15fba58	user149	scrypt:32768:8:1$xJd1gaFso1iwHOwN$5d700fc1e98fb91417475902987a065c5c53eeee1c79a40ca7604e8ab2e17451d501c361c01838566c1254d31687ac29150478f369e484002311b3582128b31c	user149	user149@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
bb72de66-b98f-4cf8-aee0-1397a053fee0	user150	scrypt:32768:8:1$SkDTtDzQOup52bdc$ac6d67c1730df5e28609ce077a02d89a8a168d5579e86f3d61a3e36884479b163f7738873fa95615754d84431c4388825df2bbdcb1d45b7bd738c32cdc964cf7	user150	user150@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
35589886-ca6d-4e26-85cb-27684bb4e169	user151	scrypt:32768:8:1$Pm5431cLN3x76RHi$a583738ed1845c88a0723a8fe0155f0d5088a6a27255389dea3652b232547b00f7a13db95ef9f5a8912c14e3799a66fd9dd2beaf7dd4bd0ff64bf65e77b1dd40	user151	user151@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
4e521894-b607-4f59-8127-1f77668e4b6c	user152	scrypt:32768:8:1$ePqQasHMqZq5DGMa$a7e23c6a259e9d86a7d4ebe452c4f50897db53c0c7eb77d5ebf646efcc4a7e216e648e30ae68b0ac0d688a94a567f34de2ce0bc06b93f224c734d161397d0d55	user152	user152@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
c1749bf4-a5fe-4298-93ff-edfc70c0d2e5	user153	scrypt:32768:8:1$RxZQTqLaHff9GdvR$244d65188f8b01cb93814c6185256c9dda4e8d07447eb4fd9f780f28c4bbcd695bba27b96a5e110a2d35a52695955334f6ec5a6b1e442ba0b626e5a2991bef98	user153	user153@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0fd2dd2d-cc4d-45a1-af93-8b740ed44598	user154	scrypt:32768:8:1$7Lv8rRhfjIMFb6d8$3c612e115695796f36bbb87898bc47c527f460701b27a802c2fe4773b0ac04a0d28e9dd8de1866c75e04ede46bfee7aa23a71c7d1ad92cb5fdc327ff17c8fb7e	user154	user154@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f00e7170-f9b2-4825-a620-32044d84759d	user155	scrypt:32768:8:1$6wqaiumXUjqu6BPn$134e3304a08227067f39f11c5169a04eff2eec0f8c8174445c1c8a8a32ca0ce82a9f0864d37434be7400d9ea8346e77c0f53dd636594b6acdcb705e6b06a2581	user155	user155@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
44d32b2a-f15c-41b3-8a91-25fa08939d04	user156	scrypt:32768:8:1$qISRb6MKJA1AkvmX$60cccee2c53efa0a52e0bf9804cea85c01aae1791441741f90ce82245feeed08946b5a58341dbec71b298c2bbd38d6fb2fbd698098292561007d62cf9fd03586	user156	user156@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
c68f53c7-0b55-4a97-8539-96ed3905cd9e	user157	scrypt:32768:8:1$K6n4hfzdqWRUxprI$744a8a6d1b8de3aff37dfa68602b3b25bf42691074b1a36bb2c44de304a9b4ee52af71c0a68797dd623780226821d809251c4a6da933ea96c064dfc92bbc3185	user157	user157@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
4658c8db-2f7a-420d-bf9e-ed07ea590e3b	user158	scrypt:32768:8:1$AyfgrGk3pNQd2Pu7$3681d6c136843264e98bdf43a2bd80bc0b641a125255096da9feaef6bd8f718df8461cdd457248e5addd02ee4949ab7b388a28706885c86f60e0d417f1263d8c	user158	user158@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d28e768a-1079-417d-a879-bd6f8ba60323	user159	scrypt:32768:8:1$EukMGic3K3p4nF3r$f0c69943286fa6aecd3ec7e8f6e1c590383ac302116868727939889870a21fd5ce105965b6532111fe274406ffe5c12f45743649f79ebf099a7464d40012f8f8	user159	user159@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
83ece77c-1835-4d41-accc-a28e84096c05	user160	scrypt:32768:8:1$mnT0HU2wx7XNT5r7$35eae3fb093ce76863714ddb59f88536c23641e4040a41278e880c8eabf001ab087a9561a22ec80e353887962fee56b1ff56352689a0e370ef652eca6a7a8ed2	user160	user160@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
5b36db5e-63b1-45fe-a67d-5289db4c7fd1	user161	scrypt:32768:8:1$UBXFzU7fozhYxSHt$c641062200c1d32ff14555992ba73b8d144214a348a890583703a40ea258bb02e009f2500d178816b9e3cc9a8f55ac831777f82617c14ea6594fa7f577fff121	user161	user161@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6a826cea-52ee-45b1-b841-db349f38c3ac	user162	scrypt:32768:8:1$lfKhzppx1uNH9aAa$0d5c3a408e73e90f3a55fd2e4726a38ba265a0ad5ff32da7da7e9ff9b732a346694f19f20c6aa9af7d3abe3a03064c2e522b8b3b9d634b474fa1895d18c9ed09	user162	user162@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
60763bb4-7231-40cc-bdee-cfe626af005f	user163	scrypt:32768:8:1$joDoagDjDQyftlYK$e3f00018b20eab5017db6762439b8c2d23b70e0ae8c4228746764848beda7c2a2a46f4b1de7fc7d890d059bc83f8627f0580697385eeb0bf14ecc08d543c0b7e	user163	user163@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f680c748-96c3-44a8-b18e-5b9c32ac7c4a	user164	scrypt:32768:8:1$LTR5aUfI21bYNzJ1$fa49e2de4ad6dba27d602ab4b6ca92d6c1145063819b57de34ad5fb5149d9fa2a483795e39a7899aed70685ef4ec1a944ac49eb4bcf14c8ae161923933743f56	user164	user164@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
428465fc-1e48-4fb7-8001-7de8c807f36b	user165	scrypt:32768:8:1$gsnD2BIIMJUlr2gF$dcf3cf015ca963dbf6940708fdd996b2d0008273233675f4a6bca5a7ec50dc796b7b13d8e8757c2a251fba58af7543a960fa7318dea2320be0085f7d8a3b9d79	user165	user165@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
c7df9ece-3858-47dd-a262-b86bafa4da1d	user166	scrypt:32768:8:1$0AFu7wJwTasf7akq$5fd6d945f0545533e5697993c30419c58e8dc8bb7b26e74e80a1080df3a9bc066b7c6b5459e3be879573e5c8c0f28b23905260e42da8aaab576b77eb7223e296	user166	user166@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
48e3cb1a-119e-4b1a-b275-7515e7ff13a9	user167	scrypt:32768:8:1$YPlhrKJIKL93RU54$8a2035a3cc6460522a077de149eb4f9b0cb4a61443a8a1da51f8cb1b02fa936a16af0c5ac6009a6a950f697e3636d9277f4bdb61c884a8681f4d90e7fd8c9d8e	user167	user167@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
deb9223a-6a63-4861-a25f-b4fd62233f60	user168	scrypt:32768:8:1$v8uNWyBAN3UsltMU$54cd94470e7f64e367ad1964a1ce43d9754b7cdb936b41b25c9a80c0ee39ed30a0913ab1b02f26a57d5aba0fba6332d9fe7b4631b56bb7aac9fe39904b85eec3	user168	user168@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6397eb4c-92c6-460d-bdd5-ddd3e787ab57	user169	scrypt:32768:8:1$S5I8KL13OB2VKEm8$116b711b1a23824cea822161aa0c3244c209ee7b130bb05773992b40bd3641bd40e699c2c9edb92b42233799d0f2386b2bdeec872642741f584c8ac25408120b	user169	user169@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
95cd2efc-4e27-4054-94e4-bb7491a69779	user170	scrypt:32768:8:1$C1AsKfU72x3CG4jF$1dc7a0f97367891737192619829086b8ee02cf7984ad47ef5fdd30f019aed8ac483bc668c43c5ae36b6304088f6144ee36d597584978be584095fcd9d19e8c53	user170	user170@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
75fafaa3-ca71-49be-8a02-9f101de40ef6	user171	scrypt:32768:8:1$3vqL49b80cHuMO6V$f39bf5b68b2817010cc1929e2f40fc746b9865fe05fefa2f831289dea52c0287d70c75e062defcfa184e542e6fbe25d0d761c7896e791aae6cc1234f26ec5217	user171	user171@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
7655e24d-71c0-475a-9679-b057fd815ea9	user172	scrypt:32768:8:1$vTRHLqiAaqsFBd5Y$9aa3e6b0efa7236ac0968eb01e3fb766aaf1fe4d581976f8d0a7807bf8bad929e757e6eaa6ac461e3fbf6577cc16dde3fb28d36851af9696deeeb089004981f7	user172	user172@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
2fd114e1-c0e4-481d-a89a-3c425120d0d0	user173	scrypt:32768:8:1$qzgT2BgX081fnJnm$8d377067d4be8a7b2d744d40d1bee30a7775f884d35b7634e04fb2b1d1c062b35562d91228845814abfc4d731876bf83249d14d096ff5ffe0d35b975a62a5ea9	user173	user173@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
8daf9bc5-779c-47e2-a3f0-c596b6cd4e56	user174	scrypt:32768:8:1$ALmfod55iFreAtHA$490c03a9a3000154e798621cdebf3faf0ce944859f5a8dc1ac5081566f7508acc5c3c09ba92783f9e228d693af607515ac4d868361cc96d9bf4d8215f5d354b7	user174	user174@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
cb0e1178-4b1c-4c3e-802b-031bc87a15fa	user175	scrypt:32768:8:1$IVgc4HubyV2uaByw$93a01f9088ba26873f3b857580cf29b9cb928eb3c0ac822757114ba2108122507bb932415eb96f27cf7f8524ca6f848a27504ec3255708f76c2e3754a87b9d7b	user175	user175@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
03a3849f-5a0c-4d3e-b30e-d516d34e5127	user176	scrypt:32768:8:1$A5M66pqP60eSohXo$8f6271cfcd2f218dc7acf14210b5a57db55c76c7e65278c013628cdc2f6fb27694d5cc0ea312f6ef5a2b26672c14c26d424f6c0f6296185741aaaae9b61b8622	user176	user176@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
3fcd68b9-a09d-49ee-a583-fc848e0776b9	user177	scrypt:32768:8:1$qMMJ0FPSym9kRIpq$0810da25d9affcfa1e62f4cfd9107b137033fa049e9e77cbed6b89cd4b0f02d0f75a62f2e75cf7715b14e1a4384d34e838483f48b1ab52ef2896706dea7c7f52	user177	user177@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
bd6a0115-72df-4af5-b3a1-e9c6e0a8baf9	user178	scrypt:32768:8:1$ZyM0rnvpkfRhbRXC$362ebe45fb8b5272137f016da87d3f5711769619032c68d21ad54baaa31e3bbda0e5d542cb596f51a0dd91f3d0c34ac5594626ed04f00988be7c58b06850e3ae	user178	user178@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
5e6f59cc-cbfa-4488-9199-77e718f5aaf8	user179	scrypt:32768:8:1$jy2xhRh3aaQMEcBJ$a9493aa3e56a8c834e3018ec3f41cc5806827414acccc47b6f3609a85471faacea65d32ee9431341692ece747b39d590ba7ccaa725b7897e5bf061168add1f12	user179	user179@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
f1759009-dc04-4437-9bda-668f8f5a9dc9	user180	scrypt:32768:8:1$taQ0aWn2KNl2XVsy$78e3cd1d5e7f97b3b8017ba26169dda4ed09147bc60a7549194b9119f5f8e6f39ba57549de0af7f216a45a6227443d139594885a98b04b826671422d82ba2a9c	user180	user180@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
16a9cff1-4825-448c-9c1b-45de6473d89b	user181	scrypt:32768:8:1$QCTtCmKH49es8Wf5$29f3ec2ddca475650a883472695668383339c15f4ed7ce1c29bf33140d2ede25a8f37416d7a87c186fe0d5f45d025e9d90bc049ac11f217c906f3756420cca63	user181	user181@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
b4f30d07-d8ba-44f6-81b3-9bb0ae4796f7	user182	scrypt:32768:8:1$lh0W7et2Sl5QH1We$fd62427ee1a30c55068667af8f0be3aaef528a6b39af570ea28d9d8a8a9f364c2aa6ec8b42094d9327920af6eec70bbe84248a8d3f953a1a0555441a8ac91c45	user182	user182@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
dd9f510f-34d5-46ee-9ed5-e4e9400f50dd	user183	scrypt:32768:8:1$ez6eVSWKWxYwt3s1$96362d9a4ff7ec2f9341c96d624fd936d2b5ca997469634a603d52fbfad465fccb20e49a1fd63c9762813cf734ae4ee6585c531fff8c959dea9df625b200ce8c	user183	user183@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
b657bc27-3bb8-4d9f-a929-2e4da7d6fb66	user184	scrypt:32768:8:1$KpGO1ZqnL1Dkcmh1$25cb464f2c90dcf6a29aafd9c8f9e1e5529711faf4f62c734bf06d90aed91b368cba031f54947769801dba2abfe6045b49f3c21265e937990c42ed52ca2eb448	user184	user184@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d4ecbf8f-412a-4a8d-a2f3-4b68a380127e	user185	scrypt:32768:8:1$izY5eQrCXt59178U$ac6bbaf2b7ba486e58dbe1a2704b059515d89e7a6358acd456fdd861a676672b608fd4bc6bf30b26121b6c6e0339df483ce8162c1121cd8e50af1cc3e901e071	user185	user185@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
eaea03ec-233d-4fad-8b15-3777d47a8a36	user186	scrypt:32768:8:1$DDXVCgXjysaJJZe0$c1859aba5f5a44f58ab0874a2874ef0ddf10647fe506aeabb27e266f68a866ea589d95541ca3987ea8f1c27b6e4e646483cd99d8a2994b3b667b7988070aa9a2	user186	user186@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
5ec0d8a8-afe5-4037-8ce3-630bdb74e305	user187	scrypt:32768:8:1$wlQaWRy5Fi8QUWrY$bf2d23b19e58bda812a09d43bb2e3115ef58ca9df4ad418ce5b5f8368091a2772c4c5d1386e89f097b9241bc11b6dacb23c32ce269bcc08dfba328a43a80d925	user187	user187@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
7ee9037f-c8ff-4b8e-acb5-656d9e26b0da	user188	scrypt:32768:8:1$bhg43HDvIEg6us9g$a9d763d2c601975c161261a86b859b7443194330d04052e58a91b3ce0beeea3b3f7e88540e6390e46ad8f28496ef8fa5a78cde7d1ac1372a4c3a958207c929e5	user188	user188@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0bad3eed-72d4-41bb-9333-c4987356e605	user189	scrypt:32768:8:1$rBNTMvg1RcYHrNpE$b81179dba2f1bbf11b199af057574c872762db7d2cc3baca6e87dbdbf6cc234b4ff554edafdec8f153c88a325c7d2a81680a512a0333834d8de1498038d97011	user189	user189@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
3b6401eb-7374-41b0-ac1e-7a8611d3151a	user190	scrypt:32768:8:1$ZyzUcfC85mR3vbqj$61fee4d36ff3e7eb733092883618ae59422fc64bdab77883c5a2c1325e2a5bc2b46b94cbdae22879c75d69b24a77abe569085bd8848d541ed9a33f05baa64105	user190	user190@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
fc3e08e8-b0c7-41a8-8726-411ca77ff988	user191	scrypt:32768:8:1$462UbBvmA32A11Hn$36a551e22745ae8f54a0162e48d5a98f877a7bc7347ff7480e39fe3b0fa2884130660b276a40c4020fbe1f8888f55fc8b5ab51238550c12b83af44d5ac1e25d5	user191	user191@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
6a5318f0-e174-4d49-86d8-d42987bd23f3	user192	scrypt:32768:8:1$AJA9eOdzE2NsPvOD$a6f277ce1c9ab3d68e120850905216812024e5c3b32631deee2b0c5bce375893e97edc86b733eba4f034960a1578f3d181ab4ec8b1f72e40323ffbd83304c5a6	user192	user192@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
d042c056-0616-4aa5-b3cf-d82cceaf5c2a	user193	scrypt:32768:8:1$3ZhF0r4wav14nG0z$2731e0a77f5d2cce0c6367ab22eb25b85e105561e28188e29d6597d1b9398ed6166d6f1f87a611566269620f60f4c42692a957e6d37a6d984a5c17ee204c51d4	user193	user193@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
7f833705-20b8-42c3-ae19-c5e53a02267d	user194	scrypt:32768:8:1$eoK959tXCXejXqY0$6c62688cdf5ab696271a743a9666e8d78a5c9f64c7a30e176502923bf664e017393c377c005eed81c5b7205d6d383ce4eb8424adf89def8c0989dbbbb2f8909f	user194	user194@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
ba9fb505-c8d0-4e9b-a1dc-26649f7a6424	user195	scrypt:32768:8:1$fKd8Kp2MwuEFc4tf$ae91b92a2307a57686426b31e6b63799003e1f548caf51316f3515a52b70afd4863b101e08d75d53e33ca21514bbec71830c30d7e4124e15f0c83422d4079253	user195	user195@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
81338e1b-cc78-4383-9d79-4ba09a3f0cb6	user196	scrypt:32768:8:1$rmU5iaz1n5V8dZ4b$4385900410b308a4b7ac142f4f37931dc308fed36790862197e1bd68d6095bd517c381bc1d37975008de61b7148a28aea9e0020064e90dd36d2148372f52a795	user196	user196@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
194793f1-3367-4444-ab86-59307de48186	user197	scrypt:32768:8:1$JEVsnxa1ZnDPT5F2$27006a83998cf453a29bb8818ecffffd8deddd8c51e69f7afd83f7df8abd8e235dfdd9616959480e8ef49c4a6fd8acb938d1c9856f5844b7c7e85443c5dc1b8b	user197	user197@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
2fb21e14-e8a9-44b0-a2ae-346519ed2e7e	user198	scrypt:32768:8:1$YCBRek1xxlKH3b8r$a2f39a8a9242918ef76a29df88c37c289f96f84d6b0aed92b3c7b602984516621939241462c142a876e51662d1edb67a6cccead59f9dcc385003d85f8418a932	user198	user198@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
31c3939f-4667-4039-8607-aec160c4398c	user199	scrypt:32768:8:1$wNz2EBC2rQt1wkrL$6826f19eab07ab99c716d134cd8f35a10ef32ab9fc0eb45afceec61268c004b07afbb71d9fd51b1acef29bc35afbb884f623c018573ab4da39b074aa1517119e	user199	user199@example.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
31b81c29-cb50-4e80-8795-f4ffb6e8ea81	test2	scrypt:32768:8:1$uhVbLa4vLkbqZrlA$936715df81a6c046ebd7a1a3ff52aed23277ee7ec9568ebd8759da3a9280f9714c592a579d1665cb1b40e4ed28646b74c37c6ce8da6a7178ad3d4d3758b34354	test2	test2@test.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
dab68ad4-650d-47e4-912e-b28adf25eee4	test3	scrypt:32768:8:1$8ugTeoA9pux7GlJ7$28274027a6f1b7f7f3b18fbf840ed5195f4feb3c54108393e66cc8b613580f89c669f85d7c52d8f10eb90b7d7381f0266a683a3b21f5ddfa6f8dc7e2e848e27c	test3	test1@test.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
0c525664-f742-4188-a30b-79d48383cbe8	test1	scrypt:32768:8:1$rsDeOGOiBLEtvMPh$6fd8475d250aa1be4aabbfb8c5c66136ac97f951f7ff89988a200d6699ff4beb50c934c70fd6ba5f77bb02658e0a029f2d1a774e73dff982e0c7fe68a6d946d2	test1	test1@test.com	25ae1ce0-91a9-4723-a31f-7c4506db4022	300	50	1
15af3416-ea17-4ea9-bb6d-0359e78a2c26	user200	scrypt:32768:8:1$MMpGErS9Ptv56bxB$c393e11e15b35855a3d5b39d059122e4f63c96d2b1209b26ac5b27bf294008b2c4435b0a782636ee56241aec6c0d3958ac4d5f8a91bf60b47d719053f7ec9871	user200	user200@example.com	1f47f9ff-de59-4ca9-80b9-7d1d7d92e590	-1	500	1
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
bb63b3da-4d63-49f5-a588-d987969abadf	test3	/etc/openvpn/test3	test3.conf	test3-status.log	/var/log/openvpn/	test3.log	1	test3.service	test3	1	1	44000	12345678		2024-11-29 14:32:15.148287+08	2024-11-29 14:32:15.148287+08
31b5a437-0e2a-40a3-8ca5-b8bb1af06107	testtete333		test2222.conf	test2222-status.conf	/var/log/openvpn	test2222.log	1	test2222.service	files-tests2222	1	0	33000	12345678	XXXXXXXXXXXXXXX	2024-11-22 16:02:49.662073+08	2024-11-22 16:02:49.662073+08
d8949edf-0a70-4a8a-9e63-5afc2e4f2a66	test1		test111.conf	test111-status.conf	/var/log/openvpn	test111.log	1	test1111.service	files-tests11111	0	1	34000	12345678		2024-11-22 16:03:33.66889+08	2024-11-22 16:03:33.66889+08
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


-- Completed on 2024-12-25 13:18:52

--
-- PostgreSQL database dump complete
--

