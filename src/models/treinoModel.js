var database = require("../database/config")

function RegistrarTreino(nome) {
    var instrucao = `
        INSERT INTO carro (nome) VALUES ('${nome}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function PegarURLMusica(BeatNome) {
    var instrucao = `
        SELECT beaturl FROM BeatTreino WHERE nome = '${BeatNome}'
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function ListarInfosModoTreino(ModoNome) {
    var instrucao = `
        SELECT nome, descricao, tempoPorPalavra FROM ModoTreino WHERE nome = '${ModoNome}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function PegarTempoTreino(TempoDeTreino) {
    var instrucao = `
        SELECT tempo_segundos FROM TempoTreino WHERE tempo_segundos = ${TempoDeTreino};
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