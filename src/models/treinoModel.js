var database = require("../database/config")

function RegistrarTreino(fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino);
    var instrucao = `
        INSERT INTO RegistroTreino (fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino) VALUES (${fk_idUsuario}, ${fk_ModoTreino}, ${fk_TempoTreino}, ${fk_BeatTreino});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function PegarMusicas() {
    var instrucao = `
        SELECT * FROM BeatTreino;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function PegarModoTreino() {
    var instrucao = `
        SELECT * FROM ModoTreino;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function PegarTempos() {
    var instrucao = `
        SELECT * FROM TempoTreino;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    RegistrarTreino,
    PegarMusicas,
    PegarModoTreino,
    PegarTempos
};