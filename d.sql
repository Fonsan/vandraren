--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: competitions; Type: TABLE; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE TABLE competitions (
    id integer NOT NULL,
    name character varying(255),
    comment text,
    date date,
    competition_id integer,
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.competitions OWNER TO fonsan;

--
-- Name: competitions_id_seq; Type: SEQUENCE; Schema: public; Owner: fonsan
--

CREATE SEQUENCE competitions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.competitions_id_seq OWNER TO fonsan;

--
-- Name: competitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fonsan
--

ALTER SEQUENCE competitions_id_seq OWNED BY competitions.id;


--
-- Name: competitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fonsan
--

SELECT pg_catalog.setval('competitions_id_seq', 22, true);


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE TABLE delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0,
    attempts integer DEFAULT 0,
    handler text,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.delayed_jobs OWNER TO fonsan;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: fonsan
--

CREATE SEQUENCE delayed_jobs_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.delayed_jobs_id_seq OWNER TO fonsan;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fonsan
--

ALTER SEQUENCE delayed_jobs_id_seq OWNED BY delayed_jobs.id;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fonsan
--

SELECT pg_catalog.setval('delayed_jobs_id_seq', 52, true);


--
-- Name: klasses; Type: TABLE; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE TABLE klasses (
    id integer NOT NULL,
    short_name character varying(255),
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    main_class boolean DEFAULT false NOT NULL
);


ALTER TABLE public.klasses OWNER TO fonsan;

--
-- Name: klasses_id_seq; Type: SEQUENCE; Schema: public; Owner: fonsan
--

CREATE SEQUENCE klasses_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.klasses_id_seq OWNER TO fonsan;

--
-- Name: klasses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fonsan
--

ALTER SEQUENCE klasses_id_seq OWNED BY klasses.id;


--
-- Name: klasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fonsan
--

SELECT pg_catalog.setval('klasses_id_seq', 22, true);


--
-- Name: people; Type: TABLE; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    birthdate date,
    name character varying(255),
    surname character varying(255),
    person_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.people OWNER TO fonsan;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: fonsan
--

CREATE SEQUENCE people_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO fonsan;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fonsan
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fonsan
--

SELECT pg_catalog.setval('people_id_seq', 52, true);


--
-- Name: results; Type: TABLE; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE TABLE results (
    id integer NOT NULL,
    competition_id integer,
    person_id integer,
    "position" integer,
    "time" character varying(255),
    time_diff character varying(255),
    klass_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.results OWNER TO fonsan;

--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: fonsan
--

CREATE SEQUENCE results_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.results_id_seq OWNER TO fonsan;

--
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fonsan
--

ALTER SEQUENCE results_id_seq OWNED BY results.id;


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fonsan
--

SELECT pg_catalog.setval('results_id_seq', 94, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO fonsan;

--
-- Name: users; Type: TABLE; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password_hash character varying(255),
    password_salt character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO fonsan;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: fonsan
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO fonsan;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fonsan
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fonsan
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fonsan
--

ALTER TABLE competitions ALTER COLUMN id SET DEFAULT nextval('competitions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fonsan
--

ALTER TABLE delayed_jobs ALTER COLUMN id SET DEFAULT nextval('delayed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fonsan
--

ALTER TABLE klasses ALTER COLUMN id SET DEFAULT nextval('klasses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fonsan
--

ALTER TABLE people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fonsan
--

ALTER TABLE results ALTER COLUMN id SET DEFAULT nextval('results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fonsan
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: competitions; Type: TABLE DATA; Schema: public; Owner: fonsan
--

COPY competitions (id, name, comment, date, competition_id, url, created_at, updated_at) FROM stdin;
1	FOLSkubbet		2010-04-11	302	http://www.frolundaol.se/	2010-11-20 13:00:57.558454	2010-11-20 13:00:57.558454
2	Sjövallaslaget		2010-04-25	357	http://www.sjovalla.se	2010-11-20 13:00:57.667659	2010-11-20 13:00:57.667659
3	FYRKLUBBS		2010-08-29	490	http://www3.idrottonline.se/templates/Page.aspx?id=561666	2010-11-20 13:00:57.673284	2010-11-20 13:00:57.673284
4	Ruddalsloppet		2010-10-03	303	http://frolundaol.se	2010-11-20 13:03:05.100462	2010-11-20 13:03:05.100462
5	Göteborgsdubbeln, långdistans		2010-04-18	17	http://www.saik.o.se	2010-11-20 13:04:51.081006	2010-11-20 13:04:51.081006
6	DM Lång Göteborg		2010-09-19	13	http://www.landehof.nu	2010-11-20 13:08:13.991876	2010-11-20 13:08:13.991876
7	Göteborg/Majorna - Höst-Medel		2010-10-17	323	http://www.gmok.se	2010-11-20 13:08:14.003681	2010-11-20 13:08:14.003681
8	O-event 2010 - Zoorienteringen		2010-11-14	536	http://o-event.se	2010-11-20 13:08:14.015487	2010-11-20 13:08:14.015487
9	IK Uven		2010-08-22	169	http://www.ikuven.se	2010-11-20 13:10:25.775478	2010-11-20 13:10:25.775478
10	Vårserie - Etapp 2		2010-05-13	612	http://www.skidklubben.se	2010-11-20 13:12:05.015458	2010-11-20 13:12:05.015458
11	Vårserien - Etapp 4 		2010-05-29	744	http://www.ikuven.se	2010-11-20 13:12:05.023268	2010-11-20 13:12:05.023268
12	Vårserien E5		2010-06-05	705	http://www3.idrottonline.se/templates/Workroom.aspx?id=509210	2010-11-20 13:12:05.028571	2010-11-20 13:12:05.028571
13	DM Medel Västergötland		2010-09-11	526	http://www.dmboras.se	2010-11-20 13:14:33.945213	2010-11-20 13:14:33.945213
14	Närnattcup Etapp 1		2010-10-22	1749	http://www5.idrottonline.se/default.aspx?id=303318	2010-11-20 13:14:33.958419	2010-11-20 13:14:33.958419
15	Göteborgsdubbeln	Samarrangemang mellan Sävedalens AIK och Lerums SOK. Göteborgsdubbeln, Medeldistans lördag den 17/4 och Långdistans söndag den 18/4.	2010-04-17	396	http://saik.o.se/arrangemang/100417/	2010-11-20 13:17:04.871842	2010-11-20 13:17:04.871842
16	OK Orintos vårtävling		2010-05-09	219	http://www.orinto.se	2010-11-20 13:17:04.879696	2010-11-20 13:17:04.879696
17	Aleträffen		2010-09-25	424	http://alehof.se	2010-11-20 13:22:13.695936	2010-11-20 13:22:13.695936
18	Hjortsöndan		2010-09-26	85	http://www.skogshjortarna.com	2010-11-20 13:22:13.701985	2010-11-20 13:22:13.701985
19	OK Gynge		2010-08-28	489	http://www.gynge.nu	2010-11-20 13:37:58.286279	2010-11-20 13:37:58.286279
20	UIS deltävling BDOF:s ungdomsserie		2010-08-22	1084	http://www2.idrottonline.se/default.aspx?id=89105	2010-11-20 13:42:28.496387	2010-11-20 13:42:28.496387
21	Götaälvdalsträffen		2010-08-29	67	http://www.okgipen.se	2010-11-20 13:42:28.50239	2010-11-20 13:42:28.50239
22	DM Medel Göteborg		2010-09-11	575	http://www.dmboras.se	2010-11-20 14:12:53.723709	2010-11-20 14:12:53.723709
\.


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: fonsan
--

COPY delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, created_at, updated_at) FROM stdin;
6	0	8	--- !ruby/struct:Delayed::PerformableMethod \nobject: !ruby/class Person\nmethod_name: :import_person\nargs: \n- "3844"\n	{Ett fel uppstod: Klubbens tävlingslänk måste anges\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/validations.rb:49:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/attribute_methods/dirty.rb:30:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:242:in `block in save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:289:in `block in with_transaction_returning_status'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/connection_adapters/abstract/database_statements.rb:139:in `transaction'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:204:in `transaction'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:287:in `with_transaction_returning_status'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:242:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/validations.rb:34:in `create!'\\n/var/apps/marin_rest/app/models/person.rb:39:in `block in import_person'\\n/var/apps/marin_rest/app/models/person.rb:34:in `each'\\n/var/apps/marin_rest/app/models/person.rb:34:in `import_person'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/performable_method.rb:20:in `perform'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/backend/base.rb:83:in `invoke_job'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:119:in `block (2 levels) in run'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/timeout.rb:57:in `timeout'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:119:in `block in run'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/benchmark.rb:309:in `realtime'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:118:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:172:in `reserve_and_run_one_job'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:103:in `block in work_off'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:102:in `times'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:102:in `work_off'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:77:in `block (2 levels) in start'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/benchmark.rb:309:in `realtime'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:76:in `block in start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:73:in `loop'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:73:in `start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:100:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:79:in `block in run_process'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:250:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:250:in `block in start_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/daemonize.rb:199:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/daemonize.rb:199:in `call_as_daemon'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:254:in `start_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:294:in `start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/controller.rb:70:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons.rb:193:in `block in run_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/cmdline.rb:112:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/cmdline.rb:112:in `catch_exceptions'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons.rb:192:in `run_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:78:in `run_process'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:72:in `block in daemonize'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:70:in `times'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:70:in `daemonize'\\nscript/delayed_job:5:in `<main>'	2010-11-20 16:22:27.422511	\N	\N	\N	2010-11-20 12:55:25.360733	2010-11-20 15:14:06.423269
10	0	8	--- !ruby/struct:Delayed::PerformableMethod \nobject: !ruby/class Person\nmethod_name: :import_person\nargs: \n- "3931"\n	{Ett fel uppstod: Klubbens tävlingslänk måste anges\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/validations.rb:49:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/attribute_methods/dirty.rb:30:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:242:in `block in save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:289:in `block in with_transaction_returning_status'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/connection_adapters/abstract/database_statements.rb:139:in `transaction'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:204:in `transaction'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:287:in `with_transaction_returning_status'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:242:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/validations.rb:34:in `create!'\\n/var/apps/marin_rest/app/models/person.rb:39:in `block in import_person'\\n/var/apps/marin_rest/app/models/person.rb:34:in `each'\\n/var/apps/marin_rest/app/models/person.rb:34:in `import_person'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/performable_method.rb:20:in `perform'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/backend/base.rb:83:in `invoke_job'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:119:in `block (2 levels) in run'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/timeout.rb:57:in `timeout'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:119:in `block in run'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/benchmark.rb:309:in `realtime'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:118:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:172:in `reserve_and_run_one_job'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:103:in `block in work_off'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:102:in `times'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:102:in `work_off'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:77:in `block (2 levels) in start'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/benchmark.rb:309:in `realtime'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:76:in `block in start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:73:in `loop'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:73:in `start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:100:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:79:in `block in run_process'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:250:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:250:in `block in start_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/daemonize.rb:199:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/daemonize.rb:199:in `call_as_daemon'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:254:in `start_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:294:in `start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/controller.rb:70:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons.rb:193:in `block in run_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/cmdline.rb:112:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/cmdline.rb:112:in `catch_exceptions'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons.rb:192:in `run_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:78:in `run_process'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:72:in `block in daemonize'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:70:in `times'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:70:in `daemonize'\\nscript/delayed_job:5:in `<main>'	2010-11-20 16:23:16.646721	\N	\N	\N	2010-11-20 12:55:25.377049	2010-11-20 15:14:55.647872
17	0	8	--- !ruby/struct:Delayed::PerformableMethod \nobject: !ruby/class Person\nmethod_name: :import_person\nargs: \n- "20260"\n	{Ett fel uppstod: Klubbens tävlingslänk måste anges\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/validations.rb:49:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/attribute_methods/dirty.rb:30:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:242:in `block in save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:289:in `block in with_transaction_returning_status'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/connection_adapters/abstract/database_statements.rb:139:in `transaction'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:204:in `transaction'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:287:in `with_transaction_returning_status'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:242:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/validations.rb:34:in `create!'\\n/var/apps/marin_rest/app/models/person.rb:39:in `block in import_person'\\n/var/apps/marin_rest/app/models/person.rb:34:in `each'\\n/var/apps/marin_rest/app/models/person.rb:34:in `import_person'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/performable_method.rb:20:in `perform'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/backend/base.rb:83:in `invoke_job'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:119:in `block (2 levels) in run'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/timeout.rb:57:in `timeout'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:119:in `block in run'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/benchmark.rb:309:in `realtime'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:118:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:172:in `reserve_and_run_one_job'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:103:in `block in work_off'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:102:in `times'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:102:in `work_off'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:77:in `block (2 levels) in start'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/benchmark.rb:309:in `realtime'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:76:in `block in start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:73:in `loop'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:73:in `start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:100:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:79:in `block in run_process'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:250:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:250:in `block in start_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/daemonize.rb:199:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/daemonize.rb:199:in `call_as_daemon'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:254:in `start_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:294:in `start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/controller.rb:70:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons.rb:193:in `block in run_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/cmdline.rb:112:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/cmdline.rb:112:in `catch_exceptions'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons.rb:192:in `run_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:78:in `run_process'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:72:in `block in daemonize'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:70:in `times'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:70:in `daemonize'\\nscript/delayed_job:5:in `<main>'	2010-11-20 16:24:10.022886	\N	\N	\N	2010-11-20 12:55:25.41065	2010-11-20 15:15:49.023662
52	0	8	--- !ruby/struct:Delayed::PerformableMethod \nobject: !ruby/class Person\nmethod_name: :import_person\nargs: \n- "52870"\n	{Ett fel uppstod: Klubbens tävlingslänk måste anges\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/validations.rb:49:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/attribute_methods/dirty.rb:30:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:242:in `block in save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:289:in `block in with_transaction_returning_status'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/connection_adapters/abstract/database_statements.rb:139:in `transaction'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:204:in `transaction'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:287:in `with_transaction_returning_status'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/transactions.rb:242:in `save!'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/activerecord-3.0.3/lib/active_record/validations.rb:34:in `create!'\\n/var/apps/marin_rest/app/models/person.rb:39:in `block in import_person'\\n/var/apps/marin_rest/app/models/person.rb:34:in `each'\\n/var/apps/marin_rest/app/models/person.rb:34:in `import_person'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/performable_method.rb:20:in `perform'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/backend/base.rb:83:in `invoke_job'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:119:in `block (2 levels) in run'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/timeout.rb:57:in `timeout'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:119:in `block in run'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/benchmark.rb:309:in `realtime'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:118:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:172:in `reserve_and_run_one_job'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:103:in `block in work_off'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:102:in `times'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:102:in `work_off'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:77:in `block (2 levels) in start'\\n/home/fonsan/.rvm/rubies/ruby-1.9.2-p0/lib/ruby/1.9.1/benchmark.rb:309:in `realtime'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:76:in `block in start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:73:in `loop'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/worker.rb:73:in `start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:100:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:79:in `block in run_process'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:250:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:250:in `block in start_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/daemonize.rb:199:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/daemonize.rb:199:in `call_as_daemon'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:254:in `start_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/application.rb:294:in `start'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/controller.rb:70:in `run'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons.rb:193:in `block in run_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/cmdline.rb:112:in `call'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons/cmdline.rb:112:in `catch_exceptions'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/gems/daemons-1.1.0/lib/daemons.rb:192:in `run_proc'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:78:in `run_process'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:72:in `block in daemonize'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:70:in `times'\\n/home/fonsan/.rvm/gems/ruby-1.9.2-p0/bundler/gems/delayed_job-fcca64c20c60/lib/delayed/command.rb:70:in `daemonize'\\nscript/delayed_job:5:in `<main>'	2010-11-20 16:25:43.010385	\N	\N	\N	2010-11-20 12:55:25.59597	2010-11-20 15:17:22.01114
\.


--
-- Data for Name: klasses; Type: TABLE DATA; Schema: public; Owner: fonsan
--

COPY klasses (id, short_name, name, created_at, updated_at, main_class) FROM stdin;
1	Ö4	Öppen 4	2010-11-20 13:00:57.59515	2010-11-20 13:00:57.59515	f
2	Ö2	Öppen 2	2010-11-20 13:00:57.675957	2010-11-20 13:00:57.675957	f
3	Ö7	Öppen 7	2010-11-20 13:03:51.95923	2010-11-20 13:03:51.95923	f
4	H65	H65	2010-11-20 13:03:51.966768	2010-11-20 13:03:51.966768	f
5	H60	H60	2010-11-20 13:04:51.075759	2010-11-20 13:04:51.075759	f
6	H18	H18	2010-11-20 13:08:13.994978	2010-11-20 13:08:13.994978	f
7	H45	H45	2010-11-20 13:08:57.393184	2010-11-20 13:08:57.393184	f
8	H14	H14	2010-11-20 13:12:05.018492	2010-11-20 13:12:05.018492	f
9	H10	H10	2010-11-20 13:14:33.93122	2010-11-20 13:14:33.93122	f
10	HU2	HU2	2010-11-20 13:14:33.937515	2010-11-20 13:14:33.937515	f
11	U2	U2	2010-11-20 13:14:33.950922	2010-11-20 13:14:33.950922	f
12	U3	U3	2010-11-20 13:15:31.535524	2010-11-20 13:15:31.535524	f
13	D45	D45	2010-11-20 13:16:19.958233	2010-11-20 13:16:19.958233	f
14	H21	H21	2010-11-20 13:17:04.874919	2010-11-20 13:17:04.874919	f
15	Ö1	Öppen 1	2010-11-20 13:20:01.121993	2010-11-20 13:20:01.121993	f
16	D60	D60	2010-11-20 13:22:59.535226	2010-11-20 13:22:59.535226	f
17	Ö3	Öppen 3	2010-11-20 13:23:49.04375	2010-11-20 13:23:49.04375	f
18	DU1	DU1	2010-11-20 13:25:08.405499	2010-11-20 13:25:08.405499	f
19	DU2	DU2	2010-11-20 13:35:31.877922	2010-11-20 13:35:31.877922	f
20	Ö5	Öppen 5	2010-11-20 13:37:58.292865	2010-11-20 13:37:58.292865	f
21	Ö8	Öppen 8	2010-11-20 13:40:42.953083	2010-11-20 13:40:42.953083	f
22	G-H14	G-H14	2010-11-20 14:12:53.726506	2010-11-20 14:12:53.726506	f
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: fonsan
--

COPY people (id, birthdate, name, surname, person_id, created_at, updated_at) FROM stdin;
1	1949-05-18	Bengt	Dellming	1187	2010-11-20 12:55:25.268975	2010-11-20 12:55:25.268975
2	1978-10-10	Linda	Martinsson	1862	2010-11-20 12:55:25.331672	2010-11-20 12:55:25.331672
3	1949-05-06	Kerstin	Ahlquist	3840	2010-11-20 12:55:25.34638	2010-11-20 12:55:25.34638
4	1983-01-10	Erik	Ahlquist	3841	2010-11-20 12:55:25.350592	2010-11-20 12:55:25.350592
5	1989-08-16	Anders	Alkdal	3842	2010-11-20 12:55:25.354777	2010-11-20 12:55:25.354777
6	1950-10-12	Birgitta	Broberg	3844	2010-11-20 12:55:25.358819	2010-11-20 12:55:25.358819
7	1988-05-24	Anna	Broberg	3846	2010-11-20 12:55:25.362842	2010-11-20 12:55:25.362842
8	1951-07-27	Per	Ahlquist	3927	2010-11-20 12:55:25.366951	2010-11-20 12:55:25.366951
9	1942-11-06	Bengt	Alkdal	3929	2010-11-20 12:55:25.371121	2010-11-20 12:55:25.371121
10	1948-04-28	Staffan	Broberg	3931	2010-11-20 12:55:25.37513	2010-11-20 12:55:25.37513
11	1965-08-06	Ulf	Eliasson	11290	2010-11-20 12:55:25.379149	2010-11-20 12:55:25.379149
12	1992-05-18	Gustav	Tibblin	13403	2010-11-20 12:55:25.383262	2010-11-20 12:55:25.383262
13	1950-02-28	Karin	Elfman	16450	2010-11-20 12:55:25.387457	2010-11-20 12:55:25.387457
14	1993-05-07	Vidar	Eriksson	17439	2010-11-20 12:55:25.391895	2010-11-20 12:55:25.391895
15	1964-06-28	Klas	Eriksson	17440	2010-11-20 12:55:25.398959	2010-11-20 12:55:25.398959
16	1993-01-22	Christopher	Åkersten	18141	2010-11-20 12:55:25.404559	2010-11-20 12:55:25.404559
17	1956-05-18	Jan	Fonselius	20260	2010-11-20 12:55:25.408665	2010-11-20 12:55:25.408665
18	1961-03-23	Jan-Olov	Åkersten	23771	2010-11-20 12:55:25.412814	2010-11-20 12:55:25.412814
19	1996-01-18	Felix	Ekholm	27318	2010-11-20 12:55:25.416954	2010-11-20 12:55:25.416954
20	1996-07-11	Carl	Kylin	27320	2010-11-20 12:55:25.421067	2010-11-20 12:55:25.421067
21	1996-08-05	Malva	Eliasson	32769	2010-11-20 12:55:25.425181	2010-11-20 12:55:25.425181
22	2000-06-26	Johan	Cahlin	34115	2010-11-20 12:55:25.429324	2010-11-20 12:55:25.429324
23	1999-09-11	Victor	Ahlquist	34724	2010-11-20 12:55:25.433463	2010-11-20 12:55:25.433463
24	1965-02-15	Evelina	Eriksson	34951	2010-11-20 12:55:25.437567	2010-11-20 12:55:25.437567
25	1977-05-18	Anders	Jonsson	35533	2010-11-20 12:55:25.442118	2010-11-20 12:55:25.442118
26	1996-12-11	Erik	Nordström	35615	2010-11-20 12:55:25.446488	2010-11-20 12:55:25.446488
27	1991-06-08	Stephanie	Åkersten	37185	2010-11-20 12:55:25.45059	2010-11-20 12:55:25.45059
28	1923-01-25	Gustav	Lundberg	39561	2010-11-20 12:55:25.454666	2010-11-20 12:55:25.454666
29	1959-06-16	Birgitta	Johansson-Cahlin	39596	2010-11-20 12:55:25.458714	2010-11-20 12:55:25.458714
30	1962-10-15	Carola	Kylin	42521	2010-11-20 12:55:25.462762	2010-11-20 12:55:25.462762
31	1946-01-15	Eva	Dellming	42664	2010-11-20 12:55:25.466814	2010-11-20 12:55:25.466814
32	1982-09-04	Klas	Petersson	42665	2010-11-20 12:55:25.470863	2010-11-20 12:55:25.470863
33	1950-03-20	Margareta	Petersson	42666	2010-11-20 12:55:25.475018	2010-11-20 12:55:25.475018
34	1960-06-15	Lena	Kollén	42667	2010-11-20 12:55:25.479271	2010-11-20 12:55:25.479271
35	1989-02-10	Anja	Johansson	42668	2010-11-20 12:55:25.483631	2010-11-20 12:55:25.483631
36	2000-09-02	Lovisa	Broberg	42898	2010-11-20 12:55:25.493979	2010-11-20 12:55:25.493979
37	1962-07-26	Sandra	Åkersten	43080	2010-11-20 12:55:25.49811	2010-11-20 12:55:25.49811
38	1996-03-12	Johan	Kollén	43163	2010-11-20 12:55:25.502208	2010-11-20 12:55:25.502208
39	1988-07-18	Erik	Fonselius	46265	2010-11-20 12:55:25.506279	2010-11-20 12:55:25.506279
40	1954-05-31	Hans-Olof	Cederberg	46266	2010-11-20 12:55:25.510445	2010-11-20 12:55:25.510445
41	1989-09-24	Fredrik	Cederberg	46267	2010-11-20 12:55:25.514535	2010-11-20 12:55:25.514535
42	1964-02-12	Ann-Charlotte	Fonselius	46268	2010-11-20 12:55:25.51864	2010-11-20 12:55:25.51864
43	1986-09-22	Björn	Johansson	46269	2010-11-20 12:55:25.522811	2010-11-20 12:55:25.522811
44	1952-05-27	Gunnar	Johansson	46275	2010-11-20 12:55:25.526853	2010-11-20 12:55:25.526853
45	1949-02-20	Ing-Marie	Johansson	46276	2010-11-20 12:55:25.530945	2010-11-20 12:55:25.530945
46	1996-03-31	Fredrik	Cahlin	46401	2010-11-20 12:55:25.535001	2010-11-20 12:55:25.535001
47	2000-01-17	Edvin	Alestig	52357	2010-11-20 12:55:25.539079	2010-11-20 12:55:25.539079
48	1999-05-08	Erik	Kollén	52358	2010-11-20 12:55:25.543204	2010-11-20 12:55:25.543204
49	1996-03-10	Michelle	Ström	52562	2010-11-20 12:55:25.547304	2010-11-20 12:55:25.547304
50	1996-02-18	Jakob	Junkers	52592	2010-11-20 12:55:25.585164	2010-11-20 12:55:25.585164
51	1996-02-01	Rebecka	Olsson	52593	2010-11-20 12:55:25.589194	2010-11-20 12:55:25.589194
52	1984-02-16	Andreas	Svensson	52870	2010-11-20 12:55:25.59371	2010-11-20 12:55:25.59371
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: fonsan
--

COPY results (id, competition_id, person_id, "position", "time", time_diff, klass_id, created_at, updated_at) FROM stdin;
1	302	3844	44	93:53	52:53	1	2010-11-20 13:00:57.662779	2010-11-20 13:00:57.662779
2	357	3844	26	91:21	51:50	1	2010-11-20 13:00:57.670767	2010-11-20 13:00:57.670767
3	490	3844	6	67:27	36:33	2	2010-11-20 13:00:57.678056	2010-11-20 13:00:57.678056
4	303	3927	12	47:37	15:14	1	2010-11-20 13:03:05.179075	2010-11-20 13:03:05.179075
5	302	3929	63	86:25	59:15	3	2010-11-20 13:03:51.963737	2010-11-20 13:03:51.963737
6	303	3929	29	47:01	26:44	4	2010-11-20 13:03:51.96888	2010-11-20 13:03:51.96888
7	302	3931	19	58:53	18:39	5	2010-11-20 13:04:51.078295	2010-11-20 13:04:51.078295
8	17	3931	13	58:28	22:27	5	2010-11-20 13:04:51.084153	2010-11-20 13:04:51.084153
9	13	17439	10	102:48	42:40	6	2010-11-20 13:08:13.997298	2010-11-20 13:08:13.997298
10	303	17439	4	31:36	6:36	6	2010-11-20 13:08:14.000517	2010-11-20 13:08:14.000517
11	323	17439	1	34:17	0:00	6	2010-11-20 13:08:14.012784	2010-11-20 13:08:14.012784
12	303	17440	27	51:47	25:49	7	2010-11-20 13:08:57.395995	2010-11-20 13:08:57.395995
13	169	20260	39	85:16	46:33	3	2010-11-20 13:10:25.779117	2010-11-20 13:10:25.779117
14	612	27318	11	63:19	36:56	8	2010-11-20 13:12:05.020759	2010-11-20 13:12:05.020759
15	744	27318	12	61:31	32:45	8	2010-11-20 13:12:05.026105	2010-11-20 13:12:05.026105
16	705	27318	7	41:51	12:19	8	2010-11-20 13:12:05.031975	2010-11-20 13:12:05.031975
17	13	27318	15	69:24	40:41	8	2010-11-20 13:12:05.035022	2010-11-20 13:12:05.035022
18	303	27318	18	36:40	14:27	8	2010-11-20 13:12:05.038011	2010-11-20 13:12:05.038011
19	536	27318	100	26:01	12:11	8	2010-11-20 13:12:05.04098	2010-11-20 13:12:05.04098
20	357	27320	20	95:07	64:35	8	2010-11-20 13:12:54.98591	2010-11-20 13:12:54.98591
21	612	27320	12	73:25	47:02	8	2010-11-20 13:12:54.989459	2010-11-20 13:12:54.989459
22	744	27320	11	59:37	30:51	8	2010-11-20 13:12:54.99261	2010-11-20 13:12:54.99261
23	705	27320	10	58:58	29:26	8	2010-11-20 13:12:54.995758	2010-11-20 13:12:54.995758
24	612	34115	2	21:41	0:35	10	2010-11-20 13:14:33.939621	2010-11-20 13:14:33.939621
25	744	34115	1	15:44	0:00	10	2010-11-20 13:14:33.942678	2010-11-20 13:14:33.942678
26	526	34115	3	51:36	14:24	2	2010-11-20 13:14:33.948107	2010-11-20 13:14:33.948107
27	13	34115	2	26:55	2:23	11	2010-11-20 13:14:33.952986	2010-11-20 13:14:33.952986
28	303	34115	3	16:13	4:19	9	2010-11-20 13:14:33.955998	2010-11-20 13:14:33.955998
29	1749	34115	1	16:51	0:00	9	2010-11-20 13:14:33.961191	2010-11-20 13:14:33.961191
30	17	34724	2	28:14	1:12	11	2010-11-20 13:15:31.516556	2010-11-20 13:15:31.516556
31	357	34724	3	35:15	1:37	11	2010-11-20 13:15:31.520018	2010-11-20 13:15:31.520018
32	612	34724	9	26:26	5:20	10	2010-11-20 13:15:31.523086	2010-11-20 13:15:31.523086
33	744	34724	8	20:48	5:04	10	2010-11-20 13:15:31.52617	2010-11-20 13:15:31.52617
34	705	34724	12	33:35	9:20	10	2010-11-20 13:15:31.529261	2010-11-20 13:15:31.529261
35	303	34724	1	15:46	0:00	11	2010-11-20 13:15:31.532424	2010-11-20 13:15:31.532424
36	13	34951	27	74:07	45:33	3	2010-11-20 13:16:19.955023	2010-11-20 13:16:19.955023
37	303	34951	9	43:44	19:14	13	2010-11-20 13:16:19.960418	2010-11-20 13:16:19.960418
38	323	34951	51	61:28	32:04	3	2010-11-20 13:16:19.963518	2010-11-20 13:16:19.963518
39	396	35533	17	56:30	20:29	14	2010-11-20 13:17:04.877173	2010-11-20 13:17:04.877173
40	219	35533	40	60:47	30:14	14	2010-11-20 13:17:04.882577	2010-11-20 13:17:04.882577
41	705	39596	16	42:12	19:50	2	2010-11-20 13:20:01.111604	2010-11-20 13:20:01.111604
42	744	39596	17	32:18	15:19	2	2010-11-20 13:20:01.11561	2010-11-20 13:20:01.11561
43	526	39596	4	53:13	16:01	2	2010-11-20 13:20:01.118824	2010-11-20 13:20:01.118824
44	13	39596	1	27:45	0:00	15	2010-11-20 13:20:01.124186	2010-11-20 13:20:01.124186
45	396	42665	13	50:08	14:07	14	2010-11-20 13:22:13.689797	2010-11-20 13:22:13.689797
46	219	42665	41	62:29	31:56	14	2010-11-20 13:22:13.693233	2010-11-20 13:22:13.693233
47	323	42666	46	68:47	34:30	1	2010-11-20 13:22:59.541221	2010-11-20 13:22:59.541221
48	302	42667	11	64:33	16:20	17	2010-11-20 13:23:49.046226	2010-11-20 13:23:49.046226
49	744	42667	16	32:16	15:17	2	2010-11-20 13:23:49.049316	2010-11-20 13:23:49.049316
50	536	42667	30	30:47	14:18	2	2010-11-20 13:23:49.055778	2010-11-20 13:23:49.055778
51	612	42898	38	53:46	36:34	18	2010-11-20 13:25:08.408049	2010-11-20 13:25:08.408049
52	612	52357	16	29:06	8:00	10	2010-11-20 13:33:42.071905	2010-11-20 13:33:42.071905
53	744	52357	4	19:38	3:54	10	2010-11-20 13:33:42.07607	2010-11-20 13:33:42.07607
54	705	52357	11	33:05	8:50	10	2010-11-20 13:33:42.079675	2010-11-20 13:33:42.079675
55	13	52357	16	41:00	16:28	11	2010-11-20 13:33:42.083051	2010-11-20 13:33:42.083051
56	303	52357	6	18:19	2:33	11	2010-11-20 13:33:42.086415	2010-11-20 13:33:42.086415
57	612	52358	3	22:24	1:18	10	2010-11-20 13:34:37.976552	2010-11-20 13:34:37.976552
58	705	52358	20	42:06	17:51	10	2010-11-20 13:34:37.980234	2010-11-20 13:34:37.980234
59	612	52562	33	33:21	14:54	19	2010-11-20 13:35:31.880463	2010-11-20 13:35:31.880463
60	744	52562	3	18:58	2:03	19	2010-11-20 13:35:31.883527	2010-11-20 13:35:31.883527
61	705	52562	14	46:03	14:23	12	2010-11-20 13:35:31.886491	2010-11-20 13:35:31.886491
62	612	52592	4	23:02	1:56	10	2010-11-20 13:36:20.6183	2010-11-20 13:36:20.6183
63	744	52592	13	41:52	17:24	12	2010-11-20 13:36:20.62166	2010-11-20 13:36:20.62166
64	705	52592	15	47:04	15:24	12	2010-11-20 13:36:20.62466	2010-11-20 13:36:20.62466
65	303	52592	1	28:17	0:00	12	2010-11-20 13:36:20.627687	2010-11-20 13:36:20.627687
66	612	52593	16	24:58	6:31	19	2010-11-20 13:37:03.773111	2010-11-20 13:37:03.773111
67	489	52870	5	67:56	15:03	1	2010-11-20 13:37:58.289843	2010-11-20 13:37:58.289843
68	490	52870	5	57:58	20:32	20	2010-11-20 13:37:58.324081	2010-11-20 13:37:58.324081
69	302	3846	6	34:19	7:09	3	2010-11-20 13:40:42.949733	2010-11-20 13:40:42.949733
70	357	3846	24	65:26	23:10	21	2010-11-20 13:40:42.955255	2010-11-20 13:40:42.955255
71	489	3846	6	74:18	26:23	21	2010-11-20 13:40:42.958403	2010-11-20 13:40:42.958403
72	490	3846	6	71:35	16:06	21	2010-11-20 13:40:42.961509	2010-11-20 13:40:42.961509
73	526	3846	17	60:45	24:27	21	2010-11-20 13:40:42.964753	2010-11-20 13:40:42.964753
74	13	3846	9	40:48	12:14	3	2010-11-20 13:40:42.967994	2010-11-20 13:40:42.967994
75	303	3846	7	29:37	4:23	3	2010-11-20 13:40:42.971148	2010-11-20 13:40:42.971148
76	323	3846	33	50:30	21:06	3	2010-11-20 13:40:42.974323	2010-11-20 13:40:42.974323
77	302	16450	50	63:47	36:37	3	2010-11-20 13:42:28.493395	2010-11-20 13:42:28.493395
78	67	16450	17	56:14	21:20	1	2010-11-20 13:42:28.505314	2010-11-20 13:42:28.505314
79	13	16450	28	102:59	74:25	3	2010-11-20 13:42:28.508462	2010-11-20 13:42:28.508462
80	303	16450	7	31:54	7:31	16	2010-11-20 13:42:28.512153	2010-11-20 13:42:28.512153
81	323	16450	20	40:14	16:14	16	2010-11-20 13:42:28.516557	2010-11-20 13:42:28.516557
82	612	43163	13	122:11	95:48	8	2010-11-20 13:44:16.400418	2010-11-20 13:44:16.400418
83	705	43163	11	61:08	31:36	8	2010-11-20 13:44:16.406984	2010-11-20 13:44:16.406984
84	303	43163	24	53:03	30:50	8	2010-11-20 13:44:16.413288	2010-11-20 13:44:16.413288
85	1749	43163	2	44:32	19:25	8	2010-11-20 13:44:16.416307	2010-11-20 13:44:16.416307
86	536	43163	125	47:11	33:21	8	2010-11-20 13:44:16.41931	2010-11-20 13:44:16.41931
87	357	46401	16	71:22	40:50	8	2010-11-20 14:12:53.711423	2010-11-20 14:12:53.711423
88	612	46401	5	41:51	15:28	8	2010-11-20 14:12:53.714828	2010-11-20 14:12:53.714828
89	744	46401	3	42:46	14:00	8	2010-11-20 14:12:53.717878	2010-11-20 14:12:53.717878
90	705	46401	6	28:34	6:12	2	2010-11-20 14:12:53.720959	2010-11-20 14:12:53.720959
91	575	46401	8	35:50	15:32	22	2010-11-20 14:12:53.729164	2010-11-20 14:12:53.729164
92	13	46401	9	49:37	20:54	8	2010-11-20 14:12:53.733389	2010-11-20 14:12:53.733389
93	303	46401	7	27:22	5:09	8	2010-11-20 14:12:53.737539	2010-11-20 14:12:53.737539
94	1749	46401	3	47:16	22:09	8	2010-11-20 14:12:53.741646	2010-11-20 14:12:53.741646
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: fonsan
--

COPY schema_migrations (version) FROM stdin;
20100821143013
20100821152648
20100821153347
20100821191920
20100821192818
20100821213015
20100821224745
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fonsan
--

COPY users (id, username, email, password_hash, password_salt, created_at, updated_at) FROM stdin;
1	Admin	fonsan@gmail.com	0fe4aaf272559684047886072c351788cc205b44	dcbff9661f5b0bcb15b3140b6039813965a380a6	2010-11-20 13:29:17.57398	2010-11-20 13:29:17.57398
2	JanFonselius	jan.fonselius@chemetall.com	e5d1db5a027bf23fcfc8214b1d2745ada92d7578	1f0803b52e5eefd49fbdda5f6070d5373fc75b3a	2010-11-20 15:58:21.797249	2010-11-20 15:58:21.797249
\.


--
-- Name: competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: fonsan; Tablespace: 
--

ALTER TABLE ONLY competitions
    ADD CONSTRAINT competitions_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: fonsan; Tablespace: 
--

ALTER TABLE ONLY delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: klasses_pkey; Type: CONSTRAINT; Schema: public; Owner: fonsan; Tablespace: 
--

ALTER TABLE ONLY klasses
    ADD CONSTRAINT klasses_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: fonsan; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: results_pkey; Type: CONSTRAINT; Schema: public; Owner: fonsan; Tablespace: 
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: fonsan; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE INDEX delayed_jobs_priority ON delayed_jobs USING btree (priority, run_at);


--
-- Name: index_competitions_on_date; Type: INDEX; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE INDEX index_competitions_on_date ON competitions USING btree (date);


--
-- Name: index_klasses_on_short_name; Type: INDEX; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE INDEX index_klasses_on_short_name ON klasses USING btree (short_name);


--
-- Name: index_people_on_birthdate; Type: INDEX; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE INDEX index_people_on_birthdate ON people USING btree (birthdate);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: fonsan; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

