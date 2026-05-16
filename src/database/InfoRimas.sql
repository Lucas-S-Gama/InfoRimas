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
	tempo_segundos INT NOT NULL UNIQUE
);

INSERT INTO TempoTreino (tempo_segundos) VALUES
(30),
(45),
(60);

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

CREATE TABLE termos (
idTermos INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(200)
);

INSERT INTO termos (nome, descricao) VALUES
('DROP NO BEAT', 'É o momento onde o beat vira. Foi a maior tendência em 2023, popularizado pelo Brennuz.'),
('MVP', 'Most Valuable Player. MC que mais se destacou ou teve o melhor desempenho em um evento ou batalha.'),
('PUNCHLINE', 'A linha de impacto no final de uma rima que causa forte reação do público e pontua contra o oponente.'),
('DECORADA', 'Rima que já estava pronta ou decorada pelo MC antes da batalha, em vez de ser feita na hora.'),
('TWOLALA', 'Resultado da batalha quando um dos MCs ganha de 2 a 0 contra outro MC'),
('FREESTYLE', 'Estilo livre. A arte de rimar de forma totalmente improvisada no momento exato em que a batida toca.'),
('DOBRA', 'Técnica de encaixar duas palavras ou sílabas tônicas no mesmo compasso para acelerar ou variar o fluxo.'),
('FLOW', 'A maneira como o MC flui na batida, combinando o ritmo das palavras com a cadência do instrumental.'),
('IMPROVISADA', 'Rima criada no calor do momento, baseada nos acontecimentos atuais e no que o oponente acabou de dizer.'),
('FATALITY', 'Uma punchline ou rima devastadora que encerra o argumento e praticamente define a vitória na batalha.'),
('IDEOLOGIA', 'Estilo de batalha ou rima focado em temas conscientes, debates sociais, filosóficos e políticos.'),
('BATE-VOLTA', 'Formato de batalha rápido onde cada MC rima um verso curto e o outro responde imediatamente a seguir.'),
('GASTAÇÃO', 'Estilo de rima focado em zoar, debochar ou fazer piadas ácidas sobre a aparência e postura do oponente.'),
('60 SEGUNDOS', 'O tempo padrão tradicional de um round (um minuto) concedido para cada MC apresentar suas rimas.');

CREATE TABLE estilos (
idEstilos INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(200),
url VARCHAR(200)
);

INSERT INTO estilos (nome, descricao, url) VALUES 
('SPEEDFLOW', 'Estilo focado na velocidade máxima da entrega das palavras dentro do ritmo.', 'https://www.youtube-nocookie.com/embed/D644IdO584s?si=mruhXUKiPkrXfrGQ&amp;controls=0&amp;start=136'), 
('DROP NO BEAT', 'Estilo que sincroniza o ápice da rima com a virada ou queda da batida.', 'https://www.youtube-nocookie.com/embed/e8nSBGE7eo8?si=vv8aTZJMEWiYxHas&amp;controls=0&amp;start=310'), 
('100% FREESTYLE', 'Estilo de improvisação pura e imediata, sem nenhuma estrutura pré-pensada.', 'https://www.youtube-nocookie.com/embed/fpoUiMB4Znk?si=yea0WMdeo_61YNmM&amp;controls=0&amp;start=117'), 
('FLOW', 'Estilo focado na variação do ritmo, da cadência e da entrega das palavras.', 'https://www.youtube-nocookie.com/embed/fWWbOUZj7QI?si=YlIc9T0xZFMuAf2G&amp;controls=0&amp;start=343'), 
('DUPLA NORTE', 'Estilo focado na técnica de completar a rima da dupla.', 'https://www.youtube-nocookie.com/embed/-l28J2-x6sg?si=a6_63sxQUNq2lavH&amp;controls=0&amp;start=97'), 
('AGRESSIVO', 'Estilo focado no ataque direto ao oponente através de linhas impactantes e postura intimidadora.', 'https://www.youtube-nocookie.com/embed/cq2SSxJjeHU?si=2AgZVQC3d9GPQuMo&amp;controls=0&amp;start=292');


SELECT tempoPorPalavra FROM ModoTreino;

SELECT * FROM usuari3o;

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
	WHERE DATE(rt.dt_hora) >= CURRENT_DATE - INTERVAl 7 DAY AND u.nome = 'lucas' 
	GROUP BY u.nome, DATE_FORMAT(rt.dt_hora, '%d/%m/%Y')
ORDER BY DATE_FORMAT(rt.dt_hora, '%d/%m/%Y');

-- =====================================================================
-- =========> todos os termos <=======
-- =====================================================================
SELECT nome, descricao FROM termos;

-- =====================================================================
-- =========> todos os estilos <=======
-- =====================================================================
SELECT nome, descricao, url FROM estilos;




