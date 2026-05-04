var database = require("../database/config")

function RegistrarTreino(fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino);
    var instrucao = `
        INSERT INTO RegistroTreino (fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino) VALUES (${fk_idUsuario}, ${fk_ModoTreino}, ${fk_TempoTreino}, ${fk_BeatTreino});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function PegarURLMusica(BeatNome) {
    var instrucao = `
        SELECT idBeatTreino, beaturl FROM BeatTreino WHERE nome = '${BeatNome}'
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function ListarInfosModoTreino(ModoNome) {
    var instrucao = `
        SELECT idModoTreino, nome, descricao, tempoPorPalavra FROM ModoTreino WHERE nome = '${ModoNome}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function PegarTempoTreino(TempoDeTreino) {
    var instrucao = `
        SELECT idTempoTreino, tempo_segundos FROM TempoTreino WHERE tempo_segundos = ${TempoDeTreino};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    RegistrarTreino,
    PegarURLMusica,
    ListarInfosModoTreino,
    PegarTempoTreino
};