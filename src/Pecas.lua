function selecionaPeca()
  correto = false
  while(correto == false) do
    io.write("Linha da peça que voçê deseja mover ")
    linha = io.read("*n")
    io.write("Coluna da peça que voçê deseja mover ")
    coluna = io.read("*n")
    if((linha >= 1 and linha <= 8) and (coluna >= 1 and coluna <= 8)) then
      correto = true
    end
  end
  return linha, coluna
end

function selecionaLocal()
  correto = false
  while(correto == false) do
    io.write("Linha para onde voçê deseja mover ")
    linha1 = io.read("*n")
    io.write("Coluna para onde voçê deseja mover ")
    coluna1 = io.read("*n")
    if((linha1 >= 1 and linha <= 8) and (coluna1 >= 1 and coluna1 <= 8)) then
      correto = true
    end
  end
  return linha1, coluna1
end

function movimentaPecasB()
  linha, coluna = selecionaPeca()
  if(verPecaB(linha, coluna)) then
    linhaL, colunaL = selecionaLocal()
    if(verificaVazio(linhaL, colunaL)) then
      if(validaPosicao(linha, coluna, linhaL, colunaL)) then
        return true
      elseif(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
        PecasDamas(linha, coluna, linhaL, colunaL)
        return true
      end
    end
    if(capturaPeca(linha, coluna, linhaL, colunaL)) then
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
    if(verificaVazio(linhaL, colunaL)) then
      if(validaPosicao(linha, coluna, linhaL, colunaL)) then
        return true
      elseif(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
        PecasDamas(linha, coluna, linhaL, colunaL)
        return true
      end
    end
    if(capturaPeca(linha, coluna, linhaL, colunaL)) then
      novaCaptura(linhaL, colunaL)
      return true
    end
  end
  return false
end