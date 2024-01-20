SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-1.pgdg20.04+1)

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
00000000-0000-0000-0000-000000000000	994a2490-8ac9-4ca0-97a8-72fda4f8364d	{"action":"user_confirmation_requested","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-07-14 12:49:33.623311+00	
00000000-0000-0000-0000-000000000000	16c2619e-acb6-4e96-9e71-96063117b60f	{"action":"user_signedup","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"team"}	2023-07-14 12:49:47.038876+00	
00000000-0000-0000-0000-000000000000	98c7c390-8dcb-4f96-9448-44b04b0a66e6	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-07-14 12:51:56.267823+00	
00000000-0000-0000-0000-000000000000	fad240c4-8748-4981-a38e-dd421a9ea388	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-07-14 13:33:03.152771+00	
00000000-0000-0000-0000-000000000000	945440f4-3192-43b5-b1b6-8e6b93686d18	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-07-14 13:33:27.192464+00	
00000000-0000-0000-0000-000000000000	b6610a2b-51d5-4087-9bc0-d37d867e5b92	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-07-15 12:19:54.702986+00	
00000000-0000-0000-0000-000000000000	66f4da0f-2372-403a-9e92-c1b9e1c2cd57	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-07-15 12:19:54.704045+00	
00000000-0000-0000-0000-000000000000	791a7439-d47a-4b6b-9d9c-cc62775b059e	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-07-15 13:46:48.664339+00	
00000000-0000-0000-0000-000000000000	2330a84f-ff69-4f7b-85a3-d704667ecb60	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-07-15 13:46:48.667627+00	
00000000-0000-0000-0000-000000000000	ba0ca166-82d9-4af7-ba47-a787dee61e32	{"action":"user_repeated_signup","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-07-15 15:31:48.110168+00	
00000000-0000-0000-0000-000000000000	23cf61c3-bebf-4da4-918e-e9c9fa991860	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-07-15 15:33:18.353174+00	
00000000-0000-0000-0000-000000000000	6b880c6e-2c89-40bf-9b37-e07efbdd46ed	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-07-17 05:53:28.815848+00	
00000000-0000-0000-0000-000000000000	78fe4a7b-7b17-475c-8437-098fc26cc9d5	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-07-17 05:53:28.816414+00	
00000000-0000-0000-0000-000000000000	b9fb3cd3-42eb-403c-a8a8-5b2a1dbd9cf5	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-01 11:56:51.455357+00	
00000000-0000-0000-0000-000000000000	1e9e9268-9cbd-475e-bc22-5848ecc4ad03	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-09-01 11:57:05.416644+00	
00000000-0000-0000-0000-000000000000	a4f968e3-8e31-41c8-ae9b-dc374ee8e95a	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-03 17:21:18.093059+00	
00000000-0000-0000-0000-000000000000	c6bf24bb-09fc-496f-8fd4-560710d8a7fe	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-04 05:45:58.427077+00	
00000000-0000-0000-0000-000000000000	24117a14-09fa-425c-83c6-a51ed600c914	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-04 05:45:58.427715+00	
00000000-0000-0000-0000-000000000000	eb7c0e4e-ce4a-4d8b-9cc1-340ea5f9d9e5	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-09-04 05:53:08.841109+00	
00000000-0000-0000-0000-000000000000	3eb93f08-0d30-4cde-b720-5515475860ec	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-04 05:53:10.578349+00	
00000000-0000-0000-0000-000000000000	55c0fdbe-1103-45fe-809f-efbf3eb02b57	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-05 18:24:28.910862+00	
00000000-0000-0000-0000-000000000000	cc0dcf46-46c6-4f14-831b-44bcc622658b	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-05 18:24:28.912312+00	
00000000-0000-0000-0000-000000000000	515a3fb7-44f8-4ccb-a143-8ee890d1d3eb	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-09-05 18:25:25.66037+00	
00000000-0000-0000-0000-000000000000	10e8696e-9862-470b-83df-d87ab1f4cf9f	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-05 18:25:38.943141+00	
00000000-0000-0000-0000-000000000000	1173b6b6-a06b-4acd-aba4-5dfa2efe030f	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-08 09:30:18.630767+00	
00000000-0000-0000-0000-000000000000	bde82933-e588-4759-b6c6-020f1e21d8ce	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-08 09:30:18.63159+00	
00000000-0000-0000-0000-000000000000	140358a0-191e-4fad-a024-6fb5812b9396	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-08 11:51:12.649171+00	
00000000-0000-0000-0000-000000000000	b3a7dcd7-46a2-4090-82a7-59857a11e6d3	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-08 13:01:20.325663+00	
00000000-0000-0000-0000-000000000000	60b2a6a3-3a62-4f44-8c9e-bc5163ca0911	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-08 13:01:20.326363+00	
00000000-0000-0000-0000-000000000000	a9afd352-d4a5-4c37-afb4-cdef1d4ddbfb	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-09-08 13:01:26.675978+00	
00000000-0000-0000-0000-000000000000	73674bb8-9444-4a7b-a645-23dac966e790	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-08 13:02:35.227207+00	
00000000-0000-0000-0000-000000000000	835197de-9925-43d3-91ab-a804752f258a	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-09-08 13:06:59.3108+00	
00000000-0000-0000-0000-000000000000	9a55d523-39d7-4f99-8b88-ba659f6beebf	{"action":"user_confirmation_requested","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-09-08 13:08:10.642339+00	
00000000-0000-0000-0000-000000000000	bab43cb8-7b48-4355-a9f4-e6e2bf69e6c0	{"action":"user_signedup","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"team"}	2023-09-08 13:08:34.963741+00	
00000000-0000-0000-0000-000000000000	47fd1446-a698-48a4-b57a-f687f3125a1c	{"action":"user_confirmation_requested","actor_id":"1ffadae7-b351-49a6-8ae5-7438a4cde093","actor_username":"charismatischriesigerotter@wegwerfemail.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-09-08 13:18:55.476692+00	
00000000-0000-0000-0000-000000000000	c99f115d-cd62-4ad9-877e-60a54e115532	{"action":"user_signedup","actor_id":"1ffadae7-b351-49a6-8ae5-7438a4cde093","actor_username":"charismatischriesigerotter@wegwerfemail.de","actor_via_sso":false,"log_type":"team"}	2023-09-08 13:19:06.56354+00	
00000000-0000-0000-0000-000000000000	6d31dc57-37fd-4c98-8f5c-b009d9234a3f	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-08 13:25:50.020682+00	
00000000-0000-0000-0000-000000000000	96a5140c-dc5d-4efd-9156-70db7bbd9e9d	{"action":"logout","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account"}	2023-09-08 13:26:53.201944+00	
00000000-0000-0000-0000-000000000000	07a39202-c93d-4539-9ac5-d3b61cda49e2	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-08 13:27:05.714257+00	
00000000-0000-0000-0000-000000000000	31a37609-14c6-4d2e-84bc-3dc19c9f8e8e	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-09-08 13:27:18.761977+00	
00000000-0000-0000-0000-000000000000	d727c31d-1f66-4cea-877f-bdc0556a9918	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-13 14:34:25.187695+00	
00000000-0000-0000-0000-000000000000	cabbabc2-8f1c-4782-925a-04fdddcad868	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-14 16:45:50.925691+00	
00000000-0000-0000-0000-000000000000	c5945f92-be09-4eeb-95aa-fdc557f0ccde	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-14 16:45:50.926465+00	
00000000-0000-0000-0000-000000000000	6bb891dd-b9ca-43bb-9572-a56e5e7541e2	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-15 17:25:38.832542+00	
00000000-0000-0000-0000-000000000000	1e460d87-e5f0-4b8a-94c2-27417ef058bb	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-15 17:25:38.833172+00	
00000000-0000-0000-0000-000000000000	a02f9328-e99a-4a03-afa9-a63e925f21db	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-15 21:56:29.897384+00	
00000000-0000-0000-0000-000000000000	2cec7900-e407-43af-877e-400db2519f76	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-15 21:56:29.898004+00	
00000000-0000-0000-0000-000000000000	8dc31ee3-f872-4811-9e14-fe0056da0f63	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-21 16:09:00.459569+00	
00000000-0000-0000-0000-000000000000	265bc14d-c7d1-4399-908f-05dfaf0da75a	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-21 16:09:00.473192+00	
00000000-0000-0000-0000-000000000000	4ccf39be-e4e0-4528-9457-2bb305bf333a	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-21 20:28:44.775413+00	
00000000-0000-0000-0000-000000000000	ffbc4614-046c-47c7-a0b2-3b9dbfbdf8b4	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-21 20:28:44.77696+00	
00000000-0000-0000-0000-000000000000	bcc67310-7370-4fca-9906-bb96f03c16f5	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-22 14:56:47.822866+00	
00000000-0000-0000-0000-000000000000	3a36ac1e-275d-4c0f-bee2-8d878ad6fbba	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-22 14:56:47.824632+00	
00000000-0000-0000-0000-000000000000	9dbe7cd1-9c0b-4883-ab51-ef4d045a4f6f	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-09-22 15:01:43.326118+00	
00000000-0000-0000-0000-000000000000	d37b5a7a-b705-4bb6-9706-deee08444b15	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-22 21:36:14.0461+00	
00000000-0000-0000-0000-000000000000	0e3e909a-75a0-45a9-a8d0-247160b4f9f9	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-22 21:36:14.04759+00	
00000000-0000-0000-0000-000000000000	170c1e1d-0fda-458d-afec-bf70d627847b	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-26 17:37:53.865079+00	
00000000-0000-0000-0000-000000000000	8b62bd3f-7b56-4be8-9978-795cb465ecbf	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-26 17:37:53.867302+00	
00000000-0000-0000-0000-000000000000	65ee8707-e51c-4cfa-aabc-56ea74064abb	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-26 18:49:42.666534+00	
00000000-0000-0000-0000-000000000000	a5778a96-4ae1-46e6-8be9-50bc72f4f774	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-26 18:49:42.667925+00	
00000000-0000-0000-0000-000000000000	1cc98d58-187c-4af1-8a8b-38d00c7d80e3	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-27 06:08:07.116436+00	
00000000-0000-0000-0000-000000000000	8034959c-ab14-4623-ab96-a921ccd6d467	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-27 06:08:07.117692+00	
00000000-0000-0000-0000-000000000000	13612d52-12a6-44f1-b4c4-c7376fd7a210	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-29 12:22:48.436983+00	
00000000-0000-0000-0000-000000000000	ba79adc2-2dc7-4037-aaba-6a9003331257	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-29 12:22:48.439173+00	
00000000-0000-0000-0000-000000000000	feed4863-55bf-44ba-9fb3-89eea578c51a	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-29 13:30:06.465526+00	
00000000-0000-0000-0000-000000000000	83179ff1-246f-4e91-8e0d-7a76eb19d172	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-29 13:30:06.468219+00	
00000000-0000-0000-0000-000000000000	d94e2465-9677-4e17-a0e4-90756fd1d9ab	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-29 16:47:26.303766+00	
00000000-0000-0000-0000-000000000000	798bfd27-0053-4592-a107-28acbd34485e	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-29 16:47:26.305016+00	
00000000-0000-0000-0000-000000000000	8851dcaf-4df2-43ca-b17f-1dea484c2cf0	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-29 19:00:17.948022+00	
00000000-0000-0000-0000-000000000000	a8fe9b75-0ddf-4cd3-a184-4b050031411e	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-29 19:00:17.94866+00	
00000000-0000-0000-0000-000000000000	75c6f087-6f04-4471-8706-5e5cd8c3b14a	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-30 14:33:46.958328+00	
00000000-0000-0000-0000-000000000000	c6d8757f-7459-4793-94ee-19380e7b0363	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-09-30 14:33:46.95967+00	
00000000-0000-0000-0000-000000000000	9b3c7461-28ba-498e-a84a-0a9760e9bfcd	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-30 15:16:48.595413+00	
00000000-0000-0000-0000-000000000000	59bf5643-7b06-4e15-8050-284c2997321c	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-09-30 15:16:48.595977+00	
00000000-0000-0000-0000-000000000000	0e212078-544f-4c77-9d5e-c6cf6c5f69f6	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-10-01 09:11:44.963782+00	
00000000-0000-0000-0000-000000000000	28cf0549-7b73-4303-909d-194d14c8629a	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-10-01 09:11:44.96503+00	
00000000-0000-0000-0000-000000000000	0334663a-be00-4e6c-8877-2b7c2d4809ab	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-10-01 09:11:46.249546+00	
00000000-0000-0000-0000-000000000000	e0d27d1c-3d9f-43d4-a3c5-9c161c33add2	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-01 14:19:37.475199+00	
00000000-0000-0000-0000-000000000000	4b87a88e-193e-4d7b-a19d-c150be2b2955	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-01 14:19:37.475819+00	
00000000-0000-0000-0000-000000000000	f8031004-2934-41e4-a0d7-5e682d38a33d	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-01 19:15:38.700474+00	
00000000-0000-0000-0000-000000000000	1fbcec98-a548-4016-a06b-f18662840b2a	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-01 19:15:38.701034+00	
00000000-0000-0000-0000-000000000000	d0731196-2d97-49de-ad84-b417a08e1579	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-01 20:41:19.529248+00	
00000000-0000-0000-0000-000000000000	c9f10a4a-9ebe-4e8f-82d1-3f7c1f99930f	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-01 20:41:19.530663+00	
00000000-0000-0000-0000-000000000000	1c60d506-e549-494b-bd9a-c5833a793e7a	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-02 12:54:38.355108+00	
00000000-0000-0000-0000-000000000000	9b99c7ca-58dd-466a-9e49-9a477d0a5d21	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-02 12:54:38.35571+00	
00000000-0000-0000-0000-000000000000	310b039d-7fd4-46fc-a567-75931bb1f2f2	{"action":"user_confirmation_requested","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-10-02 13:04:56.381191+00	
00000000-0000-0000-0000-000000000000	07e91f5b-d8e2-49c1-88d9-58f5b92d952d	{"action":"user_signedup","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"team"}	2023-10-02 13:05:05.523156+00	
00000000-0000-0000-0000-000000000000	f8cba128-e1a6-493d-944c-b1a617ab78cb	{"action":"token_refreshed","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-02 17:34:41.553383+00	
00000000-0000-0000-0000-000000000000	45f49b05-f72c-4f82-a86b-484db9760013	{"action":"token_revoked","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-02 17:34:41.554996+00	
00000000-0000-0000-0000-000000000000	bfe69908-db4a-479d-ab23-42adfd557c10	{"action":"token_refreshed","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-02 19:23:19.568846+00	
00000000-0000-0000-0000-000000000000	db0788aa-09cb-4034-8bae-e8326159d646	{"action":"token_revoked","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-02 19:23:19.571704+00	
00000000-0000-0000-0000-000000000000	d3b85620-9107-4c20-b2dc-86ad508d8772	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-02 21:20:07.266598+00	
00000000-0000-0000-0000-000000000000	3b87a730-9fb7-4f99-840c-24ca22657705	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-02 21:20:07.268173+00	
00000000-0000-0000-0000-000000000000	61665001-f951-49ac-a58b-95cd9127d97c	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-05 16:12:32.584778+00	
00000000-0000-0000-0000-000000000000	efb63699-4e03-4e9f-9f3b-f5435e6fdc00	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-05 16:12:32.590927+00	
00000000-0000-0000-0000-000000000000	8cb68a4b-8b0f-4a72-8a5d-dc6abb9c4cdb	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-05 18:44:03.215825+00	
00000000-0000-0000-0000-000000000000	b1cdecf2-36f5-48f5-98aa-b61121bd1461	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-05 18:44:03.218587+00	
00000000-0000-0000-0000-000000000000	4b63456e-8193-4003-a2bb-c7460febb135	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-06 13:47:33.402111+00	
00000000-0000-0000-0000-000000000000	770a28f7-8725-4b22-a949-8af1ceeed508	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-06 13:47:33.40371+00	
00000000-0000-0000-0000-000000000000	b6316170-cd6d-44fb-b490-909976917070	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-09 16:09:51.672723+00	
00000000-0000-0000-0000-000000000000	f5896447-739b-48ed-8865-8ed818cbb5eb	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-09 16:09:51.675475+00	
00000000-0000-0000-0000-000000000000	5ed57359-5384-46f2-88bd-f57f48279d05	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-10 16:04:55.245067+00	
00000000-0000-0000-0000-000000000000	784e6994-9d08-491d-85ea-ea6fbd5953cb	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-10 16:04:55.246133+00	
00000000-0000-0000-0000-000000000000	3b2cb688-35d7-46ae-8211-9c9772cb4e80	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-11 10:17:29.730636+00	
00000000-0000-0000-0000-000000000000	96559a18-0d77-4c16-b51a-14826a5504ff	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-11 10:17:29.732089+00	
00000000-0000-0000-0000-000000000000	fda5e807-fa52-421b-8198-cd3a17bb943f	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-11 19:07:54.015757+00	
00000000-0000-0000-0000-000000000000	c0abbee3-ebaf-4286-8afa-8a387f98b0fb	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-11 19:07:54.017661+00	
00000000-0000-0000-0000-000000000000	a7cc3278-ef49-4d60-998b-da15dab21865	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-12 06:45:09.699221+00	
00000000-0000-0000-0000-000000000000	a7b370d2-f8e1-4622-86c4-faba484a916c	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-12 06:45:09.700489+00	
00000000-0000-0000-0000-000000000000	4bae8264-f769-424c-88ec-e202d44c0d67	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-14 12:50:19.730211+00	
00000000-0000-0000-0000-000000000000	3305665d-5c89-499d-a08a-e5e0d2d2bdcc	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-14 12:50:19.7318+00	
00000000-0000-0000-0000-000000000000	a8f000bf-c74d-4f83-aef6-0244c63e7f11	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-15 17:26:00.085289+00	
00000000-0000-0000-0000-000000000000	fd5251e2-877e-4dc9-811d-307b445c4d1a	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-15 17:26:00.088652+00	
00000000-0000-0000-0000-000000000000	db11527a-9647-41db-8fff-e0ac9e18969c	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-16 18:46:20.741735+00	
00000000-0000-0000-0000-000000000000	0be76f8c-ccf0-4dd0-a5bf-74e765f73de0	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-16 18:46:20.74242+00	
00000000-0000-0000-0000-000000000000	74e0f904-0f8c-47ad-9853-a537c783ca9f	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-10-18 07:47:45.474661+00	
00000000-0000-0000-0000-000000000000	6c75ab23-a69e-4393-b08f-9be1f86400bf	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-18 09:43:01.62409+00	
00000000-0000-0000-0000-000000000000	64a65817-4008-4f0e-9fe1-602272a8683b	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-18 09:43:01.625983+00	
00000000-0000-0000-0000-000000000000	4af7378a-6198-44f6-9320-443a1eb36efd	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-18 14:00:59.647499+00	
00000000-0000-0000-0000-000000000000	49634125-a4ba-4b16-a818-50734ef903c4	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-18 14:00:59.649063+00	
00000000-0000-0000-0000-000000000000	af9f83d5-b95d-4988-b27e-2dce1ea9914f	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-10-18 14:05:30.194783+00	
00000000-0000-0000-0000-000000000000	a4cda303-59d4-440a-8e29-72308ffad07a	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-10-18 14:05:56.417881+00	
00000000-0000-0000-0000-000000000000	64a5f059-eb78-437c-b830-b5b5b504ba1b	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-18 20:34:47.774446+00	
00000000-0000-0000-0000-000000000000	82d891aa-8ff5-4ea0-9c03-8b7b18915342	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-18 20:34:47.776921+00	
00000000-0000-0000-0000-000000000000	af46e338-a7f1-405f-a801-0ad848544867	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-19 05:40:26.155489+00	
00000000-0000-0000-0000-000000000000	2508c63d-3cfa-4240-9913-589515a51b22	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-19 05:40:26.157958+00	
00000000-0000-0000-0000-000000000000	8c9c122c-3794-4aa8-b6b1-274b491d4126	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-19 16:05:32.311114+00	
00000000-0000-0000-0000-000000000000	f0e8377a-d18a-462a-8c3d-43d75d372eab	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-19 16:05:32.312687+00	
00000000-0000-0000-0000-000000000000	d4d5eeec-39bd-4900-b3a8-27755349d454	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-19 17:32:11.784875+00	
00000000-0000-0000-0000-000000000000	1c0038bc-69b0-4d68-b1f5-97ba451c7a9e	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-19 17:32:11.786133+00	
00000000-0000-0000-0000-000000000000	86617e09-56b0-4666-a9dd-1b02ac1f998c	{"action":"login","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-10-19 17:34:42.906618+00	
00000000-0000-0000-0000-000000000000	0b290ccd-089e-47c9-a35b-befcd2455e02	{"action":"token_refreshed","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-19 20:20:07.852309+00	
00000000-0000-0000-0000-000000000000	0a249992-b1e5-43a1-9370-14b21412773c	{"action":"token_revoked","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-19 20:20:07.856814+00	
00000000-0000-0000-0000-000000000000	169e27bb-14d5-47f6-aa1e-6d30ec6665ad	{"action":"token_refreshed","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 05:35:59.988666+00	
00000000-0000-0000-0000-000000000000	de8b67c7-d25c-4feb-b567-1e0a8177d379	{"action":"token_revoked","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 05:35:59.990445+00	
00000000-0000-0000-0000-000000000000	7bce8d25-f3aa-4557-b857-39dfe8edc4e0	{"action":"token_refreshed","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 06:48:01.633841+00	
00000000-0000-0000-0000-000000000000	421c0a7c-8f28-4dfb-bb1a-b7822d3083b1	{"action":"token_revoked","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 06:48:01.635957+00	
00000000-0000-0000-0000-000000000000	bbd2cf69-032b-4d23-ac73-c0878fe53623	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 08:57:18.649337+00	
00000000-0000-0000-0000-000000000000	77ee1ae5-1b5c-4b2e-af9e-9982776e3960	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 08:57:18.651311+00	
00000000-0000-0000-0000-000000000000	d4e6b6de-636c-409e-a546-ce41ebad8bdd	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 12:19:01.663223+00	
00000000-0000-0000-0000-000000000000	1b97fa67-b2bd-44fe-98be-226ff33035cc	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 12:19:01.663871+00	
00000000-0000-0000-0000-000000000000	a2065b82-ba2b-44ed-b7c6-9706d16201a7	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 16:28:17.613123+00	
00000000-0000-0000-0000-000000000000	c9800b21-d6b6-4eb4-9112-3fa1c15625ea	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 16:28:17.614854+00	
00000000-0000-0000-0000-000000000000	28f22fbc-c2e6-47df-b5d4-b3c48448d6df	{"action":"token_refreshed","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 18:04:28.706573+00	
00000000-0000-0000-0000-000000000000	e609f518-7977-423d-b0a1-f52a31db4024	{"action":"token_revoked","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 18:04:28.709591+00	
00000000-0000-0000-0000-000000000000	3fea8fbf-f0a3-4689-bca3-9e695f73bac4	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-10-20 19:26:10.997589+00	
00000000-0000-0000-0000-000000000000	442da0ca-3530-46a5-822d-445929ce5ddb	{"action":"token_refreshed","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 20:32:38.412536+00	
00000000-0000-0000-0000-000000000000	978e32e6-6144-4469-b633-e3e95c315f93	{"action":"token_revoked","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"token"}	2023-10-20 20:32:38.414404+00	
00000000-0000-0000-0000-000000000000	b1500e03-4b03-4ed5-9d48-e9410650c6a5	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-10-20 20:32:55.363722+00	
00000000-0000-0000-0000-000000000000	d3c8fbec-1968-43c8-8bfe-a68e6aa9442d	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-10-22 17:53:32.297696+00	
00000000-0000-0000-0000-000000000000	09af2243-3693-456b-a180-72af822b466a	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-10-22 17:53:36.826372+00	
00000000-0000-0000-0000-000000000000	0a19e9f1-cb63-43ec-9f96-640834851674	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-10-22 17:54:02.548122+00	
00000000-0000-0000-0000-000000000000	a48a85ec-c492-43b2-8056-97a299f0477b	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-27 08:49:59.68476+00	
00000000-0000-0000-0000-000000000000	60596e3d-1385-4596-90ca-86d67b991362	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-27 08:49:59.688675+00	
00000000-0000-0000-0000-000000000000	515b7953-4c85-44f7-be9c-c4f0bc97d7ad	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-27 16:34:43.878981+00	
00000000-0000-0000-0000-000000000000	c3e66ec2-5c2f-40f6-a1f8-0677119842ac	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-10-27 16:34:43.881354+00	
00000000-0000-0000-0000-000000000000	d353309b-8881-40e0-a4f5-1b1a494d5daf	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 08:18:46.169679+00	
00000000-0000-0000-0000-000000000000	46dc5d44-ad8d-4d9b-b3ab-d11ad4d94eec	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 08:18:46.176199+00	
00000000-0000-0000-0000-000000000000	b89e4af6-f077-4a1c-bcfe-8557cafbc831	{"action":"login","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-10 08:20:36.766273+00	
00000000-0000-0000-0000-000000000000	21910a42-ca84-45c9-adc7-cae572e8616e	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 09:28:23.548331+00	
00000000-0000-0000-0000-000000000000	2e2d68f5-7574-460a-93bb-965c4643d568	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 09:28:23.550295+00	
00000000-0000-0000-0000-000000000000	c94fbacd-c09b-4126-917f-69fd3819ae81	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-10 09:28:36.989494+00	
00000000-0000-0000-0000-000000000000	431c159a-5b32-4596-8aa8-42fc267b775e	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 11:55:45.625235+00	
00000000-0000-0000-0000-000000000000	36e12daa-64dc-418d-8f5c-3eb85649f5bc	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 11:55:45.627892+00	
00000000-0000-0000-0000-000000000000	1efe919c-4956-4434-8006-ca53446ef317	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 14:50:02.185464+00	
00000000-0000-0000-0000-000000000000	af2ddce8-6440-428d-bf35-1fb82a5b21f1	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 14:50:02.19129+00	
00000000-0000-0000-0000-000000000000	93210191-ddd6-4ea8-bd1c-e34ecc3fc314	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 17:30:24.888443+00	
00000000-0000-0000-0000-000000000000	06c9528a-fcab-4a98-a722-98960d758b50	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 17:30:24.88904+00	
00000000-0000-0000-0000-000000000000	0f58959f-a3bb-4055-9b50-e5aa16152596	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 19:48:13.530469+00	
00000000-0000-0000-0000-000000000000	ecf47899-ec19-48a4-8c24-02b9fdbc4657	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 19:48:13.544212+00	
00000000-0000-0000-0000-000000000000	53ae5027-9f71-46da-ac53-088175879dfa	{"action":"logout","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account"}	2023-11-10 20:08:09.981581+00	
00000000-0000-0000-0000-000000000000	18855522-e832-4fdb-afdc-259703d689fb	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-10 20:08:19.387311+00	
00000000-0000-0000-0000-000000000000	41f82e49-b3d9-4e70-8445-1c5ce2b3b30a	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-10 20:11:57.04095+00	
00000000-0000-0000-0000-000000000000	5f75efcc-852e-48f2-b911-e6a73b2f411e	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-11-10 20:12:04.590457+00	
00000000-0000-0000-0000-000000000000	013d853b-e0af-440a-b7f4-beae5f312db1	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-10 20:12:32.182482+00	
00000000-0000-0000-0000-000000000000	231b228b-0df3-4f3c-bc8b-cb30597fc622	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 22:03:56.257278+00	
00000000-0000-0000-0000-000000000000	dd1d9b3d-2e9e-439a-8fd2-c0d068ef4f3c	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 22:03:56.259457+00	
00000000-0000-0000-0000-000000000000	962136e9-20aa-4bb2-89e9-a76e3603b669	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 22:03:56.278096+00	
00000000-0000-0000-0000-000000000000	89632f4f-f676-4ce5-a9c6-c8905743e524	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-10 22:03:56.279046+00	
00000000-0000-0000-0000-000000000000	53e4bff7-0c50-444d-b7a5-5f5fe58b6ad7	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-11 16:49:56.858754+00	
00000000-0000-0000-0000-000000000000	56ea1864-4b2c-4e86-a2ac-753781afccb0	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-11 16:49:56.861619+00	
00000000-0000-0000-0000-000000000000	69450e4a-6aef-4c9a-9728-0f573f76d454	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-17 16:14:02.629827+00	
00000000-0000-0000-0000-000000000000	95894762-e4ea-4425-957e-a270f5551510	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-17 16:14:02.636054+00	
00000000-0000-0000-0000-000000000000	00ce8885-abd3-4f36-b66d-b7d5f98aea15	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-19 12:18:36.147363+00	
00000000-0000-0000-0000-000000000000	8163d7c0-c1db-43be-b698-a6fea94b4656	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-19 12:18:36.152118+00	
00000000-0000-0000-0000-000000000000	9622153f-462b-4e16-bde1-2936e329655a	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-19 13:45:52.493282+00	
00000000-0000-0000-0000-000000000000	f313d9d5-f236-4fbe-933c-d70312b0092b	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-19 13:45:52.495979+00	
00000000-0000-0000-0000-000000000000	5f98acb6-51e0-4a26-8f38-da3d9a9efb57	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-21 11:03:26.76102+00	
00000000-0000-0000-0000-000000000000	f78a1005-d61e-43f6-893f-67f6ee60a7cc	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-21 11:03:26.76651+00	
00000000-0000-0000-0000-000000000000	3317e92e-096c-48cc-a639-1a6ea6da82ed	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-21 11:03:36.3156+00	
00000000-0000-0000-0000-000000000000	016d38f2-9fb5-4c90-bfa5-a6979cc31ad5	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-21 11:03:36.31622+00	
00000000-0000-0000-0000-000000000000	9a6d7021-eaeb-4e98-8011-205adedc919f	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-24 10:16:16.486406+00	
00000000-0000-0000-0000-000000000000	3df31f65-f3ce-4425-9eac-f91baff0dfd2	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-24 10:16:16.490801+00	
00000000-0000-0000-0000-000000000000	d3e95632-fd0b-4b69-b40c-1f56bf86eb2d	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-24 15:57:38.353105+00	
00000000-0000-0000-0000-000000000000	b6c4b80f-646e-4dcb-879f-9848e89b4b18	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-24 15:57:38.355399+00	
00000000-0000-0000-0000-000000000000	34092112-a85e-4340-8222-14fc8cc7ff0c	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-24 17:43:00.667689+00	
00000000-0000-0000-0000-000000000000	d1d20aa4-11fc-4f82-999e-0d1d29dc4aa2	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-24 17:43:00.669616+00	
00000000-0000-0000-0000-000000000000	5575973f-d610-40bd-b1b7-55e011fb8b71	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-26 18:54:44.873876+00	
00000000-0000-0000-0000-000000000000	d7abe7de-8bb4-4bad-93de-5097fe253994	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-26 18:54:44.879254+00	
00000000-0000-0000-0000-000000000000	69fc93dc-b6fb-4508-bc10-46c557e2c5b2	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-27 06:38:42.974523+00	
00000000-0000-0000-0000-000000000000	14f391f7-d7e2-4bef-853b-cc6db35edd7a	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-11-27 06:38:42.977412+00	
00000000-0000-0000-0000-000000000000	c18ef5ab-bfc3-46c3-b04c-78070d691331	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 07:47:30.201003+00	
00000000-0000-0000-0000-000000000000	8b565f25-33a5-4753-a3b9-30f2bb193e7c	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 07:47:30.207471+00	
00000000-0000-0000-0000-000000000000	0ccc6c78-f900-42ea-9478-f7048ee66434	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 08:48:52.686538+00	
00000000-0000-0000-0000-000000000000	cbb6e98c-5703-4263-aac3-d85332422175	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 08:48:52.689301+00	
00000000-0000-0000-0000-000000000000	d6c3f44a-b820-42cb-99f5-c391d6999b63	{"action":"logout","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account"}	2023-12-01 08:49:00.793062+00	
00000000-0000-0000-0000-000000000000	1a71fead-2d3c-4f5a-be40-57381d74241e	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 08:49:12.728452+00	
00000000-0000-0000-0000-000000000000	f4b6aade-3b30-4800-a662-7ccf550afb79	{"action":"logout","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account"}	2023-12-01 08:49:15.199014+00	
00000000-0000-0000-0000-000000000000	43708ba3-3eb1-4b36-93a8-f3c068ca23fd	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 08:49:19.924238+00	
00000000-0000-0000-0000-000000000000	35cf748b-27d7-4f7f-87ff-1f57356d8a41	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-12-01 08:49:35.273443+00	
00000000-0000-0000-0000-000000000000	a69032fa-ec53-4a12-871b-eb7e6e3ae389	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 08:49:38.615116+00	
00000000-0000-0000-0000-000000000000	a42b7d92-0279-47e1-8f3c-75fc2302e4cc	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 10:54:22.754995+00	
00000000-0000-0000-0000-000000000000	a8544769-cfb3-4eb2-88fe-c73e5a9b69a0	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 10:54:22.756483+00	
00000000-0000-0000-0000-000000000000	1b358d72-23e5-48b4-bb7f-31ed375f3215	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 14:20:27.015504+00	
00000000-0000-0000-0000-000000000000	4e031534-aa86-4184-8117-e454115e9659	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 14:20:27.018146+00	
00000000-0000-0000-0000-000000000000	584964f5-8808-4217-ac50-dc0c45053897	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 14:23:34.180926+00	
00000000-0000-0000-0000-000000000000	f9c7211d-478d-46d9-8449-35229fde117e	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 14:25:42.593122+00	
00000000-0000-0000-0000-000000000000	d6ce985a-609f-45ff-929b-b5f042b2937f	{"action":"login","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 15:13:20.281831+00	
00000000-0000-0000-0000-000000000000	d9d3a6f0-9c56-4217-a222-d323d1265b6e	{"action":"logout","actor_id":"8651fc35-cc34-4209-a1b7-bbf5d3845ebc","actor_username":"schaefer@synyx.de","actor_via_sso":false,"log_type":"account"}	2023-12-01 15:13:34.315995+00	
00000000-0000-0000-0000-000000000000	ae9836bb-ab13-4ec6-be59-669b88aabaf5	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 15:13:41.551107+00	
00000000-0000-0000-0000-000000000000	864819ea-49e1-493b-b0cf-00328d5b7b18	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 16:18:13.881023+00	
00000000-0000-0000-0000-000000000000	0a386f53-135a-4ee1-b9fd-98afcba03b65	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 16:18:13.884367+00	
00000000-0000-0000-0000-000000000000	318b99b4-e58f-490c-a948-42f7fa830440	{"action":"logout","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account"}	2023-12-01 16:18:35.95832+00	
00000000-0000-0000-0000-000000000000	e9105557-4237-4483-8c2b-721139246431	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 16:18:47.134688+00	
00000000-0000-0000-0000-000000000000	07c863d7-91bf-4ab6-a010-09a0fedd08a8	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 17:25:53.047139+00	
00000000-0000-0000-0000-000000000000	b51997b7-fac1-4b1d-8b90-8009a2ba7be7	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 17:25:53.050456+00	
00000000-0000-0000-0000-000000000000	d0e82559-b9eb-4a6d-adb9-59188f805164	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-01 18:35:49.260025+00	
00000000-0000-0000-0000-000000000000	1c8fcce3-df4f-4837-8299-ab1a62031a2c	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 20:01:21.37709+00	
00000000-0000-0000-0000-000000000000	75b4433c-63d6-42a2-acce-878ea234e5e3	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-01 20:01:21.380437+00	
00000000-0000-0000-0000-000000000000	3a661e11-4461-45d6-b534-c88b904c0a20	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-03 13:28:37.223034+00	
00000000-0000-0000-0000-000000000000	23b35795-11ac-466c-a5d2-4459100fc0de	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-03 13:28:37.228059+00	
00000000-0000-0000-0000-000000000000	23fd8d90-f9e6-4985-bacd-1facb5ab5dd3	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-04 19:25:48.797179+00	
00000000-0000-0000-0000-000000000000	86541873-b9a1-4688-820f-1b382ef9ea9e	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-04 19:25:48.79928+00	
00000000-0000-0000-0000-000000000000	314a3bf7-6bb0-4fc6-8164-2aeb94fd399b	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-05 06:56:47.577191+00	
00000000-0000-0000-0000-000000000000	1f094000-a8ca-4e5c-9f2e-1c06198ec185	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-05 06:56:47.578635+00	
00000000-0000-0000-0000-000000000000	b0b9c038-6cc4-4239-8336-273a7263b347	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-05 18:18:39.178438+00	
00000000-0000-0000-0000-000000000000	dc4c538b-2ad9-4e6d-9f4a-9bf962156d40	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-05 18:18:39.186512+00	
00000000-0000-0000-0000-000000000000	3e4061b5-320d-4111-b45c-cbb84f3543ff	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-12 11:47:55.404443+00	
00000000-0000-0000-0000-000000000000	fdac5ede-5df6-4d7b-bf28-12de477811cf	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-12 11:47:55.411499+00	
00000000-0000-0000-0000-000000000000	d28d24c5-36e7-40d2-aeba-7f5bf0328474	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-19 13:44:24.441411+00	
00000000-0000-0000-0000-000000000000	af0c48c8-5734-42ed-873a-d7e557ad41ad	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-19 13:44:24.447302+00	
00000000-0000-0000-0000-000000000000	3129ce7c-c5a1-46a5-b119-a892513a50d8	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-19 19:25:35.50588+00	
00000000-0000-0000-0000-000000000000	20cd9801-f909-403a-af93-65d024799123	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-19 19:25:35.508119+00	
00000000-0000-0000-0000-000000000000	a5c49d8c-5592-4ae0-a9c5-1e36f512d5c2	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 12:20:48.766489+00	
00000000-0000-0000-0000-000000000000	79cb22ee-48dd-433d-8b58-6ae57b2b16e7	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 12:20:48.76898+00	
00000000-0000-0000-0000-000000000000	0a12259e-8474-4b67-927f-a6d3fab5ba07	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-21 12:21:09.503944+00	
00000000-0000-0000-0000-000000000000	f1d7fe5c-5077-4703-b15e-c40eecc1df8c	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 14:05:20.185484+00	
00000000-0000-0000-0000-000000000000	a60ca9f3-42f0-4755-9ac1-ab179889a4fa	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 14:05:20.189339+00	
00000000-0000-0000-0000-000000000000	e114d69b-8742-47d1-94da-a803b186a776	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 14:09:45.847974+00	
00000000-0000-0000-0000-000000000000	5f94d41b-5dd3-4c25-825d-e7f0adb629cd	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 14:09:45.851492+00	
00000000-0000-0000-0000-000000000000	b0b51c7f-ce64-45ff-8618-106feb5332ab	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-21 14:10:19.740628+00	
00000000-0000-0000-0000-000000000000	e02b3569-d6dc-452b-a8c4-53e328e446cc	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 15:21:43.900453+00	
00000000-0000-0000-0000-000000000000	5f9e575b-fa38-4e81-8e12-45a1b0654d17	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 15:21:43.904202+00	
00000000-0000-0000-0000-000000000000	9f6f9d1d-8250-4188-930b-9e76c46e8008	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-12-21 15:21:52.910807+00	
00000000-0000-0000-0000-000000000000	80cb135b-d25c-4f80-b9d6-36931cf56979	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 15:22:04.92542+00	
00000000-0000-0000-0000-000000000000	4d453576-03f0-4a92-883d-86401707b0e0	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-21 15:22:04.926199+00	
00000000-0000-0000-0000-000000000000	47ac9a07-e37a-4a02-8499-6dc79052c5b2	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-22 06:12:27.720207+00	
00000000-0000-0000-0000-000000000000	6f59dbf2-d9e6-400d-909b-be869c81c001	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-22 06:12:27.723347+00	
00000000-0000-0000-0000-000000000000	7bd663e5-59af-4a1a-8349-276b64031acc	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-22 11:04:34.467594+00	
00000000-0000-0000-0000-000000000000	e112df5b-b223-46fb-a311-f59a6763f4ae	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-22 11:04:34.46994+00	
00000000-0000-0000-0000-000000000000	f123fb2d-ed11-4da0-9cf8-0380d41152a0	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-22 13:57:32.891921+00	
00000000-0000-0000-0000-000000000000	8abf75bc-6527-4860-ac25-166e2abb039f	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-22 13:57:32.894771+00	
00000000-0000-0000-0000-000000000000	5f471b9f-1879-4457-9228-82b01832a219	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-22 15:18:14.256371+00	
00000000-0000-0000-0000-000000000000	24e96cf0-0632-49d4-be0f-878f4e9d84fc	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-22 15:18:14.261306+00	
00000000-0000-0000-0000-000000000000	9d335ff3-4564-44bf-8293-9b27c9e166ca	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-24 12:59:33.996556+00	
00000000-0000-0000-0000-000000000000	a7cb80fb-a6eb-459a-8617-812c1007b979	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-24 12:59:34.004524+00	
00000000-0000-0000-0000-000000000000	e8854be8-2400-4764-bd98-ad5343460645	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-26 21:52:25.299185+00	
00000000-0000-0000-0000-000000000000	b3479c15-436e-457d-876a-f93485e78fbd	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-26 21:52:25.301692+00	
00000000-0000-0000-0000-000000000000	e2ed82f2-3912-47e2-9b97-7fc26b200260	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-28 13:47:27.238894+00	
00000000-0000-0000-0000-000000000000	479017e0-baa4-4da0-a309-da82b9e54c0a	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-28 13:47:27.244787+00	
00000000-0000-0000-0000-000000000000	98eb45c9-b9ec-4f97-a9bb-ce287eeefa3d	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-29 14:05:56.54805+00	
00000000-0000-0000-0000-000000000000	bd96a2c0-cecd-44d1-ab85-9bf4fc1a55ff	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-29 14:05:56.549367+00	
00000000-0000-0000-0000-000000000000	0f33cd86-0043-42ff-a055-1a816eba3fd1	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-29 14:07:05.655195+00	
00000000-0000-0000-0000-000000000000	a6dacd99-6272-48c7-8afc-e2b0859c1a58	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-29 14:07:05.65742+00	
00000000-0000-0000-0000-000000000000	d2629c96-2089-461f-a51f-26d12a4c3dd1	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-29 16:18:32.896132+00	
00000000-0000-0000-0000-000000000000	0bb6252e-0f8c-4f49-9589-15e86991dbd4	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-29 16:18:32.899124+00	
00000000-0000-0000-0000-000000000000	9adfd1a2-f786-406c-944e-ef51dd151c9a	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-29 22:51:44.428986+00	
00000000-0000-0000-0000-000000000000	0a2da744-9c49-4c8e-b6e9-928c71b2c172	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2023-12-29 22:51:44.433247+00	
00000000-0000-0000-0000-000000000000	bdedd39f-773a-4b9c-a7c5-c1e36176791a	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-03 19:01:55.335779+00	
00000000-0000-0000-0000-000000000000	2dfb97f4-d84a-4231-af30-e27eb9264139	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-03 19:01:55.338143+00	
00000000-0000-0000-0000-000000000000	80689fe0-3c88-4326-abeb-074bd53627b6	{"action":"logout","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account"}	2024-01-03 19:10:10.370948+00	
00000000-0000-0000-0000-000000000000	76cb969b-03c0-4532-a2e8-5332eb862328	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-03 19:10:20.14898+00	
00000000-0000-0000-0000-000000000000	529c5b38-6d2f-4d2b-9d42-052584bba5a8	{"action":"login","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-03 19:11:21.982762+00	
00000000-0000-0000-0000-000000000000	da703f93-9c00-4695-acdc-347f77c645e6	{"action":"login","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-03 19:11:41.706287+00	
00000000-0000-0000-0000-000000000000	c49f2a8b-12de-488b-adf0-810ab3dfdb8a	{"action":"logout","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"account"}	2024-01-03 19:11:54.359893+00	
00000000-0000-0000-0000-000000000000	5a001d85-f62c-4287-9c95-4e7720828efa	{"action":"login","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-03 19:11:59.456234+00	
00000000-0000-0000-0000-000000000000	d4e92b9b-4339-481a-a62c-3c5d52693a54	{"action":"token_refreshed","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-04 17:58:33.799628+00	
00000000-0000-0000-0000-000000000000	56ea7ce6-a5b5-4ca8-aef2-d69a84f2d51c	{"action":"token_revoked","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-04 17:58:33.802712+00	
00000000-0000-0000-0000-000000000000	b8358a4d-9bdc-4b1a-b49f-428acb470840	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-05 07:12:14.092166+00	
00000000-0000-0000-0000-000000000000	bcbc6860-f7ec-4688-a878-84d2cc14b805	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-05 07:12:14.095599+00	
00000000-0000-0000-0000-000000000000	afcb1388-aa56-42b5-897e-44f0baf49e49	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-06 19:10:05.310824+00	
00000000-0000-0000-0000-000000000000	955f86b0-2993-4916-bb1c-f0bb354e5bfc	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-06 19:10:05.3143+00	
00000000-0000-0000-0000-000000000000	99ad9823-4778-43ad-b491-c2f57d556558	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-12 12:53:12.508007+00	
00000000-0000-0000-0000-000000000000	70f07535-3afb-4c98-b769-aa88ccaf7d16	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-12 12:53:12.512641+00	
00000000-0000-0000-0000-000000000000	40793cd0-4050-4df1-b210-b64cbb83bc31	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-13 18:59:56.535345+00	
00000000-0000-0000-0000-000000000000	2d5184c4-122f-4de0-8b3a-55f4ed437261	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-13 18:59:56.537734+00	
00000000-0000-0000-0000-000000000000	ddcbcef5-ad6f-424c-ab99-075f2c25ab92	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-14 18:54:03.039833+00	
00000000-0000-0000-0000-000000000000	49afd3d0-8735-40ba-90a6-9a449557ab8e	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-14 18:54:03.041691+00	
00000000-0000-0000-0000-000000000000	952b8ae9-7072-4170-955e-4b727dab4818	{"action":"token_refreshed","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-18 07:24:48.441419+00	
00000000-0000-0000-0000-000000000000	7dabac8c-a67d-4e1a-87c1-411b76dbed4f	{"action":"token_revoked","actor_id":"16406e41-34f8-427e-b837-3a48ae51c519","actor_username":"lea.brock1@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-18 07:24:48.449316+00	
00000000-0000-0000-0000-000000000000	96d8970d-6f10-4cc8-8ad8-a319989b7f86	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 10:36:46.685083+00	
00000000-0000-0000-0000-000000000000	4d483900-6fb2-4efc-b295-762e77bb8191	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 10:36:46.686696+00	
00000000-0000-0000-0000-000000000000	12eb20a3-1624-470d-b802-8d462cc262fb	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-19 10:37:15.976091+00	
00000000-0000-0000-0000-000000000000	80f02f8b-ae79-4271-bb75-c6cc87aed727	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-19 10:37:37.970933+00	
00000000-0000-0000-0000-000000000000	231cceae-8f78-46f4-a783-5a447345c213	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 11:43:17.802461+00	
00000000-0000-0000-0000-000000000000	ca943afd-2084-448d-a8f8-a48865203564	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 11:43:17.804119+00	
00000000-0000-0000-0000-000000000000	06387dd9-2039-466d-ab2b-278b6040f1f4	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 13:42:32.440759+00	
00000000-0000-0000-0000-000000000000	66372c21-90f6-4b84-9d71-ee0744d2b7db	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 13:42:32.442057+00	
00000000-0000-0000-0000-000000000000	26be65c0-e30c-494e-bf61-59af527bb94c	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 13:42:51.131265+00	
00000000-0000-0000-0000-000000000000	6a52184a-1c00-4cec-8f6f-bcf277ef81cc	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 13:42:51.132071+00	
00000000-0000-0000-0000-000000000000	d486a7de-8400-42fc-9803-60d628cff7b2	{"action":"logout","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account"}	2024-01-19 13:43:50.587893+00	
00000000-0000-0000-0000-000000000000	994f5ad5-e9f3-4cff-bbac-5e08e86dc0c3	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-19 13:44:00.287845+00	
00000000-0000-0000-0000-000000000000	5c685c2d-59af-4cae-9f13-82bb270917a0	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-19 15:22:53.345846+00	
00000000-0000-0000-0000-000000000000	336bb7b6-8445-4ffe-8648-aca7ca497249	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-19 15:49:14.897241+00	
00000000-0000-0000-0000-000000000000	4eb4fd30-7254-44da-ba28-6239b0887d48	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-19 17:24:22.559545+00	
00000000-0000-0000-0000-000000000000	4d35ded0-915d-4952-b5c6-7b4a3e3134e2	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 17:40:54.283936+00	
00000000-0000-0000-0000-000000000000	e3334355-7f19-457f-aef9-08c5e2780587	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 17:40:54.286212+00	
00000000-0000-0000-0000-000000000000	1db01087-dfda-4c8c-be32-5e02f261aa86	{"action":"login","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-19 17:57:38.686843+00	
00000000-0000-0000-0000-000000000000	bac7451b-6d16-48c5-924f-7d2b5638afe0	{"action":"token_refreshed","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 20:07:46.660249+00	
00000000-0000-0000-0000-000000000000	3ae6b553-4167-4477-921b-8bac27d9dcc3	{"action":"token_revoked","actor_id":"d669b21b-62c6-4d0f-8f76-40738e274c87","actor_username":"julian_schaefer93@web.de","actor_via_sso":false,"log_type":"token"}	2024-01-19 20:07:46.662666+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at") FROM stdin;
00000000-0000-0000-0000-000000000000	8651fc35-cc34-4209-a1b7-bbf5d3845ebc	authenticated	authenticated	schaefer@synyx.de	$2a$10$4jYr4Qn2dcG/ZLHESluDleDNszI9dhk5iGPRhtRKlvxv62gvnpMNO	2023-07-14 12:49:47.039601+00	\N		2023-07-14 12:49:33.62445+00		\N			\N	2023-12-01 15:13:20.286043+00	{"provider": "email", "providers": ["email"]}	{}	\N	2023-07-14 12:49:33.612205+00	2023-12-01 15:13:20.291716+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	d669b21b-62c6-4d0f-8f76-40738e274c87	authenticated	authenticated	julian_schaefer93@web.de	$2a$10$Tlc08EcExt/vbdn587TBv.sVq5DxeHLgIsnsGfoiO30VouRfL74de	2023-09-08 13:08:34.965872+00	\N		2023-09-08 13:08:10.643674+00		\N			\N	2024-01-19 17:57:38.688437+00	{"provider": "email", "providers": ["email"]}	{}	\N	2023-09-08 13:08:10.631374+00	2024-01-19 20:07:46.66522+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	16406e41-34f8-427e-b837-3a48ae51c519	authenticated	authenticated	lea.brock1@web.de	$2a$10$jD5ztuohh5DEFFHTkbADE./OY5LCdsMYD2pSYxs0wlkZSeCEedmiq	2023-10-02 13:05:05.523741+00	\N		2023-10-02 13:04:56.383588+00		\N			\N	2024-01-03 19:11:59.456976+00	{"provider": "email", "providers": ["email"]}	{}	\N	2023-10-02 13:04:56.346853+00	2024-01-18 07:24:48.474389+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	1ffadae7-b351-49a6-8ae5-7438a4cde093	authenticated	authenticated	charismatischriesigerotter@wegwerfemail.de	$2a$10$vAI1fIQlSDUcya6PFQilQuWVeVqBoFg38ClHmnrOJzgdEeL/Jb3ka	2023-09-08 13:19:06.564256+00	\N		2023-09-08 13:18:55.477359+00		\N			\N	2023-09-08 13:19:06.564986+00	{"provider": "email", "providers": ["email"]}	{}	\N	2023-09-08 13:18:55.471292+00	2023-09-08 13:19:06.567013+00	\N	\N			\N		0	\N		\N	f	\N
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
8651fc35-cc34-4209-a1b7-bbf5d3845ebc	8651fc35-cc34-4209-a1b7-bbf5d3845ebc	{"sub": "8651fc35-cc34-4209-a1b7-bbf5d3845ebc", "email": "schaefer@synyx.de"}	email	2023-07-14 12:49:33.621179+00	2023-07-14 12:49:33.62123+00	2023-07-14 12:49:33.62123+00	93f49b46-0aaa-4ba1-99dc-0dbb7393002d
d669b21b-62c6-4d0f-8f76-40738e274c87	d669b21b-62c6-4d0f-8f76-40738e274c87	{"sub": "d669b21b-62c6-4d0f-8f76-40738e274c87", "email": "julian_schaefer93@web.de"}	email	2023-09-08 13:08:10.64125+00	2023-09-08 13:08:10.641289+00	2023-09-08 13:08:10.641289+00	e54dd02a-53a0-4bb1-bdee-8fe1e0a95061
1ffadae7-b351-49a6-8ae5-7438a4cde093	1ffadae7-b351-49a6-8ae5-7438a4cde093	{"sub": "1ffadae7-b351-49a6-8ae5-7438a4cde093", "email": "charismatischriesigerotter@wegwerfemail.de"}	email	2023-09-08 13:18:55.473598+00	2023-09-08 13:18:55.473633+00	2023-09-08 13:18:55.473633+00	cb2a4d0f-2c86-4003-bba2-851b41e963f0
16406e41-34f8-427e-b837-3a48ae51c519	16406e41-34f8-427e-b837-3a48ae51c519	{"sub": "16406e41-34f8-427e-b837-3a48ae51c519", "email": "lea.brock1@web.de"}	email	2023-10-02 13:04:56.376306+00	2023-10-02 13:04:56.376358+00	2023-10-02 13:04:56.376358+00	e6a56bea-60b7-4503-bc9c-e191811fc823
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") FROM stdin;
a89a7079-8084-4d21-a7ff-092626059bfc	1ffadae7-b351-49a6-8ae5-7438a4cde093	2023-09-08 13:19:06.565048+00	2023-09-08 13:19:06.565048+00	\N	aal1	\N	\N	\N	\N	\N
180d1c39-2b1a-41c8-a277-a58f1958750f	16406e41-34f8-427e-b837-3a48ae51c519	2024-01-03 19:11:59.457061+00	2024-01-18 07:24:48.488133+00	\N	aal1	\N	2024-01-18 07:24:48.488042	Mozilla/5.0 (iPhone; CPU iPhone OS 17_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Mobile/15E148 Safari/604.1	46.223.162.197	\N
392f4a9a-d088-4f19-a7ac-79a3665ddd1b	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-19 15:22:53.349077+00	2024-01-19 15:22:53.349077+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:121.0) Gecko/20100101 Firefox/121.0	46.223.162.197	\N
c14157da-ef3f-4f1f-a487-3cdbfb566345	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-19 17:24:22.562875+00	2024-01-19 17:24:22.562875+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36	46.223.162.197	\N
00520f25-13ce-41a9-940c-2c0a2973c7f9	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-19 13:44:00.301932+00	2024-01-19 17:40:54.29204+00	\N	aal1	\N	2024-01-19 17:40:54.291964	Mozilla/5.0 (Android 14; Mobile; rv:121.0) Gecko/121.0 Firefox/121.0	46.223.162.197	\N
50285ba7-96a1-4d24-b512-69e54195d8bf	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-19 17:57:38.688512+00	2024-01-19 17:57:38.688512+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36	46.223.162.197	\N
9c02ec40-ccba-4fe0-b60a-4dfcfb246c33	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-19 15:49:14.899735+00	2024-01-19 20:07:46.666549+00	\N	aal1	\N	2024-01-19 20:07:46.666473	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:121.0) Gecko/20100101 Firefox/121.0	46.223.162.197	\N
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
a89a7079-8084-4d21-a7ff-092626059bfc	2023-09-08 13:19:06.567322+00	2023-09-08 13:19:06.567322+00	otp	25cd1bbc-95d3-4389-b8b6-be579552e3c0
180d1c39-2b1a-41c8-a277-a58f1958750f	2024-01-03 19:11:59.459146+00	2024-01-03 19:11:59.459146+00	password	c72638a4-cf81-4878-934a-4002cc777650
00520f25-13ce-41a9-940c-2c0a2973c7f9	2024-01-19 13:44:00.311265+00	2024-01-19 13:44:00.311265+00	password	6cf2846d-9227-40b2-9488-d5e451f459a8
392f4a9a-d088-4f19-a7ac-79a3665ddd1b	2024-01-19 15:22:53.358013+00	2024-01-19 15:22:53.358013+00	password	c37750d0-8f2d-430b-8f85-d88ddc02eded
9c02ec40-ccba-4fe0-b60a-4dfcfb246c33	2024-01-19 15:49:14.904246+00	2024-01-19 15:49:14.904246+00	password	50837e75-c7c0-450e-a33b-4be0ae88da3b
c14157da-ef3f-4f1f-a487-3cdbfb566345	2024-01-19 17:24:22.56791+00	2024-01-19 17:24:22.56791+00	password	acbe1f7b-71a3-4c46-9f4d-45c73b5c6636
50285ba7-96a1-4d24-b512-69e54195d8bf	2024-01-19 17:57:38.692345+00	2024-01-19 17:57:38.692345+00	password	ccd50c5e-43d6-4050-a9db-94484192bdba
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
00000000-0000-0000-0000-000000000000	153	Jq57uB6LFzBzFMoQYS7X1Q	16406e41-34f8-427e-b837-3a48ae51c519	t	2024-01-04 17:58:33.803806+00	2024-01-18 07:24:48.450791+00	irIfQ3RlRHrB1GhvlYOgMA	180d1c39-2b1a-41c8-a277-a58f1958750f
00000000-0000-0000-0000-000000000000	167	SiddY90vreJnE2Du5O-qiQ	d669b21b-62c6-4d0f-8f76-40738e274c87	f	2024-01-19 15:22:53.352854+00	2024-01-19 15:22:53.352854+00	\N	392f4a9a-d088-4f19-a7ac-79a3665ddd1b
00000000-0000-0000-0000-000000000000	169	wo-_ahi5R87AC2OmchwpZA	d669b21b-62c6-4d0f-8f76-40738e274c87	f	2024-01-19 17:24:22.564959+00	2024-01-19 17:24:22.564959+00	\N	c14157da-ef3f-4f1f-a487-3cdbfb566345
00000000-0000-0000-0000-000000000000	170	TNRfQEhrVqa7K9-tjCkK-A	d669b21b-62c6-4d0f-8f76-40738e274c87	f	2024-01-19 17:40:54.289486+00	2024-01-19 17:40:54.289486+00	UVUaGND-Ul8slKLb1Xl1mA	00520f25-13ce-41a9-940c-2c0a2973c7f9
00000000-0000-0000-0000-000000000000	171	9mAKhCahfvqio3kCMbtzJg	d669b21b-62c6-4d0f-8f76-40738e274c87	f	2024-01-19 17:57:38.689952+00	2024-01-19 17:57:38.689952+00	\N	50285ba7-96a1-4d24-b512-69e54195d8bf
00000000-0000-0000-0000-000000000000	168	uLI0Ifzhazu5FjNwnhuFZA	d669b21b-62c6-4d0f-8f76-40738e274c87	t	2024-01-19 15:49:14.902143+00	2024-01-19 20:07:46.663558+00	\N	9c02ec40-ccba-4fe0-b60a-4dfcfb246c33
00000000-0000-0000-0000-000000000000	172	is3YdSZUpebuxiXYQ_WdbQ	d669b21b-62c6-4d0f-8f76-40738e274c87	f	2024-01-19 20:07:46.664354+00	2024-01-19 20:07:46.664354+00	uLI0Ifzhazu5FjNwnhuFZA	9c02ec40-ccba-4fe0-b60a-4dfcfb246c33
00000000-0000-0000-0000-000000000000	19	jlM2zYUBslnZUvj40qeWtw	1ffadae7-b351-49a6-8ae5-7438a4cde093	f	2023-09-08 13:19:06.565885+00	2023-09-08 13:19:06.565885+00	\N	a89a7079-8084-4d21-a7ff-092626059bfc
00000000-0000-0000-0000-000000000000	152	irIfQ3RlRHrB1GhvlYOgMA	16406e41-34f8-427e-b837-3a48ae51c519	t	2024-01-03 19:11:59.45781+00	2024-01-04 17:58:33.803354+00	\N	180d1c39-2b1a-41c8-a277-a58f1958750f
00000000-0000-0000-0000-000000000000	159	H_Umiakvm5ms1sryHJXl0w	16406e41-34f8-427e-b837-3a48ae51c519	f	2024-01-18 07:24:48.462888+00	2024-01-18 07:24:48.462888+00	Jq57uB6LFzBzFMoQYS7X1Q	180d1c39-2b1a-41c8-a277-a58f1958750f
00000000-0000-0000-0000-000000000000	166	UVUaGND-Ul8slKLb1Xl1mA	d669b21b-62c6-4d0f-8f76-40738e274c87	t	2024-01-19 13:44:00.305337+00	2024-01-19 17:40:54.288398+00	\N	00520f25-13ce-41a9-940c-2c0a2973c7f9
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "from_ip_address", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY "pgsodium"."key" ("id", "status", "created", "expires", "key_type", "key_id", "key_context", "name", "associated_data", "raw_key", "raw_key_nonce", "parent_key", "comment", "user_data") FROM stdin;
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."recipes" ("created_at", "name", "description", "author_id", "id", "rating", "cooking_time") FROM stdin;
2023-10-15 17:26:20.69881+00	Apfelmus 	https://www.gutekueche.at/apfelmus-rezept-2387	d669b21b-62c6-4d0f-8f76-40738e274c87	5dd35ab3-1db3-4e86-bb60-d0f5173d43ac	5	\N
2023-11-24 17:44:12.266651+00	Tabouleh mit Halloumi		d669b21b-62c6-4d0f-8f76-40738e274c87	b82f73d0-a633-4814-9cad-705d17f3b9ba	0	\N
2023-11-26 18:55:59.734124+00	Tiramisu 😘		d669b21b-62c6-4d0f-8f76-40738e274c87	bab43296-4942-4c27-ab86-080382bb854d	5	\N
2023-10-02 12:55:19.170219+00	Lachsbowl 		d669b21b-62c6-4d0f-8f76-40738e274c87	c8adbd5f-8c69-4bbc-b6cc-3651201fb6fb	4	45
2023-09-14 16:46:18.178033+00	Schinken Käse Nudeln		d669b21b-62c6-4d0f-8f76-40738e274c87	e1d9631a-4f08-4932-bd98-b486827939e9	3	\N
2023-12-01 17:13:33.328202+00	Thunfisch mit Kartoffeln und Creme Fraiche Soße	https://www.gutekueche.de/creme-fraiche-sauce-rezept-22776	d669b21b-62c6-4d0f-8f76-40738e274c87	adfa5e66-0938-45c6-a563-f8b6cd909c8d	4	25
2023-11-10 17:30:47.122919+00	Geschnetzeltes 	Yummy	d669b21b-62c6-4d0f-8f76-40738e274c87	3c3e7a80-3392-4b38-b2f1-8dd5e2cb885e	0	\N
2024-01-03 19:02:23.444537+00	Feldsalat 		d669b21b-62c6-4d0f-8f76-40738e274c87	194973a3-2b2a-44a4-9bfc-d8dcdbd1ee0a	5	15
2023-10-02 17:36:17.461566+00	Kartoffelsuppe	Die Gute! 	16406e41-34f8-427e-b837-3a48ae51c519	92118b15-fb6d-4297-9397-8b7300407d82	5	30
2024-01-04 17:59:27.344744+00	Laugen-Petersilien-Knödel	mit Lauch-Spinat Gemüse	16406e41-34f8-427e-b837-3a48ae51c519	edfa475a-f47e-4a4a-a9e0-d42e4e2aec28	5	30
2024-01-06 19:10:45.421215+00	Dorade mit Kartoffeln		d669b21b-62c6-4d0f-8f76-40738e274c87	3451596f-199d-41dc-bbab-043deb983aa0	4	60
2024-01-13 19:00:55.893287+00	Kabeljau mit Karotten-Ingwer Stampf		d669b21b-62c6-4d0f-8f76-40738e274c87	d1d06965-d4cd-40b2-8a3e-a64e4cde9067	5	30
2024-01-14 18:54:36.392499+00	Kötbullar mit Kartoffelbrei		d669b21b-62c6-4d0f-8f76-40738e274c87	a98338fc-5c57-49e0-837e-35846200784b	5	75
2023-10-02 13:06:35.005633+00	Frankfurter Kranz	Yummy 🤤 \n	16406e41-34f8-427e-b837-3a48ae51c519	011d1041-b145-4a63-b6e7-bc661be46d04	0	\N
2023-10-02 13:32:20.281317+00	Buchweizen Halloumi Bowl		d669b21b-62c6-4d0f-8f76-40738e274c87	c758f714-8fbc-4b27-98a0-2bab880f679f	0	\N
2023-10-05 16:13:13.278187+00	Wildreis Bowl mit Lachs		d669b21b-62c6-4d0f-8f76-40738e274c87	9f3d3772-94f1-4c31-a7d1-e7d3150d048d	0	\N
2023-09-13 14:34:48.334+00	Brokkoli Farfalle		d669b21b-62c6-4d0f-8f76-40738e274c87	2ee15eb2-c89c-446c-bb9d-65b0843f2c40	0	\N
2023-10-14 12:51:39.787901+00	Hefezopf 		d669b21b-62c6-4d0f-8f76-40738e274c87	58012566-dafe-4435-8363-125e448c1b20	0	\N
2023-10-02 12:54:56.435397+00	Tartalle		d669b21b-62c6-4d0f-8f76-40738e274c87	5ebd022e-33ae-42e3-9fac-861fb95a9a54	0	\N
2023-10-22 17:55:04.303898+00	Amerikanischer Abend		d669b21b-62c6-4d0f-8f76-40738e274c87	a03d9213-d3ab-4e81-9b31-8ecb060a19f0	0	\N
2023-10-19 17:32:42.375325+00	Gulasch		d669b21b-62c6-4d0f-8f76-40738e274c87	81910a80-d46f-4018-857a-22ea7803afb9	0	\N
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") FROM stdin;
recipe_images	recipe_images	\N	2023-10-06 13:41:00.034428+00	2023-10-06 13:41:00.034428+00	t	f	\N	\N	\N
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id") FROM stdin;
21e3c45b-14b1-4d65-904a-832716700a03	recipe_images	a03d9213-d3ab-4e81-9b31-8ecb060a19f0/1000022711.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2023-10-22 17:55:38.199005+00	2023-10-22 17:55:51.778701+00	2023-10-22 17:55:38.199005+00	{"eTag": "\\"0d36f3301d3b3b2f3813e85eb4d67514\\"", "size": 2917510, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-10-22T17:55:52.000Z", "contentLength": 2917510, "httpStatusCode": 200}	d9a0d5cb-20f1-4e76-b0db-f17071eb8277	d669b21b-62c6-4d0f-8f76-40738e274c87
498ee7c8-fd4e-49ad-870c-5d0f165431cd	recipe_images	a03d9213-d3ab-4e81-9b31-8ecb060a19f0/1000022710.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2023-10-22 17:55:53.20294+00	2023-10-22 17:55:53.20294+00	2023-10-22 17:55:53.20294+00	{"eTag": "\\"e66754fedf3db11207878c5e78c8e664\\"", "size": 3124488, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-10-22T17:55:54.000Z", "contentLength": 3124488, "httpStatusCode": 200}	21219b44-f298-45c8-bc57-5b477bbee3e3	d669b21b-62c6-4d0f-8f76-40738e274c87
4a3cf1c4-8c05-4563-a98e-65ad495d553e	recipe_images	.emptyFolderPlaceholder	\N	2023-10-09 16:10:24.850042+00	2023-10-09 16:10:24.850042+00	2023-10-09 16:10:24.850042+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-10-09T16:10:25.000Z", "contentLength": 0, "httpStatusCode": 200}	f2074518-26c6-4640-aaae-cc9f6e76a3c1	\N
6f8be4e5-92a7-4791-8791-d33b387a5453	recipe_images	bab43296-4942-4c27-ab86-080382bb854d/2023-11-2619.55.36526367253480957612.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2023-11-26 18:56:20.488317+00	2023-11-26 18:56:20.488317+00	2023-11-26 18:56:20.488317+00	{"eTag": "\\"71a5ab63d8e57eda3476c5cd34e17e97\\"", "size": 1931117, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-11-26T18:56:21.000Z", "contentLength": 1931117, "httpStatusCode": 200}	bd2246ff-47de-4260-944b-fd665f87ddf3	d669b21b-62c6-4d0f-8f76-40738e274c87
ef4da6c7-a3f1-4a16-a2f1-e383583d9673	recipe_images	c8adbd5f-8c69-4bbc-b6cc-3651201fb6fb/1000021877.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2023-12-01 07:47:43.72003+00	2023-12-01 07:47:43.72003+00	2023-12-01 07:47:43.72003+00	{"eTag": "\\"2bf7ff0ba325b2854622728199ef37ed\\"", "size": 217981, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-12-01T07:47:44.000Z", "contentLength": 217981, "httpStatusCode": 200}	c8413e37-1c8e-4d49-9886-374c2fc1a9eb	d669b21b-62c6-4d0f-8f76-40738e274c87
fa153b46-3b15-4c7e-8b2e-0a2ae655776d	recipe_images	3c3e7a80-3392-4b38-b2f1-8dd5e2cb885e/1000023522.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2023-12-04 19:26:29.426452+00	2023-12-04 19:26:29.426452+00	2023-12-04 19:26:29.426452+00	{"eTag": "\\"b92273c7d5a36990d16b2d1bbcd14d95\\"", "size": 2224071, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-12-04T19:26:30.000Z", "contentLength": 2224071, "httpStatusCode": 200}	131e9cf2-87dd-45be-813c-8cdc3eaeb67a	d669b21b-62c6-4d0f-8f76-40738e274c87
db5ffecf-2899-48f6-b57f-758a52d400f7	recipe_images	61141753-3578-40ac-b6af-d1aac0546b98/.emptyFolderPlaceholder	\N	2023-10-18 14:02:26.904148+00	2023-10-18 14:02:26.904148+00	2023-10-18 14:02:26.904148+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-10-18T14:02:27.000Z", "contentLength": 0, "httpStatusCode": 200}	9e843498-44fd-4eda-9779-fb65fb870503	\N
a1622a5b-35e2-4a3e-b136-dede56776542	recipe_images	61141753-3578-40ac-b6af-d1aac0546b98/00ebf332-dd7c-49d5-a5c0-99167ef5c673.jpg	\N	2023-10-18 14:02:39.517711+00	2023-10-18 14:02:39.517711+00	2023-10-18 14:02:39.517711+00	{"eTag": "\\"d40e8c1eafd932bace2d2897c9c01273\\"", "size": 2322105, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-10-18T14:02:40.000Z", "contentLength": 2322105, "httpStatusCode": 200}	84ea6be8-e587-433b-8d22-2d885a5a93d8	\N
af2e09f3-3529-4de7-9440-8cbc8fe1e006	recipe_images	3c3e7a80-3392-4b38-b2f1-8dd5e2cb885e/1000024195.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2023-12-04 19:26:34.422771+00	2023-12-04 19:26:34.422771+00	2023-12-04 19:26:34.422771+00	{"eTag": "\\"9222ca480167143ae15473445073df33\\"", "size": 2582626, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-12-04T19:26:35.000Z", "contentLength": 2582626, "httpStatusCode": 200}	f977406b-69f5-4369-8ee3-942c9640bff1	d669b21b-62c6-4d0f-8f76-40738e274c87
a3fafbe4-6976-426b-89ba-269cf796d36c	recipe_images	58012566-dafe-4435-8363-125e448c1b20/15071039-e9da-4511-bd9d-038573fbd459.jpg	\N	2023-10-18 14:02:56.197175+00	2023-10-18 14:02:56.197175+00	2023-10-18 14:02:56.197175+00	{"eTag": "\\"e1b84aee2845d2de73c79973bb446c79\\"", "size": 2651976, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-10-18T14:02:56.000Z", "contentLength": 2651976, "httpStatusCode": 200}	ee0bb1e2-15bd-46b5-92df-bdd5dd449e03	\N
a6ec5422-8601-47cd-bf7b-a9f192c0258e	recipe_images	5ebd022e-33ae-42e3-9fac-861fb95a9a54/1000021879.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2023-10-18 14:17:27.183039+00	2023-10-18 14:17:27.183039+00	2023-10-18 14:17:27.183039+00	{"eTag": "\\"ed86a437d210fd2a5dfc6d4ce7285088\\"", "size": 244854, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-10-18T14:17:28.000Z", "contentLength": 244854, "httpStatusCode": 200}	d75a2c6c-f9ba-4b11-830e-1ca6f6b9eafd	d669b21b-62c6-4d0f-8f76-40738e274c87
d5f46f28-2f4b-427e-97e2-1d2806114e8a	recipe_images	92118b15-fb6d-4297-9397-8b7300407d82/IMG_0605.jpeg	16406e41-34f8-427e-b837-3a48ae51c519	2024-01-03 19:13:14.104668+00	2024-01-03 19:13:14.104668+00	2024-01-03 19:13:14.104668+00	{"eTag": "\\"da23bc254f30479d39570d56002467f9\\"", "size": 2314628, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2024-01-03T19:13:14.000Z", "contentLength": 2314628, "httpStatusCode": 200}	d308e2ee-3217-4502-8e10-5c683ef5065d	16406e41-34f8-427e-b837-3a48ae51c519
c8b40837-4b43-46e7-b707-823fc54a1a4f	recipe_images	5dd35ab3-1db3-4e86-bb60-d0f5173d43ac/fb1c5ffe-8e19-49f7-a103-08d16a822c57.jpg	\N	2023-10-18 14:04:18.075443+00	2023-10-18 14:04:18.075443+00	2023-10-18 14:04:18.075443+00	{"eTag": "\\"04238e43ef30e62143d12da5fabfd72f\\"", "size": 2079986, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-10-18T14:04:18.000Z", "contentLength": 2079986, "httpStatusCode": 200}	09efdf5e-48bb-4cad-993f-3ba415a9f855	\N
5582764d-6e8a-4b09-9456-afb61949278c	recipe_images	194973a3-2b2a-44a4-9bfc-d8dcdbd1ee0a/1000025954.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-03 19:11:04.414326+00	2024-01-03 19:11:04.414326+00	2024-01-03 19:11:04.414326+00	{"eTag": "\\"1c65d6495bb03caf7fc275555939a65a\\"", "size": 2641616, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2024-01-03T19:11:05.000Z", "contentLength": 2641616, "httpStatusCode": 200}	f5f7fc09-0678-45cb-8a11-1b33edc6e1d3	d669b21b-62c6-4d0f-8f76-40738e274c87
6c5a484d-9a85-4ccd-81ab-4bf5f1cdaba2	recipe_images	194973a3-2b2a-44a4-9bfc-d8dcdbd1ee0a/1000025955.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-03 19:11:05.974461+00	2024-01-03 19:11:05.974461+00	2024-01-03 19:11:05.974461+00	{"eTag": "\\"ca6cb4cf06141762b874897c58b95c02\\"", "size": 3221759, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2024-01-03T19:11:06.000Z", "contentLength": 3221759, "httpStatusCode": 200}	bfdade6c-4a2d-413d-b3e8-b031c89f06b8	d669b21b-62c6-4d0f-8f76-40738e274c87
1b438a9d-c656-4faa-8dd8-fcdeca751e20	recipe_images	194973a3-2b2a-44a4-9bfc-d8dcdbd1ee0a/1000025956.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-03 19:11:07.257635+00	2024-01-03 19:11:07.257635+00	2024-01-03 19:11:07.257635+00	{"eTag": "\\"bea7284f9226b9804ae902fa9fb7e94e\\"", "size": 2768669, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2024-01-03T19:11:08.000Z", "contentLength": 2768669, "httpStatusCode": 200}	46496210-395d-4cd5-b315-aa918cbe80a0	d669b21b-62c6-4d0f-8f76-40738e274c87
2e0ed744-87be-475e-b7d6-61b2c6abdb60	recipe_images	194973a3-2b2a-44a4-9bfc-d8dcdbd1ee0a/1000025957.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-03 19:11:07.8211+00	2024-01-03 19:11:07.8211+00	2024-01-03 19:11:07.8211+00	{"eTag": "\\"297c36f6e4d0fcdb7ec3d8a02f75516a\\"", "size": 397105, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-01-03T19:11:08.000Z", "contentLength": 397105, "httpStatusCode": 200}	4c03b87e-e41a-4cc7-bd39-5e9cef295e15	d669b21b-62c6-4d0f-8f76-40738e274c87
321a22b8-081b-451e-a1bb-a3afe08a21bf	recipe_images	edfa475a-f47e-4a4a-a9e0-d42e4e2aec28/IMG_1739.jpeg	16406e41-34f8-427e-b837-3a48ae51c519	2024-01-04 17:59:28.929417+00	2024-01-04 17:59:28.929417+00	2024-01-04 17:59:28.929417+00	{"eTag": "\\"6e706baad5d898437e9b9ac015d23860\\"", "size": 3311919, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-01-04T17:59:29.000Z", "contentLength": 3311919, "httpStatusCode": 200}	45ae1fb1-17ef-4064-a254-4c0ed0699fa9	16406e41-34f8-427e-b837-3a48ae51c519
7e0cc251-0fbe-42ef-b79f-bfdbe70088d1	recipe_images	edfa475a-f47e-4a4a-a9e0-d42e4e2aec28/IMG_1742.jpeg	16406e41-34f8-427e-b837-3a48ae51c519	2024-01-04 17:59:29.952688+00	2024-01-04 17:59:29.952688+00	2024-01-04 17:59:29.952688+00	{"eTag": "\\"e405f8aa61b8dae252532f2efcffb399\\"", "size": 1823711, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-01-04T17:59:30.000Z", "contentLength": 1823711, "httpStatusCode": 200}	4b5a82d8-293d-44c8-bcbc-9b97c902c039	16406e41-34f8-427e-b837-3a48ae51c519
cb3387b5-cd37-47c1-ad56-360339415a97	recipe_images	3451596f-199d-41dc-bbab-043deb983aa0/1000026200.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-06 19:10:46.951098+00	2024-01-06 19:10:46.951098+00	2024-01-06 19:10:46.951098+00	{"eTag": "\\"b248380303cfe1a2fefcbc21b9851d07\\"", "size": 2991248, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-01-06T19:10:47.000Z", "contentLength": 2991248, "httpStatusCode": 200}	312cba45-7001-47df-8877-330dc0e4b731	d669b21b-62c6-4d0f-8f76-40738e274c87
04725625-9628-4cd2-ba1d-5cb6a3d9b21e	recipe_images	3451596f-199d-41dc-bbab-043deb983aa0/1000026198.jpg	d669b21b-62c6-4d0f-8f76-40738e274c87	2024-01-06 19:10:48.532772+00	2024-01-06 19:10:48.532772+00	2024-01-06 19:10:48.532772+00	{"eTag": "\\"b5f05a290e622500492124d0da3b4011\\"", "size": 3090453, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-01-06T19:10:49.000Z", "contentLength": 3090453, "httpStatusCode": 200}	11dc6bc1-d7ed-4ed5-8b11-f385c0647525	d669b21b-62c6-4d0f-8f76-40738e274c87
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY "vault"."secrets" ("id", "name", "description", "secret", "key_id", "nonce", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 172, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
