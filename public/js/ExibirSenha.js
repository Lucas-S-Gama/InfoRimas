function MostrarSenha() {

    if (ipt_senha.type == 'password') {
        MicSenha.src = '../assets/imgs/microfone-gravador.png';
        ipt_senha.type = 'text';
    } else {
        MicSenha.src = '../assets/imgs/microfone-mudo.png';
        ipt_senha.type = 'password';
    }
}

function MostrarConfirmarSenha() {
    
    if (ipt_confirmarSenha.type == 'password') {
        MicConfirmarSenha.src = '../assets/imgs/microfone-gravador.png';
        ipt_confirmarSenha.type = 'text';
    } else {
        MicConfirmarSenha.src = '../assets/imgs/microfone-mudo.png';
        ipt_confirmarSenha.type = 'password';
    }
}