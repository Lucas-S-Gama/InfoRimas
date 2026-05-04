CREATE DATABASE InfoRimas;
USE InfoRimas;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	senha VARCHAR(50) NOT NULL
);

CREATE TABLE ModoTreino (
	idModoTreino INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL UNIQUE,
	descricao VARCHAR(200) NOT NULL,
    tempoPorPalavra INT
);

INSERT INTO ModoTreino (nome, descricao, tempoPorPalavra) VALUES
('Easy mode', 'Rime com a palavra, uma palavra a cada 15 segundos', 15),
('Normal mode', 'Rime com a palavra, uma palavra a cada 10 segundos', 10),
('Hard mode', 'Rime com a palavra, uma palavra a cada 5 segundos', 5);

CREATE TABLE TempoTreino (
	idTempoTreino INT PRIMARY KEY AUTO_INCREMENT,
	tempo_segundos INT NOT NULL UNIQUE,
	descricao VARCHAR(200) NOT NULL
);

INSERT INTO TempoTreino (tempo_segundos, descricao) VALUES
(30, 'Duração total de 30 segundos'),
(45, 'Duração total de 45 segundos'),
(60, 'Duração total de 60 segundos');

CREATE TABLE BeatTreino (
	idBeatTreino INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	beaturl VARCHAR(200) NOT NULL UNIQUE
);

INSERT INTO BeatTreino (nome, beaturl) VALUES
('Lean Back', 'https://open.spotify.com/embed/track/2yR5drSnVpZKi08ibb3gIP?utm_source=generator'),
('Detroit Type Beat', 'https://open.spotify.com/embed/track/259o0GhHtb97pGbwIxSKLY?utm_source=generator'),
('Boom', 'https://open.spotify.com/embed/track/0nbhwvRYCcLWPBCFdLv6Ov?utm_source=generator&theme=0');

CREATE TABLE RegistroTreino (
	idRegistroTreino INT PRIMARY KEY AUTO_INCREMENT,
	fk_idUsuario INT NOT NULL,
    fk_ModoTreino INT NOT NULL,
    fk_TempoTreino INT NOT NULL,
    fk_BeatTreino INT NOT NULL
);

SELECT tempoPorPalavra FROM ModoTreino WHERE nome = 'Hard Mode';

SELECT * FROM usuario;

SELECT beaturl FROM BeatTreino WHERE nome = 'Lean Back';

SELECT nome, descricao, tempoPorPalavra FROM ModoTreino WHERE nome = 'Easy Mode';

SELECT tempo_segundos FROM TempoTreino WHERE tempo_segundos = 45;

INSERT INTO RegistroTreino (fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino) VALUES 
(1, 1, 1, 1);

SELECT * FROM RegistroTreino;

