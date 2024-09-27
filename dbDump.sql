--
-- Database "book_store" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: book_store; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE book_store WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE book_store OWNER TO postgres;

\connect book_store

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
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    author_id bigint NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.author_author_id_seq OWNER TO postgres;

--
-- Name: author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_author_id_seq OWNED BY public.author.author_id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    book_id bigint NOT NULL,
    book_name text NOT NULL,
    authors_id bigint NOT NULL,
    description text,
    image_path text,
    price real DEFAULT 0 NOT NULL,
    rating real DEFAULT 0 NOT NULL,
    year smallint NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_book_id_seq OWNER TO postgres;

--
-- Name: book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_book_id_seq OWNED BY public.book.book_id;


--
-- Name: book_category_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_category_mapping (
    record_id bigint NOT NULL,
    book_id bigint NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.book_category_mapping OWNER TO postgres;

--
-- Name: book_category_mapping_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_category_mapping_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_category_mapping_record_id_seq OWNER TO postgres;

--
-- Name: book_category_mapping_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_category_mapping_record_id_seq OWNED BY public.book_category_mapping.record_id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    cart_id bigint NOT NULL,
    user_id integer NOT NULL,
    book_id bigint NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_cart_id_seq OWNER TO postgres;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(50) DEFAULT 'USER'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: table_name_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_name_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.table_name_user_id_seq OWNER TO postgres;

--
-- Name: table_name_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_name_user_id_seq OWNED BY public.users.user_id;


--
-- Name: author author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN author_id SET DEFAULT nextval('public.author_author_id_seq'::regclass);


--
-- Name: book book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN book_id SET DEFAULT nextval('public.book_book_id_seq'::regclass);


--
-- Name: book_category_mapping record_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_category_mapping ALTER COLUMN record_id SET DEFAULT nextval('public.book_category_mapping_record_id_seq'::regclass);


--
-- Name: cart cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.table_name_user_id_seq'::regclass);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (author_id, first_name, last_name) FROM stdin;
3	Джордж	Оруэлл
1	Эрнест	Хэмингуэй
5	Лев	Толстой
2	Стивен	Кинг
6	Ребекка	Ярос
7	Агата	Кристи
8	Харуки	Мураками
9	Мосян	Тунсю
10	Антуан	де Сент-Экзюпери
11	Джоан	Роулинг
12	Анджей	Сапковский
13	Юкио	Мисима
14	Френк	Герберт
15	Джордж	Мартин
16	Френсис	Бернетт
17	Надежда	Мелешко
4	Чарльз	Диккенс
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (book_id, book_name, authors_id, description, image_path, price, rating, year) FROM stdin;
5	Фиеста	1	Своеобразный литературный манифест "потерянного поколения" 20-х годов XX века.\n\nНервная, жесткая, блистательная и невероятно смелая для своего времени история о мужчинах, способных не любить, но лишь страдать, – и женщинах, жаждущих не страдать, а любить.\n\nВеликая книга, которую до сих пор невозможно читать без боли и сопереживания!	/static/images/book-images/фиеста.png	11.85	0	2022
4	Прощай, оружие!	1	Роман, прославивший Эрнеста Хемингуэя…\n\nПервая – и лучшая! – книга "потерянного поколения" англоязычной литературы о Первой мировой…\n\nКнига о войне, на которой наивные мальчишки становились "пушечным мясом" – и либо гибли, либо ожесточались до предела.\n\nО войне, где любовь – лишь краткий миг покоя, не имеющий ни прошлого, ни будущего…	/static/images/book-images/прощай_оружие.png	21	0	2022
15	Рождественские истории	4	"Рождественские истории" были задуманы Диккенсом как социальная проповедь, и в 40-е годы XIX века каждый год под Рождество выходила в свет одна из пяти повестей. Посредством художественных образов автор обращался и к бедным, и к богатым читателям, радея за улучшение доли одних и "нравственное исправление" других.\n\nРезультатом стал цикл из пяти произведений, переведенных на все мировые языки, неоднократно экранизированных и ставших поистине бессмертной классикой мировой литературы. Цикл, в котором смешиваются сказка и быль, фантастика и реальность, действуют, наряду с людьми, мифологические и фольклорные персонажи, а в финале Добро непременно побеждает Зло, торжествует добродетель и карается порок.\n\nИ нам, детям и взрослым, очень хочется верить, что рождественские чудеса действительно случаются...	/static/images/book-images/рождественские_истории.png	16.69	0	2023
11	1984	3	Своеобразный антипод второй великой антиутопии XX века "О дивный новый мир" Олдоса Хаксли. Что, в сущности, страшнее: доведенное до абсурда "общество появления" или доведенное до абсолюта "общество идеи"?\n\nПо Оруэллу, нет и не может быть ничего ужаснее тотальной несвободы...	/static/images/book-images/1984.png	67.01	0	2023
8	Сияние	2	Джек Торренс устраивается на работу зимнего сторожа в горный отель "Оверлук" и переезжает туда со своей семьей: женой Венди и пятилетним сыном Денни. Шикарный на первый взгляд отель имеет дурную славу: в нем происходят странные и жуткие вещи, с которыми героям предстоит столкнуться лицом к лицу.\n\nТекст произведения снабжен грамматическим комментарием и словарем, в который вошли слова, содержащиеся в тексте. Благодаря этому книга подойдет для любого уровня владения английским языком.	/static/images/book-images/сияние.png	33.33	4.85	2016
6	Оно	2	В маленьком провинциальном городке Дерри много лет назад семерым подросткам пришлось столкнуться с кромешным ужасом – живым воплощением ада. Прошли годы... Подростки повзрослели, и ничто, казалось, не предвещало новой беды. Но кошмар прошлого вернулся, неведомая сила повлекла семерых друзей назад, в новую битву со Злом. Ибо в Дерри опять льется кровь и бесследно исчезают люди. Ибо вернулось порождение ночного кошмара, настолько невероятное, что даже не имеет имени...	/static/images/book-images/оно.png	44.06	4.78	2012
2	Праздник, который всегда с тобой	1	Париж "веселых двадцатых"... Город, вдохновивший сотни писателей, актеров, художников, слетевшихся сюда из разных уголков мира... Завораживающая, полная драматизма и романтических безумств жизнь международной богемы... Это – "Праздник, который всегда с тобой", поразительная летопись времени, города и целого поколения, созданная одним из героев эпохи – Эрнестом Хемигнуэем.	/static/images/book-images/праздник_который_всегда_с_тобой.png	15.65	4.2	2016
7	Кладбище домашних животных	2	Роман, который сам Кинг, считая "слишком страшным", долго не хотел отдавать в печать, но только за первый год было продано 657 000 экземпляров! Также роман лег в основу одноименного фильма Мэри Ламберт (где Кинг, кстати, сыграл небольшую роль).\n\nКазалось бы, семейство Крид – это настоящее воплощение "американской мечты": отец – преуспевающий врач, красавица мать, прелестные дети. Для полной идиллии им не хватает лишь большого старинного дома, куда они вскоре и переезжают.\n\nНо идиллия вдруг стала превращаться в кошмар. Потому что в окружающих их новое жилище вековых лесах скрывается НЕЧТО, более ужасное, чем сама смерть и... более могущественное.\n\nЧитайте легендарный роман Стивена Кинга "КлаТбище домашних жЫвотных" – в новом переводе и впервые без сокращений!	/static/images/book-images/кладбище_домашних_животных.png	25.68	5	2021
13	Повесть о двух городах	4	Роман Чарльза Диккенса "Повесть о двух городах" – один из самых популярных англоязычных романов – стал бестселлером задолго до возникновения самого термина. Только на языке оригинала напечатано более двухсот миллионов экземпляров.\n\nЭто история неистовых страстей и захватывающих приключений в "эпоху перемен", которыми отозвалась в двух великих городах Лондоне и Париже Великая французская революция. Камера в Бастилии и гильотина в ту пору были столь же реальны, как посиделки у камина и кружевные зонтики, а любовь и упорная ненависть, трогательная преданность, самопожертвование и гнусное предательство составили разные грани мира диккенсовских персонажей.	/static/images/book-images/повесть_о_двух_городах.png	10.62	0	2024
9	Зеленая миля	2	Стивен Кинг приглашает читателей в жуткий мир тюремного блока смертников, откуда уходят, чтобы не вернуться, приоткрывает дверь последнего пристанища тех, кто преступил не только человеческий, но и Божий закон.\n\nПо эту сторону электрического стула нет более смертоносного местечка! Ничто из того, что вы читали раньше, не сравнится с самым дерзким из ужасных опытов Стивена Кинга – с историей, что начинается на Дороге Смерти и уходит в глубины самых чудовищных тайн человеческой души...	/static/images/book-images/зеленая_миля.png	44.06	5	2020
16	Дэвид Копперфилд	4	Один из лучших романов Чарльза Диккенса, его "любимое детище" и в значительной степени автобиографическое произведение, полное очарования старой доброй Англии.\n\nДэвид Копперфилд появляется на свет через несколько месяцев после смерти отца. Он начинает свою жизнь под присмотром доброй няни и окруженный любовью матери. Однако еще мальчиком встречает на своем пути зависть и злобу и вынужден познать человеческую жестокость, горе и разочарование. Преодолеть преграды и вытерпеть многочисленные лишения Дэвиду Копперфилду помогает чистота души, ясность мысли, величие помыслов. Герой романа рассказывает о себе, о дорогих ему людях и случившихся с ними событиях.	/static/images/book-images/дэвид_копперфилд.png	25.24	0	2023
18	Повести и рассказы	5	В сборник включены повести и рассказы позднего Толстого: "Холстомер", "Смерть Ивана Ильича", "Крейцерова соната", "После бала" и другие.\n\nДля старшего школьного возраста.	/static/images/book-images/повести_и_рассказы.png	15.73	0	2022
12	Большие надежды	4	Творчество Чарльза Диккенса – классика английской литературы – целая эпоха в развитии национальной культуры Англии. Почитаемый во всем мире, большой любовью и признанием Диккенс всегда пользовался и в России. Своим любимым писателем его называл Ф. М. Достоевский. Л. Н. Толстой ставил романы Диккенса в первый ряд мировой литературы, считая, что они отвечают основным требованиям, которые следует предъявлять к произведениям искусства: им присущи значительность содержания, мастерство формы, искренность и "нравственное отношение автора к предмету".\n\nВ романе "Большие надежды" – одном из последних произведений Диккенса, жемчужине его творчества – рассказана история жизни и крушения надежд молодого Филиппа Пиррипа, прозванного в детстве Пипом. Мечты Пипа о карьере, любви и благополучии в "мире джентльменов" разбиваются в один миг, едва он узнает страшную тайну своего неизвестного покровителя, которого преследует полиция. Деньги, окрашенные кровью и отмеченные печатью преступления, как убеждается Пип, не могут принести счастья. Но что в таком случае может? И куда заведут героя его мечты и большие надежды?	/static/images/book-images/большие_надежды.png	9.39	0	2023
10	11/22/63	2	...Убийство президента Кеннеди стало самым трагическим событием американской истории ХХ века. Тайна его до сих пор не раскрыта. Но что, если случится чудо? Если появится возможность отправиться в прошлое и предотвратить катастрофу? Это предстоит выяснить обычному учителю из маленького городка Джейку Эппингу, получившему доступ к временному порталу. Его цель – спасти Кеннеди. Но какова будет цена спасения?	/static/images/book-images/11_22_63.png	29.15	5	2019
1	По ком звонит колокол	1	"По ком звонит колокол" – один из лучших романов Эрнеста Хемингуэя.\n\nЭта книга о гражданской войне в Испании. Эта книга о Войне, какая она есть на самом деле – грязная, кровавая, бесчеловечная...\n\nЭта книга о любви, мужестве, самопожертвовании, нравственном долге и выборе, ценности каждой человеческой жизни как части единого целого, ибо "никогда не посылай узнать по ком звонит колокол, он звонит и по тебе"...\n\nВ СССР роман издавался с серьезными сокращениями и искажениями из-за вмешательства идеологической цензуры и теперь публикуется в полном объеме.	/static/images/book-images/по_ком_звонит_колокол.png	15.99	0	2022
17	Война и мир. Компл. из 2-х книг	5	Роман Льва Николаевича Толстого "Война и мир" – книга на все времена. Кажется, что она существовала всегда, настолько знакомым кажется текст, едва мы открываем первые страницы романа, настолько памятны многие его эпизоды: охота и святки, первый бал Наташи Ростовой, лунная ночь в Отрадном, князь Андрей в сражении при Аустерлице... Сцены "мирной", семейной жизни сменяются картинами, имеющими значение для хода всей мировой истории, но для Толстого они равноценны, связаны в едином потоке времени. Каждый эпизод важен не только для развития сюжета, но и как одно из бесчисленных проявлений жизни, которая насыщена в каждом своём моменте и которую учит любить Толстой.\n\nВ данном издании воспроизводится полный комплект иллюстраций к роману "Война и мир", созданных выдающимся чешским художником Станиславом Гудечеком (1872-1947).	/static/images/book-images/война_и_мир_2_тома.png	54.64	0	2023
14	Холодный дом	4	В центре действия романа – история юной сироты Эстер Саммерсон. Оказавшись на попечении случайного благодетеля мистера Джарндиса, она по окончании учебы в пансионе попадает в его старинное поместье, известное как Холодный дом, с которым связано едва ли не самое известное дело "Джарндисы против Джарндисов", длящееся уже 50 лет. Обживаясь на новом месте, девушка волею обстоятельств оказывается вовлечена в сложное переплетение человеческих судеб, личных чувств, криминальных интриг и чужих семейных тайн – и одна из этих тайн, как вскоре выясняется, имеет прямое отношение к самой Эстер...	/static/images/book-images/холодный_дом.png	27.66	0	2024
3	Старик и море. Зеленые холмы Африки	1	"Старик и море". Повесть посвящена "трагическому стоицизму": перед жестокостью мира человек, даже проигрывая, должен сохранять мужество и достоинство.\n\nАвтобиографическая повесть "Зеленые холмы Африки" – одно из произведений, заложивших основу мифа о "папе Хэме" – смелом до безумия авантюристе-интеллектуале, любимце женщин, искателе сильных ощущений и новых впечатлений.	/static/images/book-images/старик_и_море_зеленые_холмы_африки.png	16.01	5	2019
\.


--
-- Data for Name: book_category_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_category_mapping (record_id, book_id, category_id) FROM stdin;
1	1	1
2	1	3
3	2	3
4	3	1
5	3	3
6	4	3
7	5	3
8	6	1
9	6	2
10	6	5
11	6	6
12	7	3
13	7	5
14	7	8
15	8	1
16	8	3
17	8	5
18	9	1
19	9	3
20	9	5
21	10	3
22	10	5
23	11	3
24	12	3
25	13	3
26	14	3
27	15	3
28	16	3
29	17	3
30	18	3
31	18	9
32	17	19
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (cart_id, user_id, book_id) FROM stdin;
1	3	15
2	3	11
3	3	6
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, category_name) FROM stdin;
1	Бестселлеры
2	Главные новинки
3	Художественная литература
4	Нехудожественная литература
5	Фентези и фантастика
6	Новинки
7	Скоро в продаже
8	Распродажа
9	Детская литература
10	Бизнес-литература
11	Учебная-литература
12	Бел
13	Психология
14	Комиксы и манга
15	Изучение иностранных языков
16	Медицина
17	Кулинария и напитки
18	Электронные книги
19	Комплекты книг
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, role) FROM stdin;
2	username	$2a$10$3MNshvpDmlsXLGgI/WW2e.JQMjTtAYN.Xbc5SDjUhmfqqh6bz6TvW	USER
3	art	$2a$10$mAbDIj8twokpZ3yk6yPhUuU10xhl0L3hvgBWTWAPwKXTLk3D38iJS	USER
11	qwe	$2a$10$t8uFbxgytTqBRLbqBUMFtOc1l04lPLygOx4tKZsV26jtfG.Hmq8ly	USER
12	sss	$2a$10$HEeLM4ypq78nM5E5p.v3ROI8AFOPkZvLbeo8kKwqrRaoXRf3tUZk6	USER
14	zxc	$2a$10$x8vWeTSRtAJ.oLY15GpPueqC.3IAGjpf3ZEfUU3g9ame7c0aR2S9W	USER
15	vvv	$2a$10$dfsHoYwpTKjkQeBMQF7qaupkNjyTM4X5EmGC7y.lSTjZR.uUkNi..	USER
16	ccc	$2a$10$GSgT8i2biEBvg5qBvsqAe.XuwjWzYvb0Jle8m8Je/OouA.smNUgJS	USER
17	lll	$2a$10$rvym5Xz/.A1..J2qhK6HR.ZSf7Mx3Q.SVim1ZrBSFFtU2iPvgnHo6	USER
18	bvb	$2a$10$mDI96Vfc6J6H3JM8f1H9FOq/R52mHhE3fTAZyzIHu6sctQt0kC9zK	USER
19	cvc	$2a$10$SsRS7bSo4p2h3aH425v9D.rcuVcM7s0dhdqJHXcV95zXi1dHVTCGC	USER
\.


--
-- Name: author_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_author_id_seq', 17, true);


--
-- Name: book_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_book_id_seq', 18, true);


--
-- Name: book_category_mapping_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_category_mapping_record_id_seq', 32, true);


--
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 3, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 19, true);


--
-- Name: table_name_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_name_user_id_seq', 19, true);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- Name: book_category_mapping book_category_mapping_book_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_category_mapping
    ADD CONSTRAINT book_category_mapping_book_id_category_id_key UNIQUE (book_id, category_id);


--
-- Name: book_category_mapping book_category_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_category_mapping
    ADD CONSTRAINT book_category_mapping_pkey PRIMARY KEY (record_id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: users table_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT table_name_pkey PRIMARY KEY (user_id);


--
-- Name: users table_name_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT table_name_username_key UNIQUE (username);


--
-- Name: book book_authors_author_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_authors_author_id_fk FOREIGN KEY (authors_id) REFERENCES public.author(author_id);


--
-- Name: book_category_mapping book_category_mapping_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_category_mapping
    ADD CONSTRAINT book_category_mapping_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id);


--
-- Name: book_category_mapping book_category_mapping_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_category_mapping
    ADD CONSTRAINT book_category_mapping_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- PostgreSQL database dump complete
--