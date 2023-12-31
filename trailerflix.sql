DROP DATABASE IF EXISTS trailerflixdb;
CREATE DATABASE `trailerflixdb`;
USE trailerflixdb;

DROP TABLE IF EXISTS `catalogo`;
CREATE TABLE `catalogo` (
	`catalogoId` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`titulo` varchar(100) NOT NULL,
	`resumen` TEXT NOT NULL,
	`poster` varchar(20) NOT NULL,
	`temporadas` varchar(10) NOT NULL DEFAULT 'N/A',
	`trailer` varchar(50),
	`categoriaId` INT NOT NULL,
	PRIMARY KEY (`catalogoId`)
);

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
	`categoriaId` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`categoriaNomre` varchar(50) NOT NULL,
	PRIMARY KEY (`categoriaId`)
);

DROP TABLE IF EXISTS `catalogoGenero`;
CREATE TABLE `catalogoGenero` (
	`catalogoGeneroId` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`catalogoId` INT NOT NULL,
	`generoId` INT NOT NULL,
	PRIMARY KEY (`catalogoGeneroId`)
);

DROP TABLE IF EXISTS `genero`;
CREATE TABLE `genero` (
	`generoId` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`generoNombre` varchar(50) NOT NULL,
	PRIMARY KEY (`generoId`)
);

DROP TABLE IF EXISTS `catalogoReparto`;
CREATE TABLE `catalogoReparto` (
	`catalogoRepartoId` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`catalogoId` INT NOT NULL,
	`repartoId` INT NOT NULL,
	PRIMARY KEY (`catalogoRepartoId`)
);

CREATE TABLE `reparto` (
	`repartoId` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`repartoNombre` varchar(50) NOT NULL,
	PRIMARY KEY (`repartoId`)
);

ALTER TABLE `catalogo` ADD CONSTRAINT `catalogo_fk0` FOREIGN KEY (`categoriaId`) REFERENCES `categoria`(`categoriaId`);

ALTER TABLE `catalogoGenero` ADD CONSTRAINT `catalogoGenero_fk0` FOREIGN KEY (`catalogoId`) REFERENCES `catalogo`(`catalogoId`);

ALTER TABLE `catalogoGenero` ADD CONSTRAINT `catalogoGenero_fk1` FOREIGN KEY (`generoId`) REFERENCES `genero`(`generoId`);

ALTER TABLE `catalogoReparto` ADD CONSTRAINT `catalogoReparto_fk0` FOREIGN KEY (`catalogoId`) REFERENCES `catalogo`(`catalogoId`);

ALTER TABLE `catalogoReparto` ADD CONSTRAINT `catalogoReparto_fk1` FOREIGN KEY (`repartoId`) REFERENCES `reparto`(`repartoId`);

INSERT INTO `categoria` (`categoriaId`,`categoriaNomre`) VALUES 
 (1,'Serie'),
 (2,'Película');
 
 INSERT INTO `genero` (`generoId`,`generoNombre`) VALUES 
 (1,'Drama'),
 (2,'Ciencia Ficción'),
 (3,'Ficción'),
 (4,'Crimen'),
 (5,'Aventura'),
 (6,'Comedia'),
 (7,'Western'),
 (8,'Acción'),
 (9,'Terror'),
 (10,'Suspenso'),
 (11,'Hechos verídicos'),
 (12,'Misterio'),
 (13,'Fantasía'),
 (14,'Sci-Fi'),
 (15,'Familia'),
 (16,'Historia'),
 (17,'Hechos veríficos'),
 (18,'Sucesos'),
 (19,'Tecnología'),
 (20,'Intriga'),
 (21,'¿Ficción?');

INSERT INTO `reparto` (`repartoId`,`repartoNombre`) VALUES 
 (1,'Claire Fox'),
 (2,'Lili Reinhart'),
 (3,'Pedro Pascal'),
 (4,'Tom Hopper'),
 (5,'Anya Taylor-Joy'),
 (6,'Millie Bobby Brown'),
 (7,'Joaquin Phoenix'),
 (8,'Robert Downey Jr.'),
 (9,'Emilia Clarke'),
 (10,'Grant Gustin'),
 (11,'Jim Parsons'),
 (12,'Jennifer Aniston'),
 (13,'Amybeth McNulty'),
 (14,'Gillian Anderson'),
 (15,'Jared Harris'),
 (16,'Evan Rachel Wood'),
 (17,'Lee Pace'),
 (18,'Jessica Chastain'),
 (19,'Margot Robbie'),
 (20,'Stacy Martin'),
 (21,'Dwayne Johnson'),
 (22,'Miranda Cosgrove'),
 (23,'Bill Skarsgård'),
 (24,'Chadwick Boseman'),
 (25,'Christian Bale'),
 (26,'Génesis Rodríguez'),
 (27,'Amy Manson'),
 (28,'Marion Cotillard'),
 (29,'Scarlett Johansson'),
 (30,'Matt Damon'),
 (31,'Alicia Vikander'),
 (32,'Bryce Dallas Howard'),
 (33,'Will Smith'),
 (34,'Ryan Gosling'),
 (35,'John Boyega'),
 (36,'Olivia Colman'),
 (37,'Casey Cott'),
 (38,'Carl Weathers'),
 (39,'David Castañeda'),
 (40,'Thomas Brodie-Sangster'),
 (41,'Henry Cavill'),
 (42,'Robert De Niro'),
 (43,'Chris Evans'),
 (44,'Lena Headey'),
 (45,'Carlos Valdes'),
 (46,'Johnny Galecki'),
 (47,'Courteney Cox'),
 (48,'Geraldine James'),
 (49,'David Duchovny'),
 (50,'Stellan Skarsgård'),
 (51,'Thandie Newton'),
 (52,'Scoot McNairy'),
 (53,'John Malkovich'),
 (54,'Ewan McGregor'),
 (55,'Rhona Mitra'),
 (56,'Kevin Hart'),
 (57,'Kate Walsh'),
 (58,'Michael B. Jordan'),
 (59,'Vincent Piazza'),
 (60,'Luke Allen-Gale'),
 (61,'Florence Pugh'),
 (62,'Domhnall Gleeson'),
 (63,'Chris Pratt'),
 (64,'Alice Braga'),
 (65,'Claire Foy'),
 (66,'Scott Eastwood'),
 (67,'Matt Smith'),
 (68,'Camila Mendes'),
 (69,'Misty Rosas'),
 (70,'Emmy Raver-Lampman'),
 (71,'Harry Melling'),
 (72,'Sam Claflin'),
 (73,'Zazie Beetz'),
 (74,'Mark Ruffalo'),
 (75,'Sophie Turner'),
 (76,'Danielle Panabaker'),
 (77,'Kaley Cuoco'),
 (78,'Lisa Kudrow'),
 (79,'R. H. Thomson'),
 (80,'Mitch Pileggi'),
 (81,'Emily Watson'),
 (82,'Jeffrey Wright'),
 (83,'Mackenzie Davis'),
 (84,'Colin Farrell'),
 (85,'Mary Elizabeth Winstead'),
 (86,'Theo James'),
 (87,'Jack Black'),
 (88,'Omar Epps'),
 (89,'Bill Hader'),
 (90,'Lupita Nyongo'),
 (91,'Caitriona Balfe'),
 (92,'Benjamin Sokolow'),
 (93,'Nina Bergman'),
 (94,'Laurence Fishburne'),
 (95,'David Harbour'),
 (96,'Kristen Wiig'),
 (97,'Oscar Isaac'),
 (98,'Irrfan Khan'),
 (99,'Charlie Tahan'),
 (100,'Jason Clarke'),
 (101,'Cailee Spaeny'),
 (102,'Tobias Menzies'),
 (103,'Marisol Nichols'),
 (104,'Chris Bartlett'),
 (105,'Robert Sheehan'),
 (106,'Moses Ingram'),
 (107,'Helena Bonham Carter'),
 (108,'Frances Conroy'),
 (109,'Chris Hemsworth'),
 (110,'Kit Harington'),
 (111,'Candice Patton'),
 (112,'Simon Helberg'),
 (113,'David Schwimmer'),
 (114,'Corrine Koslo'),
 (115,'Robert Patrick'),
 (116,'Paul Ritter'),
 (117,'Tessa Thompson'),
 (118,'Kerry Bishé'),
 (119,'Common'),
 (120,'Jurnee Smollett'),
 (121,'Peter Ferdinando'),
 (122,'Karen Gillan'),
 (123,'Angus Macfadyen'),
 (124,'James McAvoy'),
 (125,'Danai Gurira'),
 (126,'Josh Lucas'),
 (127,'Emily Bayiokos'),
 (128,'Dominic Mafham'),
 (129,'Jude Law'),
 (130,'O.T. Fagbenle'),
 (131,'Jeff Daniels'),
 (132,'Sonoya Mizuno'),
 (133,'Vincent DOnofrio'),
 (134,'Dash Mihok'),
 (135,'Kyle Chandler'),
 (136,'Jing Tian'),
 (137,'Vanesa Kirby'),
 (138,'Madelaine Petsch'),
 (139,'Rio Hackford'),
 (140,'Aidan Gallagher'),
 (141,'Chloe Pirrie'),
 (142,'Louis Partridge'),
 (143,'Brett Cullen'),
 (144,'Peter Dinklage'),
 (145,'Jesse L. Martin'),
 (146,'Kunal Nayyar'),
 (147,'Matthew Perry'),
 (148,'Dalila Bela'),
 (149,'Tom Braidwood'),
 (150,'Jessie Buckley'),
 (151,'Ed Harris'),
 (152,'Toby Huss'),
 (153,'Geena Davis'),
 (154,'Rosie Perez'),
 (155,'Lia Williams'),
 (156,'Awkwafina'),
 (157,'Jorja Fox'),
 (158,'Isaiah Mustafa'),
 (159,'Martin Freeman'),
 (160,'Noah Jupe'),
 (161,'James Weber Brown'),
 (162,'Kate Winslet'),
 (163,'Rachel Weisz'),
 (164,'Michael Peña'),
 (165,'Corey Johnson'),
 (166,'Omar Sy'),
 (167,'Salli Richardson-Whitfield'),
 (168,'Corey Stoll'),
 (169,'Rinko Kikuchi'),
 (170,'Mädchen Amick'),
 (171,'Giancarlo Esposito'),
 (172,'Elliot Page'),
 (173,'Janina Elkin'),
 (174,'Adeel Akhtar'),
 (175,'Shea Whigham'),
 (176,'Jeremy Renner'),
 (177,'Nikolaj Coster-Waldau'),
 (178,'Tom Cavanagh'),
 (179,'Melissa Rauch'),
 (180,'Matt LeBlanc'),
 (181,'Lucas Jade Zumann'),
 (182,'Bruce Harwood'),
 (183,'Adam Nagaitis'),
 (184,'Luke Hemsworth'),
 (185,'Alana Cavanaugh'),
 (186,'Ioan Gruffudd'),
 (187,'Chris Messina'),
 (188,'Toby Jones'),
 (189,'Nick Jonas'),
 (190,'Enver Gjokaj'),
 (191,'Jay Ryan'),
 (192,'Daniel Kaluuya'),
 (193,'Jon Bernthal'),
 (194,'Lorina Kamburova'),
 (195,'Jennifer Ehle'),
 (196,'William Hurt'),
 (197,'Sean Bean'),
 (198,'Claire Selby'),
 (199,'Nick Robinson'),
 (200,'Willow Smith'),
 (201,'Patrick Fugit'),
 (202,'Burn Gorman'),
 (203,'Mayim Bialik'),
 (204,'Gwyneth Paltrow'),
 (205,'Ray Winstone'),
 (206,'Kate Mara'),
 (207,'Gana Bayarsaikhan'),
 (208,'Judy Greer'),
 (209,'Emma Thompson');

INSERT INTO `catalogo` (`catalogoId`,`poster`,`titulo`,`categoriaId`,`resumen`,`temporadas`,`trailer`) VALUES 
(1,'/posters/1.jpg','The Crown',1,'Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.','4',''),
(2,'/posters/2.jpg','Riverdale',1,'El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.','5',''),
(3,'/posters/3.jpg','The Mandalorian',1,'Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.','2','https://www.youtube.com/embed/aOC8E8z_ifw'),
(4,'/posters/4.jpg','The Umbrella Academy',1,'La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.','1',''),
(5,'/posters/5.jpg','Gambito de Dama',1,'En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.','1',''),
(6,'/posters/6.jpg','Enola Holmes',2,' hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.','N/A',''),
(7,'/posters/7.jpg','Guasón',2,'Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.','N/A','https://www.youtube.com/embed/zAGVQLHvwOY'),
(8,'/posters/8.jpg','Avengers: End Game',2,'Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.','N/A',''),
(9,'/posters/9.jpg','Juego de tronos',1,'En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.','8',''),
(10,'/posters/10.jpg','The Flash',1,'Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.','6',''),
(11,'/posters/11.jpg','The Big Bang Theory',1,'Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.','12','https://www.youtube.com/embed/WBb3fojgW0Q'),
(12,'/posters/12.jpg','Friends',1,'Friends narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.','10',''),
(13,'/posters/13.jpg','Anne with an E',1,'Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.','2',''),
(14,'/posters/14.jpg','Expedientes Secretos X',1,'Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de siniestro','11','https://www.youtube.com/embed/KKziOmsJxzE'),
(15,'/posters/15.jpg','Chernobyl',1,'Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.','1','https://www.youtube.com/embed/s9APLXM9Ei8'),
(16,'/posters/16.jpg','Westworld',1,'Westworld es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.','3','https://www.youtube.com/embed/qLFBcdd6Qw0'),
(17,'/posters/17.jpg','Halt and Catch Fire',1,'Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).','4','https://www.youtube.com/embed/pWrioRji60A'),
(18,'/posters/18.jpg','Ava',2,'Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.','N/A',''),
(19,'/posters/19.jpg','Aves de presa y la fantabulosa emancipación de una Harley Quinn',2,'Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.','N/A',''),
(20,'/posters/20.jpg','Archivo',2,'2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.','N/A','https://www.youtube.com/embed/VHSoCnDioAo'),
(21,'/posters/21.jpg','Jumanji - The next level',2,'Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?','N/A','https://www.youtube.com/embed/rBxcF-r9Ibs'),
(22,'/posters/22.jpg','3022',2,'La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.','N/A','https://www.youtube.com/embed/AGQ7OkmIx4Q'),
(23,'/posters/23.jpg','IT - Capítulo 2',2,'En este segundo capitulo Han pasado 27 años desde que el Club de los Perdedores, formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.','N/A','https://www.youtube.com/embed/hZeFeYSmBcg'),
(24,'/posters/24.jpg','Pantera Negra',2,'TChalla (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.','N/A','https://www.youtube.com/embed/BE6inv8Xh4A'),
(25,'/posters/25.jpg','Contra lo imposible (Ford versus Ferrari)',2,'Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.','N/A','https://www.youtube.com/embed/SOVb0-2g1Q0'),
(26,'/posters/26.jpg','Centígrados',2,'Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.','N/A',''),
(27,'/posters/27.jpg','DOOM: Aniquilación',2,'Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.','N/A','https://www.youtube.com/embed/nat3u3gAVLE'),
(28,'/posters/28.jpg','Contagio',2,'De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.','N/A','https://www.youtube.com/embed/4sYSyuuLk5g'),
(29,'/posters/29.jpg','Viuda Negra',2,'Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.','N/A','https://www.youtube.com/embed/BIn8iANwEog'),
(30,'/posters/30.jpg','The Martian',2,'Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.','N/A','https://www.youtube.com/embed/XvB58bCVfng'),
(31,'/posters/31.jpg','Ex-Machina',2,'Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.','N/A','https://www.youtube.com/embed/XRYL5spvEcI'),
(32,'/posters/32.jpg','Jurassic World',2,'Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.','N/A',''),
(33,'/posters/33.jpg','Soy leyenda',2,'Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.','N/A','https://www.youtube.com/embed/dtKMEAXyPkg'),
(34,'/posters/34.jpg','El primer hombre en la luna',2,'Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.','N/A',''),
(35,'/posters/35.jpg','Titanes del pacífico - La insurrección',2,'Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.','N/A','');
 
INSERT INTO `catalogogenero` (`catalogoGeneroId`,`catalogoId`,`generoId`) VALUES 
 (1,1,1),
 (2,1,11),
 (3,2,1),
 (4,2,12),
 (5,2,3),
 (6,3,2),
 (7,3,13),
 (8,4,2),
 (9,4,13),
 (10,5,1),
 (11,5,3),
 (12,5,18),
 (13,6,3),
 (14,6,1),
 (15,6,12),
 (16,7,4),
 (17,7,10),
 (18,7,1),
 (19,8,5),
 (20,8,14),
 (21,8,8),
 (22,9,5),
 (23,9,13),
 (24,9,1),
 (25,10,2),
 (26,10,13),
 (27,11,6),
 (28,11,13),
 (29,11,3),
 (30,12,6),
 (31,12,15),
 (32,12,1),
 (33,13,1),
 (34,13,15),
 (35,13,7),
 (36,14,1),
 (37,14,2),
 (38,15,1),
 (39,15,11),
 (40,16,7),
 (41,16,2),
 (42,17,3),
 (43,17,1),
 (44,17,19),
 (45,18,8),
 (46,18,1),
 (47,18,10),
 (48,19,8),
 (49,19,3),
 (50,19,6),
 (51,20,8),
 (52,20,14),
 (53,20,10),
 (54,21,6),
 (55,21,3),
 (56,21,5),
 (57,22,2),
 (58,22,10),
 (59,23,9),
 (60,23,10),
 (61,23,13),
 (62,24,8),
 (63,24,5),
 (64,24,13),
 (65,25,1),
 (66,25,16),
 (67,25,5),
 (68,26,1),
 (69,26,10),
 (70,26,20),
 (71,27,8),
 (72,27,14),
 (73,27,9),
 (74,28,1),
 (75,28,10),
 (76,28,21),
 (77,29,1),
 (78,29,8),
 (79,29,5),
 (80,30,1),
 (81,30,14),
 (82,30,5),
 (83,31,1),
 (84,31,14),
 (85,31,10),
 (86,32,10),
 (87,32,5),
 (88,32,3),
 (89,33,1),
 (90,33,9),
 (91,33,3),
 (92,34,1),
 (93,34,17),
 (94,35,8),
 (95,35,13),
 (96,35,14);

INSERT INTO `catalogoreparto` (`catalogoRepartoId`,`catalogoId`,`repartoId`) VALUES 
 (1,1,1),
 (2,1,36),
 (3,1,67),
 (4,1,102),
 (5,1,137),
 (6,1,107),
 (7,2,2),
 (8,2,37),
 (9,2,68),
 (10,2,103),
 (11,2,138),
 (12,2,170),
 (13,3,3),
 (14,3,38),
 (15,3,69),
 (16,3,104),
 (17,3,139),
 (18,3,171),
 (19,4,4),
 (20,4,39),
 (21,4,70),
 (22,4,105),
 (23,4,140),
 (24,4,172),
 (25,5,5),
 (26,5,40),
 (27,5,71),
 (28,5,106),
 (29,5,141),
 (30,5,173),
 (31,6,6),
 (32,6,41),
 (33,6,72),
 (34,6,107),
 (35,6,142),
 (36,6,174),
 (37,7,7),
 (38,7,42),
 (39,7,73),
 (40,7,108),
 (41,7,143),
 (42,7,175),
 (43,8,8),
 (44,8,43),
 (45,8,74),
 (46,8,109),
 (47,8,29),
 (48,8,176),
 (49,9,9),
 (50,9,44),
 (51,9,75),
 (52,9,110),
 (53,9,144),
 (54,9,177),
 (55,10,10),
 (56,10,45),
 (57,10,76),
 (58,10,111),
 (59,10,145),
 (60,10,178),
 (61,11,11),
 (62,11,46),
 (63,11,77),
 (64,11,112),
 (65,11,146),
 (66,11,179),
 (67,11,203),
 (68,12,12),
 (69,12,47),
 (70,12,78),
 (71,12,113),
 (72,12,147),
 (73,12,180),
 (74,13,13),
 (75,13,48),
 (76,13,79),
 (77,13,114),
 (78,13,148),
 (79,13,181),
 (80,14,14),
 (81,14,49),
 (82,14,80),
 (83,14,115),
 (84,14,149),
 (85,14,182),
 (86,15,15),
 (87,15,50),
 (88,15,81),
 (89,15,116),
 (90,15,150),
 (91,15,183),
 (92,16,16),
 (93,16,51),
 (94,16,82),
 (95,16,117),
 (96,16,151),
 (97,16,184),
 (98,17,17),
 (99,17,52),
 (100,17,83),
 (101,17,118),
 (102,17,152),
 (103,17,185),
 (104,18,18),
 (105,18,53),
 (106,18,84),
 (107,18,119),
 (108,18,153),
 (109,18,186),
 (110,19,19),
 (111,19,54),
 (112,19,85),
 (113,19,120),
 (114,19,154),
 (115,19,187),
 (116,20,20),
 (117,20,55),
 (118,20,86),
 (119,20,121),
 (120,20,155),
 (121,20,188),
 (122,21,21),
 (123,21,56),
 (124,21,87),
 (125,21,122),
 (126,21,156),
 (127,21,189),
 (128,22,22),
 (129,22,57),
 (130,22,88),
 (131,22,123),
 (132,22,157),
 (133,22,190),
 (134,23,23),
 (135,23,18),
 (136,23,89),
 (137,23,124),
 (138,23,158),
 (139,23,191),
 (140,24,24),
 (141,24,58),
 (142,24,90),
 (143,24,125),
 (144,24,159),
 (145,24,192),
 (146,25,25),
 (147,25,30),
 (148,25,91),
 (149,25,126),
 (150,25,160),
 (151,25,193),
 (152,26,26),
 (153,26,59),
 (154,26,92),
 (155,26,127),
 (156,27,27),
 (157,27,60),
 (158,27,93),
 (159,27,128),
 (160,27,161),
 (161,27,194),
 (162,28,28),
 (163,28,30),
 (164,28,94),
 (165,28,129),
 (166,28,162),
 (167,28,195),
 (168,28,204),
 (169,29,29),
 (170,29,61),
 (171,29,95),
 (172,29,130),
 (173,29,163),
 (174,29,196),
 (175,29,205),
 (176,30,30),
 (177,30,18),
 (178,30,96),
 (179,30,131),
 (180,30,164),
 (181,30,197),
 (182,30,206),
 (183,31,31),
 (184,31,62),
 (185,31,97),
 (186,31,132),
 (187,31,165),
 (188,31,198),
 (189,31,207),
 (190,32,32),
 (191,32,63),
 (192,32,98),
 (193,32,133),
 (194,32,166),
 (195,32,199),
 (196,32,208),
 (197,33,33),
 (198,33,64),
 (199,33,99),
 (200,33,134),
 (201,33,167),
 (202,33,200),
 (203,33,209),
 (204,34,34),
 (205,34,65),
 (206,34,100),
 (207,34,135),
 (208,34,168),
 (209,34,201),
 (210,35,35),
 (211,35,66),
 (212,35,101),
 (213,35,136),
 (214,35,169),
 (215,35,202);