function selecionaPeca(linha, coluna)
  correto = false
  while(correto == false) do
    if(verificaLinhaColuna(linha, coluna)) then
      correto = true
    end
  end
  return linha, coluna
end

function selecionaLocal(linhaL, colunaL)
  correto = false
  while(correto == false) do
    if(verificaLinhaColuna(linhaL, colunaL) and verificaVazio(linhaL, colunaL)) then
      correto = true
    end
  end
  return linhaL, colunaL
end

function movimentaPecasB(linha, coluna, linhaL, colunaL)
  print("Peca["..linha.."]["..coluna.."], Local[".. linhaL.."][".. colunaL.."]")
  if(selecionaPeca(linha,coluna)) then
    print("valida 1")
    if(verPecaB(linha,coluna)) then
      print("valida 2")
      if(selecionaLocal(linhaL, colunaL)) then
        print("valida 3")
        if(validaPosicao(linha, coluna, linhaL, colunaL)) then
          movimentaPecaDama(linha, coluna, linhaL, colunaL)
          print("valida 4")
          return true
        elseif(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
          movimentaPecaDama(linha, coluna, linhaL, colunaL)
          print("valida 5")
          return true
        elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
          novaCaptura(linhaL, colunaL)
          print("valida 6")
          return true
        end
      end
    end
  end
  return false
end

function movimentaPecasP(linha, coluna, linhaL, colunaL)
  if(selecionaPeca(linha, coluna)) then
    if(verPecaP(linha, coluna)) then
      if(selecionaLocal(linhaL, colunaL)) then
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
    end
  end
  return false
end