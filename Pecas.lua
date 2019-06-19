function movimentaPecasB(linha, coluna, linhaL, colunaL)
  print("Peca["..linha.."]["..coluna.."], Local[".. linhaL.."][".. colunaL.."]")
  if(verificaVazio(linhaL, colunaL)) then
    print("valida 1")
    if(validaPosicao(linha, coluna, linhaL, colunaL)) then
      movimentaPecaEDama(linha, coluna, linhaL, colunaL)
      print("valida 2")
      return true
    elseif(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
      movimentaPecaDama(linha, coluna, linhaL, colunaL)
      print("valida 3")
      return true
    elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
        novaCaptura(linhaL, colunaL)
      print("valida 4")
      return true
    end
  end
  return false
end

function movimentaPecasP(linha, coluna, linhaL, colunaL)
  print("Peca["..linha.."]["..coluna.."], Local[".. linhaL.."][".. colunaL.."]")
  if(verificaVazio(linhaL, colunaL)) then
    print("valida 1")
    if(validaPosicao(linha, coluna, linhaL, colunaL)) then
      movimentaPecaEDama(linha, coluna, linhaL, colunaL)
      print("valida 2")
      return true
    elseif(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
      movimentaPecaDama(linha, coluna, linhaL, colunaL)
      print("valida 3")
      return true
    elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
      novaCaptura(linhaL, colunaL)
      print("valida 4")
      return true
    end
  end
  return false
end