CREATE DATABASE Film

USE Film

CREATE TABLE Genres
(
  Id INT IDENTITY PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL
)

INSERT INTO Genres
VALUES
('TARIXI'),
('QORXU'),
('KOMEDIYA'),
('SEVGI'),
('DRAM'),
('FANTASTIK'),
('FACIE')

CREATE TABLE Movies
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)

ALTER TABLE Movies
ADD geneId INT CONSTRAINT FK_Models_geneId FOREIGN KEY(geneId) REFERENCES Genres(Id)

ALTER TABLE Movies
ALTER COLUMN geneId INT

CREATE TABLE Actors
(
  Id INT IDENTITY PRIMARY KEY,
  Name NVARCHAR(100),
  Surname NVARCHAR(150),
  Age INT,

)

CREATE TABLE ActorMOVIES
( 
  ID INT IDENTITY PRIMARY KEY,
  actorID INT FOREIGN KEY REFERENCES Actors(Id),
  moviesID INT FOREIGN KEY REFERENCES Movies(Id)
)

SELECT*FROM Genres

INSERT INTO Movies
VALUES
('Ada',1),
('Ağ saray',1),
('İblisin mədəniyyət',2),
('Səhər naminə',2),
('qayinana',3),
('beyin ogurlanmasi',3),
('The Vow',4),
('The Best of Me',4),
('25-ci saat',5),
('Dönüklər',5),
('Dolittle',6),
('İkizler Projesi',6),
('facia uclu',7),
('qemli insanlar',7)

select *  from Movies

INSERT INTO Actors
VALUES
('OMAR','OSMANOV',25),
('SEBUHI','VBABAYE',35),
('ELI','NAGIYEV',21),
('VUSAL','HEMIDOV',29),
('LAMIYE','BABAYEVA',55),
('QEZENFER','ABREHMANOV',18),
('NAZLI','ELIYEVA',45),
('NERGIZ','FERZELIYEVA',39)

INSERT INTO ActorMOVIES
VALUES
(1,5),
(2,7),
(1,3),
(1,4),
(2,5),
(2,6),
(3,5),
(3,1),
(3,2),
(4,1),
(4,6),
(5,2),
(5,4),
(6,7),
(6,3),
(6,6),
(7,6),
(7,2),
(7,3),
(8,1)

SELECT * FROM ActorMOVIES AS AM
JOIN Actors AS F ON AM.actorID=F.Id
JOIN Movies AS M ON AM.moviesID=M.Id

SELECT * FROM Actors
WHERE (SELECT AVG(AGE) FROM Actors)<Actors.Age

SELECT Actors.Name,Actors.Surname,Actors.Age FROM ActorMOVIES 
JOIN Actors ON ActorMOVIES.actorID=actorID

SELECT * FROM Actors

INSERT INTO Actors
VALUES 
('ZAUR','OSMANOV',75)

SELECT *FROM Actors
WHERE not  EXISTS (SELECT *FROM ActorMOVIES WHERE actorID=Actors.ID)

SELECT Name,(SELECT COUNT (Id) from ActorMOVIES where actorID=Genres.ID ) from Genres