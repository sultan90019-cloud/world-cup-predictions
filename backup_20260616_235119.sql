--
-- PostgreSQL database dump
--

\restrict AIG6FRfTEfjNItdQhgVsrXch5GH5eUIvOPgI6lqyQF6xrdjXWpGqY1OIYbmOGqg

-- Dumped from database version 16.14
-- Dumped by pg_dump version 16.14

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
-- Name: matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matches (
    id integer NOT NULL,
    teama character varying(100) NOT NULL,
    teamb character varying(100) NOT NULL,
    stage character varying(50) NOT NULL,
    phase character varying(20) DEFAULT 'GROUP'::character varying NOT NULL,
    match_code character varying(20),
    start_at timestamp without time zone NOT NULL,
    actual_scorea integer,
    actual_scoreb integer,
    home_score integer,
    away_score integer,
    result_status character varying(20) DEFAULT 'pending'::character varying NOT NULL,
    result_approved_at timestamp without time zone,
    result_approved_by integer,
    round integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.matches OWNER TO postgres;

--
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matches_id_seq OWNER TO postgres;

--
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matches_id_seq OWNED BY public.matches.id;


--
-- Name: predictions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.predictions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    match_id integer NOT NULL,
    scorea integer NOT NULL,
    scoreb integer NOT NULL,
    points integer DEFAULT 0,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.predictions OWNER TO postgres;

--
-- Name: predictions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.predictions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.predictions_id_seq OWNER TO postgres;

--
-- Name: predictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.predictions_id_seq OWNED BY public.predictions.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    key character varying(100) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    username character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    role character varying(20) DEFAULT 'player'::character varying NOT NULL,
    status character varying(20) DEFAULT 'approved'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

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


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: matches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches ALTER COLUMN id SET DEFAULT nextval('public.matches_id_seq'::regclass);


--
-- Name: predictions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions ALTER COLUMN id SET DEFAULT nextval('public.predictions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matches (id, teama, teamb, stage, phase, match_code, start_at, actual_scorea, actual_scoreb, home_score, away_score, result_status, result_approved_at, result_approved_by, round, created_at) FROM stdin;
625	المكسيك	جنوب أفريقيا	المجموعة A	GROUP	\N	2026-06-11 19:00:00	2	1	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
629	البرازيل	المغرب	المجموعة C	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
630	هايتي	إسكتلندا	المجموعة C	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
631	الولايات المتحدة	باراغواي	المجموعة D	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
632	أستراليا	تركيا	المجموعة D	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
633	ألمانيا	كوراساو	المجموعة E	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
634	ساحل العاج	الإكوادور	المجموعة E	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
635	هولندا	اليابان	المجموعة F	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
636	السويد	تونس	المجموعة F	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
637	بلجيكا	مصر	المجموعة G	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
638	إيران	نيوزيلندا	المجموعة G	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
639	إسبانيا	الرأس الأخضر	المجموعة H	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
626	كوريا الجنوبية	التشيك	المجموعة A	GROUP	\N	2026-06-11 22:00:00	1	1	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
627	كندا	البوسنة والهرسك	المجموعة B	GROUP	\N	2026-06-11 19:00:00	3	0	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
628	قطر	سويسرا	المجموعة B	GROUP	\N	2026-06-11 22:00:00	0	2	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
640	السعودية	الأوروغواي	المجموعة H	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
641	فرنسا	السنغال	المجموعة I	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
642	العراق	النرويج	المجموعة I	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
643	الأرجنتين	الجزائر	المجموعة J	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
644	النمسا	الأردن	المجموعة J	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
645	البرتغال	الكونغو الديمقراطية	المجموعة K	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
646	أوزبكستان	كولومبيا	المجموعة K	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
647	إنجلترا	كرواتيا	المجموعة L	GROUP	\N	2026-06-11 19:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
648	غانا	بنما	المجموعة L	GROUP	\N	2026-06-11 22:00:00	\N	\N	\N	\N	pending	\N	\N	1	2026-06-07 17:32:06.887827
649	المكسيك	كوريا الجنوبية	المجموعة A	GROUP	\N	2026-06-22 19:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
650	جنوب أفريقيا	التشيك	المجموعة A	GROUP	\N	2026-06-22 20:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
651	كندا	قطر	المجموعة B	GROUP	\N	2026-06-22 22:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
652	البوسنة والهرسك	سويسرا	المجموعة B	GROUP	\N	2026-06-22 23:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
653	البرازيل	هايتي	المجموعة C	GROUP	\N	2026-06-23 01:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
654	المغرب	إسكتلندا	المجموعة C	GROUP	\N	2026-06-23 02:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
655	الولايات المتحدة	أستراليا	المجموعة D	GROUP	\N	2026-06-23 04:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
656	باراغواي	تركيا	المجموعة D	GROUP	\N	2026-06-23 05:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
657	ألمانيا	ساحل العاج	المجموعة E	GROUP	\N	2026-06-23 07:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
658	كوراساو	الإكوادور	المجموعة E	GROUP	\N	2026-06-23 08:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
659	هولندا	السويد	المجموعة F	GROUP	\N	2026-06-23 10:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
660	اليابان	تونس	المجموعة F	GROUP	\N	2026-06-23 11:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
661	بلجيكا	إيران	المجموعة G	GROUP	\N	2026-06-23 13:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
662	مصر	نيوزيلندا	المجموعة G	GROUP	\N	2026-06-23 14:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
663	إسبانيا	السعودية	المجموعة H	GROUP	\N	2026-06-23 16:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
664	الرأس الأخضر	الأوروغواي	المجموعة H	GROUP	\N	2026-06-23 17:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
665	فرنسا	العراق	المجموعة I	GROUP	\N	2026-06-23 19:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
666	السنغال	النرويج	المجموعة I	GROUP	\N	2026-06-23 20:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
667	الأرجنتين	النمسا	المجموعة J	GROUP	\N	2026-06-23 22:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
668	الجزائر	الأردن	المجموعة J	GROUP	\N	2026-06-23 23:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
669	البرتغال	أوزبكستان	المجموعة K	GROUP	\N	2026-06-24 01:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
670	الكونغو الديمقراطية	كولومبيا	المجموعة K	GROUP	\N	2026-06-24 02:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
671	إنجلترا	غانا	المجموعة L	GROUP	\N	2026-06-24 04:00:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
672	كرواتيا	بنما	المجموعة L	GROUP	\N	2026-06-24 05:30:00	\N	\N	\N	\N	pending	\N	\N	2	2026-06-07 17:32:06.887827
673	المكسيك	التشيك	المجموعة A	GROUP	\N	2026-07-03 19:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
674	جنوب أفريقيا	كوريا الجنوبية	المجموعة A	GROUP	\N	2026-07-03 20:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
675	كندا	سويسرا	المجموعة B	GROUP	\N	2026-07-03 22:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
676	البوسنة والهرسك	قطر	المجموعة B	GROUP	\N	2026-07-03 23:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
677	البرازيل	إسكتلندا	المجموعة C	GROUP	\N	2026-07-04 01:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
678	المغرب	هايتي	المجموعة C	GROUP	\N	2026-07-04 02:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
679	الولايات المتحدة	تركيا	المجموعة D	GROUP	\N	2026-07-04 04:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
680	باراغواي	أستراليا	المجموعة D	GROUP	\N	2026-07-04 05:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
681	ألمانيا	الإكوادور	المجموعة E	GROUP	\N	2026-07-04 07:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
682	كوراساو	ساحل العاج	المجموعة E	GROUP	\N	2026-07-04 08:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
683	هولندا	تونس	المجموعة F	GROUP	\N	2026-07-04 10:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
684	اليابان	السويد	المجموعة F	GROUP	\N	2026-07-04 11:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
685	بلجيكا	نيوزيلندا	المجموعة G	GROUP	\N	2026-07-04 13:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
686	مصر	إيران	المجموعة G	GROUP	\N	2026-07-04 14:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
687	إسبانيا	الأوروغواي	المجموعة H	GROUP	\N	2026-07-04 16:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
688	الرأس الأخضر	السعودية	المجموعة H	GROUP	\N	2026-07-04 17:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
689	فرنسا	النرويج	المجموعة I	GROUP	\N	2026-07-04 19:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
690	السنغال	العراق	المجموعة I	GROUP	\N	2026-07-04 20:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
691	الأرجنتين	الأردن	المجموعة J	GROUP	\N	2026-07-04 22:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
692	الجزائر	النمسا	المجموعة J	GROUP	\N	2026-07-04 23:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
693	البرتغال	كولومبيا	المجموعة K	GROUP	\N	2026-07-05 01:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
694	الكونغو الديمقراطية	أوزبكستان	المجموعة K	GROUP	\N	2026-07-05 02:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
695	إنجلترا	بنما	المجموعة L	GROUP	\N	2026-07-05 04:00:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
696	كرواتيا	غانا	المجموعة L	GROUP	\N	2026-07-05 05:30:00	\N	\N	\N	\N	pending	\N	\N	3	2026-06-07 17:32:06.887827
\.


--
-- Data for Name: predictions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.predictions (id, user_id, match_id, scorea, scoreb, points, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (key, value) FROM stdin;
current_round	1
published_rounds	[1,2,3,4,5,6,7,8,9]
group_standings	[{"name":"المجموعة A","teams":[{"name":"المكسيك","flag":"mx","played":1,"wins":1,"draws":0,"losses":0,"scored":2,"conceded":1,"goalDifference":1,"points":3},{"name":"كوريا الجنوبية","flag":"kr","played":1,"wins":0,"draws":1,"losses":0,"scored":1,"conceded":1,"goalDifference":0,"points":1},{"name":"التشيك","flag":"cz","played":1,"wins":0,"draws":1,"losses":0,"scored":1,"conceded":1,"goalDifference":0,"points":1},{"name":"جنوب أفريقيا","flag":"za","played":1,"wins":0,"draws":0,"losses":1,"scored":1,"conceded":2,"goalDifference":-1,"points":0}]},{"name":"المجموعة B","teams":[{"name":"كندا","flag":"ca","played":1,"wins":1,"draws":0,"losses":0,"scored":3,"conceded":0,"goalDifference":3,"points":3},{"name":"سويسرا","flag":"ch","played":1,"wins":1,"draws":0,"losses":0,"scored":2,"conceded":0,"goalDifference":2,"points":3},{"name":"قطر","flag":"qa","played":1,"wins":0,"draws":0,"losses":1,"scored":0,"conceded":2,"goalDifference":-2,"points":0},{"name":"البوسنة والهرسك","flag":"ba","played":1,"wins":0,"draws":0,"losses":1,"scored":0,"conceded":3,"goalDifference":-3,"points":0}]},{"name":"المجموعة C","teams":[{"name":"البرازيل","flag":"br","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"المغرب","flag":"ma","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"هايتي","flag":"ht","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"إسكتلندا","flag":"gb-sct","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة D","teams":[{"name":"الولايات المتحدة","flag":"us","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"باراغواي","flag":"py","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"أستراليا","flag":"au","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"تركيا","flag":"tr","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة E","teams":[{"name":"ألمانيا","flag":"de","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"كوراساو","flag":"cw","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"ساحل العاج","flag":"ci","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"الإكوادور","flag":"ec","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة F","teams":[{"name":"هولندا","flag":"nl","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"اليابان","flag":"jp","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"السويد","flag":"se","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"تونس","flag":"tn","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة G","teams":[{"name":"بلجيكا","flag":"be","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"مصر","flag":"eg","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"إيران","flag":"ir","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"نيوزيلندا","flag":"nz","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة H","teams":[{"name":"إسبانيا","flag":"es","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"الرأس الأخضر","flag":"cv","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"السعودية","flag":"sa","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"الأوروغواي","flag":"uy","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة I","teams":[{"name":"فرنسا","flag":"fr","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"السنغال","flag":"sn","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"العراق","flag":"iq","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"النرويج","flag":"no","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة J","teams":[{"name":"الأرجنتين","flag":"ar","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"الجزائر","flag":"dz","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"النمسا","flag":"at","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"الأردن","flag":"jo","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة K","teams":[{"name":"البرتغال","flag":"pt","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"الكونغو الديمقراطية","flag":"cd","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"أوزبكستان","flag":"uz","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"كولومبيا","flag":"co","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]},{"name":"المجموعة L","teams":[{"name":"إنجلترا","flag":"gb-eng","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"كرواتيا","flag":"hr","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"غانا","flag":"gh","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0},{"name":"بنما","flag":"pa","played":0,"wins":0,"draws":0,"losses":0,"scored":0,"conceded":0,"goalDifference":0,"points":0}]}]
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, username, password_hash, role, status, created_at) FROM stdin;
6	test_1780786584277	test_1780786584277	$2a$10$rKyX/ybqiSgI4Jt9VF6cKeJH.MM1l.3H7atmqolqkwBI8m83kMs4u	player	pending	2026-06-07 01:56:25.331938
7	screenshot_1780786632713	screenshot_1780786632713	$2a$10$JLsvoGEzHUd9jFWcbSBNl.cyf6zbBtwcVQIlaQcj7RdU/0PPVcf1q	player	approved	2026-06-07 01:57:12.757001
8	ss871354	ss871354	$2a$10$TH1xqRxxE/DNOH1iFiGPi.8VSJUns7ZjwA4lF8CGennTN2fqZ1WxG	player	approved	2026-06-07 02:01:11.393105
9	ss928038	ss928038	$2a$10$9FN.qXoiXJNxoz4ez3NOP.tsSU5NaC6dzmWtIcMmrc6UL1qsI5NM6	player	approved	2026-06-07 02:02:08.072358
10	ss063992	ss063992	$2a$10$Y/0vq/dwhQpRvLDPHE9TwuOiH2bdfEzvhCOagbs8ZhoVGonlG4RNu	player	approved	2026-06-07 02:04:24.035372
1	المدير	admin	$2b$10$Rf2T3dQPjyJEuKRmSIpd9ueKZqO8ttMLPPkDay1e4vDHKw6anaH6m	admin	approved	2026-06-06 23:45:29.830033
\.


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matches_id_seq', 696, true);


--
-- Name: predictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.predictions_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- Name: predictions predictions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_pkey PRIMARY KEY (id);


--
-- Name: predictions predictions_user_id_match_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_user_id_match_id_key UNIQUE (user_id, match_id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (key);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: idx_matches_phase; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_matches_phase ON public.matches USING btree (phase);


--
-- Name: idx_matches_round; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_matches_round ON public.matches USING btree (round);


--
-- Name: idx_matches_stage; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_matches_stage ON public.matches USING btree (stage);


--
-- Name: idx_matches_start_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_matches_start_at ON public.matches USING btree (start_at);


--
-- Name: idx_predictions_match_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_predictions_match_id ON public.predictions USING btree (match_id);


--
-- Name: idx_predictions_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_predictions_user_id ON public.predictions USING btree (user_id);


--
-- Name: idx_users_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_status ON public.users USING btree (status);


--
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_username ON public.users USING btree (username);


--
-- Name: matches matches_result_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_result_approved_by_fkey FOREIGN KEY (result_approved_by) REFERENCES public.users(id);


--
-- Name: predictions predictions_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(id) ON DELETE CASCADE;


--
-- Name: predictions predictions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict AIG6FRfTEfjNItdQhgVsrXch5GH5eUIvOPgI6lqyQF6xrdjXWpGqY1OIYbmOGqg

