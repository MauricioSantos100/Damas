function selecionaPeca()
  correto = false
  while(correto == false) do
    io.write("Linha da peça que voçê deseja mover ")
    linha = io.read("*n")
    io.write("Coluna da peça que voçê deseja mover ")
    coluna = io.read("*n")
    if(verificaLinhaColuna(linha, coluna)) then
      correto = true
    end
  end
  return linha, coluna
end

function selecionaLocal()
  correto = false
  while(correto == false) do
    io.write("Linha para onde voçê deseja mover ")
    linhaL = io.read("*n")
    io.write("Coluna para onde voçê deseja mover ")
    colunaL = io.read("*n")
    if(verificaLinhaColuna(linhaL, colunaL) and verificaVazio(linhaL, colunaL)) then
      correto = true
    end
  end
  return linhaL, colunaL
end

function movimentaPecasB()
  linha, coluna = selecionaPeca()
  if(verPecaB(linha, coluna)) then
    linhaL, colunaL = selecionaLocal()
    if(validaPosicao(linha, coluna, linhaL, colunaL)) then
      movimentaPecaDama(linha, coluna, linhaL, colunaL)
      return true
    elseif(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
      movimentaPecaDama(linha, coluna, linhaL, colunaL)
      return true
    elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
      novaCaptura(linhaL, colunaL)
      return true
    end
  end
  return false
end

function movimentaPecasP()
  linha, coluna = selecionaPeca()
  if(verPecaP(linha, coluna)) then
    linhaL, colunaL = selecionaLocal()
    if(validaPosicao(linha, coluna, linhaL, colunaL)) then
      movimentaPecaDama(linha, coluna, linhaL, colunaL)
      return true
    elseif(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
      movimentaPecaDama(linha, coluna, linhaL, colunaL)
      return true
    elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
      novaCaptura(linhaL, colunaL)
      return true
    end
  end
  return false
end