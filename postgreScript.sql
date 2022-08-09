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
18	AABE9307B3294068808E51C5B172EE1D@te.hepsiemlak.com	abdussamet.dogan23@gmail.com	"HEPSİEMLAK" <no-reply@te.hepsiemlak.com>	"anakra" isimli aramanıza uygun yeni ilanlar eklendi		2022-08-08
19	BDF177ED44884BD3BB13A7BC4DC9E34A@te.hepsiemlak.com	abdussamet.dogan23@gmail.com	"HEPSİEMLAK" <no-reply@te.hepsiemlak.com>	"anakra" isimli aramanıza uygun yeni ilanlar eklendi		2022-08-07
20	3335DFBC1E734C7AA689BF23B835D18E@te.hepsiemlak.com	abdussamet.dogan23@gmail.com	"HEPSİEMLAK" <no-reply@te.hepsiemlak.com>	"anakra" isimli aramanıza uygun yeni ilanlar eklendi		2022-08-06
21	CAJuYzjYOpEJs6B=_m6CYpA_uM_YOZajwUtnkH=YROCgCZ8vtDQ@mail.gmail.com	abdussamet.dogan23@gmail.com	"Samet Dogan" <s.doqann1570@gmail.com>	Test Basligi	Bu bir test mesajidir.\r\n	2022-08-05
22	0D7492B6EC8B41DCBE9A617C611D6DAF@te.hepsiemlak.com	abdussamet.dogan23@gmail.com	"HEPSİEMLAK" <no-reply@te.hepsiemlak.com>	"anakra" isimli aramanıza uygun yeni ilanlar eklendi		2022-08-05
23	E132241DB7BD4D268F64BC3902E8DC9B@te.hepsiemlak.com	abdussamet.dogan23@gmail.com	"HEPSİEMLAK" <no-reply@te.hepsiemlak.com>	"anakra" isimli aramanıza uygun yeni ilanlar eklendi		2022-08-04
24	F10B836EEC154F8A88F735B3EB987BFB@te.hepsiemlak.com	abdussamet.dogan23@gmail.com	"HEPSİEMLAK" <no-reply@te.hepsiemlak.com>	"anakra" isimli aramanıza uygun yeni ilanlar eklendi		2022-08-03
25	18F0187C7AD24009B650AFCE57C97322@te.hepsiemlak.com	abdussamet.dogan23@gmail.com	"HEPSİEMLAK" <no-reply@te.hepsiemlak.com>	"anakra" isimli aramanıza uygun yeni ilanlar eklendi		2022-08-02
26	6n6EKOeKslBldwIVAenriA@notifications.google.com	abdussamet.dogan23@gmail.com	"Google" <no-reply@accounts.google.com>	Güvenlik uyarısı	[image: Google]\r\nHesabınızda oturum açmak için uygulama şifresi oluşturuldu\r\n\r\n\r\nabdussamet.dogan23@gmail.com\r\nWindows Bilgisayar cihazımda Posta için bu şifreyi siz oluşturmadıysanız\r\nbirisi hesabınızı kullanıyor olabilir. Hesabınızı şimdi kontrol edip\r\ngüvenliğini sağlayın.\r\nEtkinliği kontrol et\r\n<https://accounts.google.com/AccountChooser?Email=abdussamet.dogan23@gmail.com&continue=https://myaccount.google.com/alert/nt/1659343353937?rfn%3D20%26rfnc%3D1%26eid%3D-2621327601681988413%26et%3D0>\r\nGüvenlik etkinliğini şu sayfada da görebilirsiniz:\r\nhttps://myaccount.google.com/notifications\r\nBu e-posta sizi Google Hesabınız ve hizmetlerinizdeki önemli değişiklikler\r\nhakkında bilgilendirmek için gönderilmiştir.\r\n© 2022 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n	2022-08-01
27	SPcnG1S2sg-EkUbgT2CHGA@notifications.google.com	abdussamet.dogan23@gmail.com	"Google" <no-reply@accounts.google.com>	Güvenlik uyarısı	[image: Google]\r\nOturum açmak için kullanılan uygulama şifresi kaldırıldı\r\n\r\n\r\nabdussamet.dogan23@gmail.com\r\nBu şifreyi siz kaldırmadıysanız birisi hesabınızı kullanıyor olabilir.\r\nHesabınızı şimdi kontrol edip güvenliğini sağlayın.\r\nEtkinliği kontrol et\r\n<https://accounts.google.com/AccountChooser?Email=abdussamet.dogan23@gmail.com&continue=https://myaccount.google.com/alert/nt/1659343347757?rfn%3D269%26rfnc%3D1%26eid%3D7842123945664153466%26et%3D0>\r\nGüvenlik etkinliğini şu sayfada da görebilirsiniz:\r\nhttps://myaccount.google.com/notifications\r\nBu e-posta sizi Google Hesabınız ve hizmetlerinizdeki önemli değişiklikler\r\nhakkında bilgilendirmek için gönderilmiştir.\r\n© 2022 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n	2022-08-01
28	juLdSP4omzICd_RPq5W5JQ@notifications.google.com	abdussamet.dogan23@gmail.com	"Google" <no-reply@accounts.google.com>	Güvenlik uyarısı	[image: Google]\r\nHesabınızda oturum açmak için uygulama şifresi oluşturuldu\r\n\r\n\r\nabdussamet.dogan23@gmail.com\r\nWindows Bilgisayar cihazımda Posta için bu şifreyi siz oluşturmadıysanız\r\nbirisi hesabınızı kullanıyor olabilir. Hesabınızı şimdi kontrol edip\r\ngüvenliğini sağlayın.\r\nEtkinliği kontrol et\r\n<https://accounts.google.com/AccountChooser?Email=abdussamet.dogan23@gmail.com&continue=https://myaccount.google.com/alert/nt/1659099223230?rfn%3D20%26rfnc%3D1%26eid%3D-101746842645387022%26et%3D0>\r\nGüvenlik etkinliğini şu sayfada da görebilirsiniz:\r\nhttps://myaccount.google.com/notifications\r\nBu e-posta sizi Google Hesabınız ve hizmetlerinizdeki önemli değişiklikler\r\nhakkında bilgilendirmek için gönderilmiştir.\r\n© 2022 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n	2022-07-29
29	nzx3YpXuOTU7I4IC09uF8g@notifications.google.com	abdussamet.dogan23@gmail.com	"Google" <no-reply@accounts.google.com>	Güvenlik uyarısı	[image: Google]\r\nWindows cihazında yeni oturum açma işlemi\r\n\r\n\r\nabdussamet.dogan23@gmail.com\r\nWindows cihazında Google Hesabınızda yeni bir oturum açma işlemi tespit\r\nettik. Bu işlem size aitse herhangi bir şey yapmanız gerekmez. İşlem size\r\nait değilse hesabınızı güven altına almanıza yardımcı oluruz.\r\nEtkinliği kontrol et\r\n<https://accounts.google.com/AccountChooser?Email=abdussamet.dogan23@gmail.com&continue=https://myaccount.google.com/alert/nt/1659099127000?rfn%3D325%26rfnc%3D1%26eid%3D-4402579866190267995%26et%3D0>\r\nGüvenlik etkinliğini şu sayfada da görebilirsiniz:\r\nhttps://myaccount.google.com/notifications\r\nBu e-posta sizi Google Hesabınız ve hizmetlerinizdeki önemli değişiklikler\r\nhakkında bilgilendirmek için gönderilmiştir.\r\n© 2022 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n	2022-07-29
30	CAJuYzjYwQ25hTjvg3Bf4udx-PBX7L3nCvECsRPob=EEz7D7O0A@mail.gmail.com	abdussamet.dogan23@gmail.com	"Samet Dogan" <s.doqann1570@gmail.com>	Deneme	Bu bir test mesajidir.\r\n	2022-07-29
31	60f1e024716003cfec9660c367e81f68101557df-20079894-111028676@google.com	abdussamet.dogan23@gmail.com	"The Google Account Team" <google-noreply@google.com>	Sayın Abdussamet, lütfen Google Hesabı ayarlarınızı inceleyin	\r\nMerhaba Abdussamet,\r\n\r\nYeni kişisel bilgisayarınızda Google'a hoş geldiniz. İşte başlamanız için bazı faydalı bilgiler.\r\n\r\nHesabınızı kontrol edin\r\n\r\nSizin için doğru olanı seçin. Gizlilik ve güvenlik ayarlarınızı istediğiniz zaman inceleyip düzenleyin\r\n\r\nGoogle Hesabı <https://notifications.google.com/g/p/APNL1Tg5D6eVBsd_EBWN9MxM29Dx_hh5ncNYWkb0_vDLBqkOSRYlAmqbEHZdNxneSKj6t4Ig5wHhGsZmEC2oSnmWMECJNI95Smq2SnG-az3Yg4XszdRImzKRN7t0cgcbMqDGanKJXiNRU_HLq_B8rfqtrMM72TBl2lj23qCjhCc3PWAJawP5IqCNhhaqjGRyvac>\r\n\r\nGoogle Chrome ile web'de güvende kalın\r\n\r\nEn son güvenlik özelliklerine ve düzeltmelere sahip olmanız için Chrome her altı haftada bir otomatik olarak güncellenir\r\n\r\nChrome'u indirin <https://notifications.google.com/g/p/APNL1TgMSPMifZ1FXEc0O4lByghnQZHyy6hQ9XmYWGxSrzOoHySlSo5T6A0tQFsCFeoA1Pe_W_fv9zkbqQHdKl9duE__r_zEX9hQk_8lxdMjyqAXvvVeJKsY0mVfop3UAa2D_-9b6To2VC1XL4KXBhwT7ME9kqQP7HQtm2MKthKVM58SW7yoYyjdYFQkYO0tljCTy3w-1UysFsntXC0iRj65R_MNfFdeOmNH4_J1qFVWmvnS>\r\n\r\nGoogle Hesabınızdan en iyi şekilde yararlanın\r\n\r\nGoogle'dan size kişiselleştirilmiş ipuçları, haberler ve öneriler göndereceğiz.\r\n\r\nEvet, lütfen bana güncel bilgileri gönderin <https://notifications.google.com/g/p/APNL1ThkYqxAKFVqClIoa4w5LafdO1Sjemo0h5IXge_A1bfl6uHxv0jFauhoVeFuzP1YCCDGBBlLTx3CIvJ8Ev8XsYQ_Z1_6cbqIev2vRKTtK3aJ3q9bttrkSKbcFr_0QW8WsihJshx8Lslh5xOD6FDSmwrAgTi9fzgt8nxm5Bdwuby-extmaO4JAph18k5y4tj1SaEUGpqZfZuqZXVXiqtTaQeWTeL-pAShwmQVUfiulOYKSZNvgyf_z26k7KzImi14gHlF0lg1e3tSGP3kZd_R_0k0AykTcWvJtRFNAfxHVE5bkXKrUrEUYO7o1PVJ9eE>\r\n\r\nBu e-posta, yakın zamanda Windows cihazınızdan Google Hesabınızda oturum açtığınız için abdussamet.dogan23@gmail.com <abdussamet.dogan23@gmail.com> adresine gönderilmiştir. Yeni cihazınızdan hesabınızda ilk kez oturum açarken Google ile söz konusu cihazın kurulumunu yapmanıza yardımcı olacak e-postalar almak istemiyorsanız lütfen e-posta listesinden çıkın <https://notifications.google.com/g/p/APNL1Ti1wClOXxanuJwJdWrzkZOMWUgYTHQXGyItO3KsHycNbHa134VmDT-0wmu7UifdT7Qb8Vsrjgi2X3rwHEogKMxt3q6UV-AJQKNXVBlba_cZhpBg7ZnmcjhhbIB96dvsn0TVtnxSqCV9cYqknvg0GGTUgZXggDmmnHK6sqVtOPtYfzkZEDWqbAjRS5GfD3WruuMtsHITslsUj-OOtYWw_lAugDZbVs1o4RWOn37IL4YMhuIhm7QRZyP1Daw5FnnY5dcK9lvRF9qw82PcVJbpiu7ye0CMom0abhi-ndAEOeNNavjncX8YfCH9rltVlxJA>.\r\n\r\n© 2022 Google LLC 1600 Amphitheatre Parkway, Mountain View, CA 94043\r\n	2022-07-29
32	4cpWWEmfjuNX0zi7gQI1qA@notifications.google.com	abdussamet.dogan23@gmail.com	"Google" <no-reply@accounts.google.com>	Güvenlik uyarısı	[image: Google]\r\nWindows cihazında yeni oturum açma işlemi\r\n\r\n\r\nabdussamet.dogan23@gmail.com\r\nWindows cihazında Google Hesabınızda yeni bir oturum açma işlemi tespit\r\nettik. Bu işlem size aitse herhangi bir şey yapmanız gerekmez. İşlem size\r\nait değilse hesabınızı güven altına almanıza yardımcı oluruz.\r\nEtkinliği kontrol et\r\n<https://accounts.google.com/AccountChooser?Email=abdussamet.dogan23@gmail.com&continue=https://myaccount.google.com/alert/nt/1659078920000?rfn%3D325%26rfnc%3D1%26eid%3D2823809321696427357%26et%3D0>\r\nGüvenlik etkinliğini şu sayfada da görebilirsiniz:\r\nhttps://myaccount.google.com/notifications\r\nBu e-posta sizi Google Hesabınız ve hizmetlerinizdeki önemli değişiklikler\r\nhakkında bilgilendirmek için gönderilmiştir.\r\n© 2022 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n	2022-07-29
33	kffXLd_3nJQNsoBNIQYtNg@notifications.google.com	abdussamet.dogan23@gmail.com	"Google" <no-reply@accounts.google.com>	2 Adımlı Doğrulama açıldı	[image: Google]\r\n2 Adımlı Doğrulama açıldı\r\n\r\n\r\nabdussamet.dogan23@gmail.com\r\n\r\nGoogle Hesabınız (abdussamet.dogan23@gmail.com) artık 2 Adımlı Doğrulama\r\nile korunuyor. Yeni veya güvenilir olmayan bir cihazda oturum açtığınızda,\r\nkimliğinizi doğrulamak için ikinci faktörünüze ihtiyacınız olacaktır.\r\n\r\n*Hesabınıza ulaşamama sorunu yaşamayın!*\r\nİkinci faktörünüz yanınızda değilken kullanmak üzere bir yedek telefon\r\nekleyebilir veya yedek kodlar alabilirsiniz.\r\nDeğişiklik yapmak için 2 Adımlı Doğrulama ayarlarınızı inceleyebilirsiniz\r\n<https://accounts.google.com/AccountChooser?Email=abdussamet.dogan23@gmail.com&continue=https://myaccount.google.com/signinoptions/two-step-verification?rfn%3D16%26rfnc%3D1%26eid%3D40843034613890004%26et%3D0>\r\n.\r\nGüvenlik etkinliğini şu sayfada da görebilirsiniz:\r\nhttps://myaccount.google.com/notifications\r\nBu e-posta sizi Google Hesabınız ve hizmetlerinizdeki önemli değişiklikler\r\nhakkında bilgilendirmek için gönderilmiştir.\r\n© 2022 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n	2022-05-27
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

