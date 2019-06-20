function movimentaPecasB(linha, coluna, linhaL, colunaL)
  print("Peca["..linha.."]["..coluna.."], Local[".. linhaL.."][".. colunaL.."]")
  if(verificaVazio(linhaL, colunaL)) then
    print("valida 1")
    if(validaPosicao(linha, coluna, linhaL, colunaL)) then
      movimentaPecaEDama(linha, coluna, linhaL, colunaL)
      print("valida 2")
      return 1
    elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
      if(verificaArea(linhaL, colunaL)) then
        print("valida 3")
        return 2
      end
      print("valida 4")
      return 1
    end
  end
  return 0
end

function movimentaPecasP(linha, coluna, linhaL, colunaL)
  print("Peca["..linha.."]["..coluna.."], Local[".. linhaL.."][".. colunaL.."]")
  if(verificaVazio(linhaL, colunaL)) then
    print("valida 1")
    if(validaPosicao(linha, coluna, linhaL, colunaL)) then
      movimentaPecaEDama(linha, coluna, linhaL, colunaL)
      print("valida 2")
      return 1
    elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
      if(verificaArea(linhaL, colunaL)) then
        print("valida 3")
        return 2
      end
      print("valida 4")
      return 1
    end
  end
  return 0
end