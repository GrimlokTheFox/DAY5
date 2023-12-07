CREATE DATABASE v5_VovchokGleb_P46;
GO
USE v5_VovchokGleb_P46;
CREATE TABLE Techika_klientov(
tech_id integer not null primary key,
 order_id integer, 
 tech_edinitsa_izmerenia varchar(3), 
 tech_kolichestvo integer, 
);
GO
USE v5_VovchokGleb_P46;
CREATE TABLE Klienti(
client_id integer not null primary key,
 client_familia varchar(40),
 client_imya varchar(40),
 client_otchestvo varchar(45),
 client_telefon varchar(25), 
);
GO
USE v5_VovchokGleb_P46;
CREATE TABLE Detalinasklade(
detal_id integer not null primary key,
detal_name varchar (180),
detal_edinitsa_izmerenia varchar(3),
detal_price integer, 
detal_kolichestvo integer not null,
);
GO
USE v5_VovchokGleb_P46;
CREATE TABLE Spisok_ispolzovannih_detaley(
PP_id integer not null primary key,
order_id integer, 
detal_id integer,
PP_kolichestvo integer,
);
GO
USE v5_VovchokGleb_P46;
CREATE TABLE SpisokSotrudnikov(
sotrudnik_id integer not null primary key,
sotrudnik_familia varchar (40),
sotrudnik_imya varchar (40),
sotrudnik_otchestvo varchar (40),
sotrudnik_adres varchar (80),
sotrudnik_data_rozhdenia date,
sotrudnik_telefon varchar (25),
);
GO
USE v5_VovchokGleb_P46;
CREATE TABLE Uslugi(
usluga_id integer not null primary key,
usluga_name varchar (180), 
usluga_price integer,
);
GO
USE v5_VovchokGleb_P46;
CREATE TABLE Okazannieuslugi(
PP_id integer not null primary key,
order_id integer,
sotrudnik_id integer,
okazusluga_date datetime, 
usluga_id integer,
okazusluga_kolichestvo integer,
okazusluga_primechanie varchar (200),
);
GO
USE v5_VovchokGleb_P46;
CREATE TABLE Zakazi(
order_id integer not null primary key,
client_id integer,
order_date_start datetime, 
order_opisanie varchar (200),
order_status varchar (25), 
order_date_end datetime,
);
GO
USE v5_VovchokGleb_P46;
INSERT Detalinasklade VALUES (1, 'Винтик', 'шт.', 15, 231),
(2, 'Болтик', 'шт.', 20, 127);
GO
USE v5_VovchokGleb_P46;
INSERT SpisokSotrudnikov VALUES (1, 'Иванов', 'Иван', 'Иванович', 'г. Москва, 17 Сентября ул., д. 4 кв.130', '1998-12-03', '+7(900)155-23-11'),
(2, 'Петров', 'Петп', 'Петрович', 'г. Москва, Луговая ул., д. 17 кв.111', '2000-05-11', '+7(900)122-10-01');
GO
USE v5_VovchokGleb_P46;
INSERT Uslugi VALUES (1, 'Привинтить', 100),
(2, 'Закрутить болт', 100);
GO
USE v5_VovchokGleb_P46;
INSERT Spisok_ispolzovannih_detaley VALUES (1, 1, 1, 54),
(2, 2, 2, 34);
GO
USE v5_VovchokGleb_P46;
INSERT Okazannieuslugi VALUES (1, 1, 1, '07.12.2023', 1, 345, 'Привинтил хитро'),
(2, 2, 2, '07.12.2023', 2, 289, 'Закрутил быстро');
GO
USE v5_VovchokGleb_P46;
INSERT Techika_klientov VALUES (1, 1, 'шт.',1),
(2, 2, 'шт.',1);
GO
USE v5_VovchokGleb_P46;
INSERT Klienti VALUES (1, 'Владимиркин', 'Олег', 'Михайлович', '+7(900)321-21-22'),
(2, 'Мельников', 'Василий', 'Иванович', '+7(920)124-56-47');
GO
USE v5_VovchokGleb_P46;
INSERT Zakazi VALUES (1, 1, '07.12.2023', 'Владимиркин хочет завинтить что-то', 'Выполнено', '07.12.2023'),
(2, 2, '07.12.2023', 'Мельников просит прикрутить болт', 'Выполнено', '07.12.2023');
GO
USE v5_VovchokGleb_P46;
ALTER TABLE Spisok_ispolzovannih_detaley ADD constraint FK_kod_detali FOREIGN KEY (detal_id) references Detalinasklade(detal_id);
ALTER TABLE Okazannieuslugi ADD constraint FK_kod_uslugi FOREIGN KEY (usluga_id)  references Uslugi(usluga_id);
ALTER TABLE Okazannieuslugi ADD constraint FK_kod_sotrudnika FOREIGN KEY (sotrudnik_id) references SpisokSotrudnikov(sotrudnik_id);
ALTER TABLE Okazannieuslugi ADD constraint FK_kod_zakaza1 FOREIGN KEY (order_id)  references Zakazi(order_id);
ALTER TABLE Techika_klientov ADD constraint FK_kod_zakaza2 FOREIGN KEY (order_id)  references Zakazi(order_id);
ALTER TABLE Spisok_ispolzovannih_detaley ADD constraint FK_kod_zakaza3 FOREIGN KEY (order_id)  references Zakazi(order_id);
ALTER TABLE Zakazi ADD constraint FK_kod_klienta FOREIGN KEY (client_id)  references Klienti(client_id);