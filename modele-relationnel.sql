CREATE DATABASE evaluation_5;
USE evaluation_5;

CREATE TABLE Administrators (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
fullname VARCHAR(100) NOT NULL,
role VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
passwd VARCHAR(32) NOT NULL
);

CREATE TABLE Cinemas (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
signboard VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL
);

CREATE TABLE Acces (
admin_id INT(11) NOT NULL,
cinema_id INT(11) NOT NULL,
PRIMARY KEY (admin_id, cinema_id),
FOREIGN KEY (admin_id) REFERENCES Administrators(id) ON DELETE CASCADE,
FOREIGN KEY (cinema_id) REFERENCES Cinemas(id) ON DELETE CASCADE
);

CREATE TABLE Rooms (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
room_number INT(11) NOT NULL,
seats INT(100) NOT NULL,
cinema INT(11) NOT NULL,
FOREIGN KEY (cinema) REFERENCES Cinemas(id) ON DELETE CASCADE
);

CREATE TABLE Movies (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
type VARCHAR(100) NOT NULL,
director VARCHAR(100) NOT NULL,
description TEXT(500) NOT NULL,
releaseDate DATE NOT NULL,
duration SMALLINT NOT NULL
);

CREATE TABLE Sessions (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
start_at DATETIME NOT NULL,
room INT(11) NOT NULL,
movie INT(11) NOT NULL,
FOREIGN KEY (room) REFERENCES Rooms(id) ON DELETE CASCADE,
FOREIGN KEY (movie) REFERENCES Movies(id) ON DELETE CASCADE
);

CREATE TABLE Rates (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
amount DECIMAL(10,2) NOT NULL,
public VARCHAR(100) NOT NULL,
session_id INT(11) NOT NULL,
FOREIGN KEY (session_id) REFERENCES Sessions(id) ON DELETE CASCADE
);

CREATE TABLE Customers (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
lastname VARCHAR(100) NOT NULL,
firstname VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
passwd VARCHAR(32) NOT NULL
);

CREATE TABLE Orders (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
created_at DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
customer INT(11) DEFAULT NULL,
FOREIGN KEY (customer) REFERENCES Customers(id) ON DELETE SET NULL
);

CREATE TABLE OrdersDetails (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
rate_id INT(11) DEFAULT NULL,
order_id INT(11) NOT NULL,
quantity INT(11) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (rate_id) REFERENCES Rates(id) ON DELETE SET NULL,
FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE
);


INSERT INTO Cinemas VALUES (1, "Le Granier", "Chambéry");
INSERT INTO Cinemas VALUES (2, "La Galoppe", "Grenoble");
INSERT INTO Cinemas VALUES (3, "Le Trélod", "Chambéry");
INSERT INTO Cinemas VALUES (4, "Le Peney", "Lyon");
INSERT INTO Cinemas VALUES (5, "Le Mont Blanc", "Annecy");
INSERT INTO Cinemas VALUES (6, "Le Margériaz", "Lyon");

INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("BLACK PANTHER", "Action", "Ryan Coogler", "La Reine Ramonda, Shuri, M’Baku, Okoye et les Dora Milaje luttent pour protéger leur nation des ingérences d’autres puissances mondiales après la mort du roi T’Challa. Alors que le peuple s’efforce d’aller de l’avant, nos héros vont devoir s’unir et compter sur l’aide de la mercenaire Nakia et d’Everett Ross pour faire entrer le royaume du Wakanda dans une nouvelle ère.", '2022-11-09', 125);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("ARMAGEDDON TIME", "Drame", "James Gray", "L’histoire très personnelle du passage à l’âge adulte d’un garçon du Queens dans les années 80, de la force de la famille et de la quête générationnelle du rêve américain.", '2022-11-09', 100);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("ENZO LE CROCO", "Famille", "Will Speck", "Quand la famille Primm déménage à New York, leur jeune fils Josh peine à s'adapter à sa nouvelle école et à ses nouveaux camarades. Tout cela change quand il découvre Enzo - un crocodile chanteur qui aime les bains et le caviar – et qui vit dans le grenier de sa nouvelle maison.", '2022-11-09', 75);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("VIOLENT NIGHT", "Thriller", "Tommy Wirkola", "Le soir de Noël, quand un groupe de mercenaires entre par effraction sur la propriété d’une famille aisée qu’ils prennent en otage, ils vont devoir affronter un adversaire auquel ils ne s’attendaient pas : Le Père Noël est dans la place et il va leur montrer que ce bon vieux Saint Nicolas a plus d’un tour dans sa hotte.", '2022-11-09', 100);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("BLACK ADAM", "Action", "Jaume Collet-Serra", "Dans l’antique Kahndaq, l’esclave Teth Adam avait reçu les super-pouvoirs des dieux. Mais il en a fait usage pour se venger et a fini en prison. Cinq millénaires plus tard, alors qu’il a été libéré, il fait régner sa conception très sombre de la justice dans le monde. Refusant de se rendre, Teth Adam doit affronter une bande de héros d’aujourd’hui qui composent la Justice Society – Hawkman, le Dr Fate, Atom Smasher et Cyclone – qui comptent bien le renvoyer en prison pour l’éternité.", '2022-11-09', 100);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("SAMOURAÏ ACADEMY", "Famille", "Rob Minkoff", "Hank est un chien enjoué qui rêve d’être samouraï dans un monde où ce privilège n’est réservé… qu’aux chats ! Moqué, refusé par toutes les écoles de samouraïs, il rencontre un gros matou grincheux, un maître guerrier qui finit par accepter de lui enseigner les techniques ancestrales des samouraïs. L’apprentissage va être rude pour le jeune chien remuant et dissipé : il faut apprendre à manier le sabre, devenir agile comme un chat, maîtriser les arts martiaux, et Hank n’est pas très doué.", '2022-11-09', 75);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("NOVEMBRE", "Thriller", "Cedric Jimenez", "Une plongée au cœur de l’Anti-Terrorisme pendant les 5 jours d'enquête qui ont suivi les attentats du 13 novembre.", '2022-11-09', 100);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("SPIDER-MAN: ACROSS THE SPIDER-VERSE", "Fantastique", "Joaquim Dos Santos", "Miles Morales revient dans un nouveau chapitre de la franchise oscarisée Spider-Man : New Generation, pour une aventure épique qui entraînera notre héros sympa originaire de Brooklyn, à travers le Multivers pour unir ses forces à celles de Gwen Stacy et une nouvelle équipe de Spider-héros pour faire face au méchant le plus puissant qu'ils n'aient jamais affronté.", '2022-11-09', 125);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("AVATAR : LA VOIE DE L'EAU", "Fantastique", "James Cameron", "Se déroulant plus d’une décennie après les événements relatés dans le premier film, AVATAR : LA VOIE DE L’EAU raconte l'histoire des membres de la famille Sully (Jake, Neytiri et leurs enfants), les épreuves auxquelles ils sont confrontés, les chemins qu’ils doivent emprunter pour se protéger les uns les autres, les batailles qu’ils doivent mener pour rester en vie et les tragédies qu'ils endurent.", '2022-11-09', 150);
INSERT INTO Movies (title, type, director, description, releaseDate, duration) VALUES ("ANT-MAN ET LA GUÊPE : QUANTUMANIA", "Fantastique", "Peyton Reed", "Les super-héros et partenaires Scott Lang et Hope Van Dyne – alias Ant-Man et la Guêpe – vont vivre de nouvelles péripéties. En compagnie de Hank Pym et Janet Van Dyne - les parents de Hope – le duo va explorer la dimension subatomique, interagir avec d'étranges nouvelles créatures et se lancer dans une odyssée qui les poussera au-delà des limites de ce qu'il pensait être possible.", '2022-11-09', 125);

INSERT INTO Rooms (room_number, seats, cinema) VALUES (1,50,1);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (2,25,1);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (3,70,1);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (4,25,1);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (5,50,1);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (1,20,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (2,25,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (3,50,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (4,100,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (5,100,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (6,100,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (7,25,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (8,50,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (9,25,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (10,25,2);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (1,50,3);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (2,25,3);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (3,70,3);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (4,25,3);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (5,50,3);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (1,20,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (2,50,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (3,50,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (4,100,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (5,70,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (6,100,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (7,25,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (8,50,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (9,100,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (10,25,4);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (1,100,5);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (2,50,5);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (3,50,5);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (4,50,5);
INSERT INTO Rooms (room_number, seats, cinema) VALUES (5,50,5);

INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-10 22:10:00",99,1);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-12 17:15:00",101,2);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-12 21:10:00",102,3);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-11 13:15:00",106,9);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-10 11:00:00",110,4);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-12 19:50:00",114,5);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-10 17:15:00",115,4);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-11 15:45:00",121,10);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-11 11:00:00",122,2);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-10 15:45:00",127,1);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-12 15:45:00",130,8);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-11 19:50:00",129,6);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-11 21:10:00",105,3);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-10 19:50:00",119,8);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-12 22:10:00",131,2);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-10 13:15:00",104,5);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-11 22:10:00",133,10);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-11 17:15:00",128,9);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-10 21:10:00",132,2);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-12 11:00:00",123,8);
INSERT INTO Sessions (start_at, room, movie) VALUES ("2022-11-12 13:15:00",125,10);

INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",64);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",64);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",64);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",65);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",65);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",65);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",66);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",66);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",66);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",67);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",67);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",67);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",68);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",68);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",68);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",69);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",69);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",69);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",70);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",70);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",70);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",71);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",71);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",71);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",72);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",72);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",72);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",73);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",73;
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",73);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",74);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",74);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",74);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",75);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",75);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",75);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",76);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",76);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",76);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",77);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",77);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",77);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",78);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",78);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",78);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",79);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",79);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",79);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",80);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",80);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",80);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",81);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",81);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",81);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",82);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",82);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",82);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",83);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",83);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",83);
INSERT INTO Rates (amount, public, session_id) VALUES (9.20,"Plein Tarif",84);
INSERT INTO Rates (amount, public, session_id) VALUES (7.60,"Etudiant",84);
INSERT INTO Rates (amount, public, session_id) VALUES (5.90,"Enfant",84);

INSERT INTO Administrators (fullname, role, email, passwd) VALUES ("dumas aurelie","administrateur","dumasaurelie@live.fr",MD5("motdepasse1"));
INSERT INTO Administrators (fullname, role, email, passwd) VALUES ("dupont gerard","gerant","dupontgerard@gnail.com",MD5("motdepasse2"));
INSERT INTO Administrators (fullname, role, email, passwd) VALUES ("durand michel","gerant","durandmichel@gnail.com",MD5("motdepasse3"));
INSERT INTO Administrators (fullname, role, email, passwd) VALUES ("martin pierre","gerant","martinpierre@gnail.com",MD5("motdepasse4"));
INSERT INTO Administrators (fullname, role, email, passwd) VALUES ("fernand christine","gerant","fernandchristine@gnail.com",MD5("motdepasse5"));

INSERT INTO Customers (lastname, firstname, email, passwd) VALUES ("Gilbert","Sylvie","gilbertsylvie@gmil.fr",MD5("mdp1"));
INSERT INTO Customers (lastname, firstname, email, passwd) VALUES ("Guillot","Augustin","guillotaugustin@gmil.fr",MD5("mdp2"));
INSERT INTO Customers (lastname, firstname, email, passwd) VALUES ("Ferreira","Franck","ferreirafranck@gmil.fr",MD5("mdp3"));
INSERT INTO Customers (lastname, firstname, email, passwd) VALUES ("Pons","Guillaume","ponsguillaume@gmil.fr",MD5("mdp4"));
INSERT INTO Customers (lastname, firstname, email, passwd) VALUES ("Laroche","Léon","larocheléon@gmil.fr",MD5("mdp5"));

INSERT INTO Acces VALUES (1,5);
INSERT INTO Acces VALUES (2,4);
INSERT INTO Acces VALUES (2,2);
INSERT INTO Acces VALUES (1,3);
INSERT INTO Acces VALUES (3,1);
INSERT INTO Acces VALUES (4,6);

INSERT INTO Orders (created_at, amount, customer) VALUES ("2022-11-10",21.00,1);
INSERT INTO Orders (created_at, amount, customer) VALUES ("2022-11-15",18.40,3);
INSERT INTO Orders (created_at, amount, customer) VALUES ("2022-11-11",15.10,5);
INSERT INTO Orders (created_at, amount, customer) VALUES ("2022-11-12",15.20,4);
INSERT INTO Orders (created_at, amount, customer) VALUES ("2022-11-11",21.00,2);

INSERT INTO OrdersDetails (rate_id, order_id, quantity, unit_price) VALUES (34,6,1,9.20);
INSERT INTO OrdersDetails (rate_id, order_id, quantity, unit_price) VALUES (36,6,2,5.90);
INSERT INTO OrdersDetails (rate_id, order_id, quantity, unit_price) VALUES (25,7,2,9.20);
INSERT INTO OrdersDetails (rate_id, order_id, quantity, unit_price) VALUES (7,8,1,9.20);
INSERT INTO OrdersDetails (rate_id, order_id, quantity, unit_price) VALUES (9,8,1,5.90);
INSERT INTO OrdersDetails (rate_id, order_id, quantity, unit_price) VALUES (41,9,2,7.60);
INSERT INTO OrdersDetails (rate_id, order_id, quantity, unit_price) VALUES (52,10,1,9.20);
INSERT INTO OrdersDetails (rate_id, order_id, quantity, unit_price) VALUES (54,10,2,5.90);

