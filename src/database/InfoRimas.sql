CREATE DATABASE InfoRimas;
USE InfoRimas;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	senha VARCHAR(50) NOT NULL
);

INSERT INTO usuario (nome, email, senha) VALUE
('jonas','jonas@gmail.com','12345678'),
('Laker','Laker@gmail.com','12345678'),
('Bea','Bea@gmail.com','12345678'),
('Michael','Michael@gmail.com','12345678');

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
('Lean Back', 'Lean_Back'),
('Barras e Barras', 'Barras_e_Barras'),
('Boom', 'Boom');

CREATE TABLE RegistroTreino (
	idRegistroTreino INT PRIMARY KEY AUTO_INCREMENT,
	fk_idUsuario INT NOT NULL,
    fk_ModoTreino INT NOT NULL,
    fk_TempoTreino INT NOT NULL,
    fk_BeatTreino INT NOT NULL,
    dt_hora DATETIME DEFAULT CURRENT_TIMESTAMP()
);

SELECT tempoPorPalavra FROM ModoTreino;

SELECT * FROM usuario;

SELECT beaturl FROM BeatTreino WHERE nome = 'Lean Back';

SELECT nome, descricao, tempoPorPalavra FROM ModoTreino WHERE nome = 'Easy Mode';

SELECT tempo_segundos FROM TempoTreino WHERE tempo_segundos = 45;

INSERT INTO RegistroTreino (fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino) VALUES 
(3, 1, 2, 3);

INSERT INTO RegistroTreino (fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino, dt_hora) VALUES 
(5, 1, 1, 1, '2026-05-10 10:00:00'),
(1, 1, 1, 1, '2026-05-09 14:30:00'),
(1, 1, 1, 1, '2026-05-08 09:15:00'),
(1, 1, 1, 1, '2026-05-07 18:00:00'),
(1, 1, 1, 1, '2026-05-06 07:45:00'),
(1, 1, 1, 1, '2026-05-05 20:20:00'),
(1, 1, 1, 1, '2026-05-04 11:10:00');

-- =====================================================================
-- =========> Mostrando todos os registros de treino <=======
-- =====================================================================

SELECT
rt.idRegistroTreino,
u.nome,
mt.nome,
tt.tempo_segundos,
bt.nome,
dt_hora
FROM RegistroTreino rt
LEFT JOIN usuario u ON rt.fk_idUsuario = u.idUsuario
LEFT JOIN ModoTreino mt ON rt.fk_ModoTreino = mt.idModoTreino
LEFT JOIN TempoTreino tt ON rt.fk_TempoTreino = tt.idTempoTreino
LEFT JOIN BeatTreino bt ON rt.fk_BeatTreino = bt.idBeatTreino
;

-- =====================================================================
-- =========> Mostrando o MODO de treino favorito dos usuarios <=======
-- =====================================================================
SELECT 
	mt.idModoTreino,
	mt.nome,
	ROUND(
	(COUNT(rt.fk_ModoTreino) * 100)
	/ (SELECT
	COUNT(idRegistroTreino)
	FROM RegistroTreino)
    ) AS PorcentagemDeUso
	FROM ModoTreino mt
	JOIN RegistroTreino rt ON rt.fk_ModoTreino = mt.idModoTreino
	GROUP BY mt.nome
	HAVING COUNT(rt.fk_ModoTreino) = (
	SELECT
	MAX(quantidade) AS quantidade
    FROM (SELECT
	mt.idModoTreino AS identificacao,
	COUNT(rt.fk_TempoTreino) AS quantidade
	FROM ModoTreino mt
	JOIN RegistroTreino rt ON rt.fk_ModoTreino = mt.idModoTreino
	GROUP BY mt.idModoTreino
    ) AS QuantidadePorModo
);

-- =====================================================================
-- =========> Mostrando o TEMPO de treino favorito dos usuarios <=======
-- =====================================================================
SELECT
	tt.idTempoTreino,
	tt.tempo_segundos,
	ROUND(
	(COUNT(rt.fk_TempoTreino) * 100)
	/ (SELECT
	COUNT(idRegistroTreino)
	FROM RegistroTreino)
    ) AS PorcentagemDeUso
	FROM TempoTreino tt
	JOIN RegistroTreino rt ON rt.fk_TempoTreino = tt.idTempoTreino
	GROUP BY tempo_segundos
	HAVING COUNT(rt.fk_TempoTreino) = (
	SELECT
	MAX(quantidade) AS quantidade
    FROM (SELECT
	tt.idTempoTreino AS identificacao,
	COUNT(rt.fk_TempoTreino) AS quantidade
	FROM TempoTreino tt
	JOIN RegistroTreino rt ON rt.fk_TempoTreino = tt.idTempoTreino
	GROUP BY tt.tempo_segundos
    ) AS QuantidadePorSegundos
);

-- =====================================================================
-- =========> Mostrando o BEAT de treino favorito dos usuarios <=======
-- =====================================================================
SELECT
	bt.idBeatTreino,
	bt.nome,
	ROUND(
    (COUNT(rt.fk_BeatTreino) * 100)
	/ (SELECT
	COUNT(idRegistroTreino)
	FROM RegistroTreino)
    ) AS PorcentagemDeUso
	FROM BeatTreino bt
	JOIN RegistroTreino rt ON rt.fk_BeatTreino = bt.idBeatTreino
	GROUP BY bt.idBeatTreino
	HAVING COUNT(rt.fk_BeatTreino) = (
	SELECT
	MAX(quantidade) AS quantidade
    FROM (SELECT
	bt.idBeatTreino AS identificacao,
	COUNT(rt.fk_BeatTreino) AS quantidade
	FROM BeatTreino bt
	JOIN RegistroTreino rt ON rt.fk_BeatTreino = bt.idBeatTreino
	GROUP BY bt.idBeatTreino
    ) AS QuantidadePorBeat
);

-- =====================================================================
-- =========> Mostrando os 5 usuarios com mais treino <=======
-- =====================================================================
SELECT
	u.nome,
    COUNT(rt.fk_idUsuario) AS quantidadeTreinos
FROM usuario u
JOIN RegistroTreino rt ON rt.fk_idUsuario = u.idUsuario
GROUP BY u.nome
ORDER BY quantidadeTreinos DESC LIMIT 5;


-- =====================================================================
-- =========> Quantidade de treinos feitos por dia <=======
-- =====================================================================
SELECT
	COUNT(u.idUsuario) AS QuantidadeDeTreinosPorDia,
	u.nome AS nome,
	DATE_FORMAT(rt.dt_hora, '%d/%m/%Y') AS DataRealizadoTreinos
	FROM usuario u
	LEFT JOIN RegistroTreino rt ON rt.fk_idUsuario = u.idUsuario
	WHERE DATE(rt.dt_hora) >= CURRENT_DATE - INTERVAl 7 DAY AND u.nome = 'bea' 
	GROUP BY u.nome, DATE_FORMAT(rt.dt_hora, '%d/%m/%Y')
ORDER BY DATE_FORMAT(rt.dt_hora, '%d/%m/%Y');



