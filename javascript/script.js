

function alterarImage(){
    var corpo = document.body
    corpo.style.backgroundImage = "url('./imagens/fiatArgo1.jpg')"
    corpo.style.backgroundRepeat = "no-repeat"
    corpo.style.backgroundPosition = "top"
    var imagemAtual = 0;

    let imagens = ["url('./imagens/fiatArgo2.webp')", "url('./imagens/polo1.jpg')", "url('./imagens/renaultKwid2.jpg')", "url('./imagens/fiatMobi2.webp')"]

    setInterval(()=>{
        corpo.style.backgroundImage = imagens[imagemAtual]
        corpo.style.backgroundRepeat = "no-repeat"
        corpo.style.backgroundPosition = "20% 20%"
        imagemAtual>=2?imagemAtual=0:imagemAtual++
    }, 2000)

    
}
window.addEventListener("load", alterarImage)