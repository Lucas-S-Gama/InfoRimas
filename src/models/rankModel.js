var database = require("../database/config")


function CaptarModoFavorito() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.")
    var instrucaoSql = `
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
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function CaptarTempoFavorito() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.")
    var instrucaoSql = `
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
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function CaptarBeatFavorito() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.")
    var instrucaoSql = `
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
        `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function CaptarUsuariosComMaisTreinos() {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.")
        var instrucaoSql = `
        SELECT
            u.nome,
            COUNT(rt.fk_idUsuario) AS quantidadeTreinos
        FROM usuario u
        JOIN RegistroTreino rt ON rt.fk_idUsuario = u.idUsuario
        GROUP BY u.nome
        ORDER BY quantidadeTreinos DESC LIMIT 5;
        `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function CaptarHistoricoSeteDiasUser(nome) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.")
        var instrucaoSql = `
        SELECT
            COUNT(u.idUsuario) AS QuantidadeDeTreinosPorDia,
            u.nome AS nome,
            DATE_FORMAT(rt.dt_hora, '%d/%m/%Y') AS DataRealizadoTreinos
            FROM usuario u
            LEFT JOIN RegistroTreino rt ON rt.fk_idUsuario = u.idUsuario
            WHERE u.nome = 'lucas' 
            GROUP BY u.nome, DATE_FORMAT(rt.dt_hora, '%d/%m/%Y')
        ORDER BY DATE_FORMAT(rt.dt_hora, '%d/%m/%Y') DESC LIMIT 7
        ;
        `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);   
}


module.exports = {
    CaptarModoFavorito,
    CaptarTempoFavorito,
    CaptarBeatFavorito,
    CaptarUsuariosComMaisTreinos,
    CaptarHistoricoSeteDiasUser
}