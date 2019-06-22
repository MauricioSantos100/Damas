function criaTabuleiro()
  tabuleiro = {}
  
  for i = 1, 8, 1 do
    tabuleiro[i] = {}
    for j = 1, 8, 1 do
      tabuleiro[i][j] = ' '
    end
  end
  return tabuleiro
end
tabuleiro = criaTabuleiro()

function posicionaPecas()
  -- tabuleiro[1][2] = jogador2.peca
  -- tabuleiro[1][4] = jogador2.peca
  -- tabuleiro[1][6] = jogador2.peca
  -- tabuleiro[1][8] = jogador2.peca
  -- tabuleiro[2][1] = jogador2.peca
  -- tabuleiro[2][3] = jogador2.peca
  -- tabuleiro[2][5] = jogador2.peca
  -- tabuleiro[2][7] = jogador2.peca
  tabuleiro[3][2] = jogador2.peca
  tabuleiro[3][4] = jogador2.dama
  tabuleiro[3][6] = jogador2.peca
  tabuleiro[3][8] = jogador2.peca

  tabuleiro[6][1] = jogador1.peca
  tabuleiro[6][3] = jogador1.peca
  tabuleiro[6][5] = jogador1.dama
  tabuleiro[6][7] = jogador1.peca
  -- tabuleiro[7][2] = jogador1.peca
  -- tabuleiro[7][4] = jogador1.peca
  -- tabuleiro[7][6] = jogador1.peca
  -- tabuleiro[7][8] = jogador1.peca
  -- tabuleiro[8][1] = jogador1.peca
  -- tabuleiro[8][3] = jogador1.peca
  -- tabuleiro[8][5] = jogador1.peca
  -- tabuleiro[8][7] = jogador1.peca
end

function movimentaPecaEDama(linha, coluna, linhaL, colunaL)
  tabuleiro[linhaL][colunaL] = tabuleiro[linha][coluna]
  tabuleiro[linha][coluna] = ' '
  transformaEmDama(linhaL, colunaL)
end

function verificaLinhaColuna(linha, coluna)
  if((linha >= 1 and linha <= 8) and (coluna >= 1 and coluna <= 8)) then
    return true
  end
  return false
end

function verificaVazio(linhaL, colunaL)
  if(tabuleiro[linhaL][colunaL] == ' ') then
    return true
  end
  return false
end

function verPecaB(linha, coluna)
  if(tabuleiro[linha][coluna] == jogador1.peca) then
    return true
  end
  return false
end

function verPecaP(linha, coluna)
  if(tabuleiro[linha][coluna] == jogador2.peca) then
    return true
  end
  return false
end

function verDamaB(linha, coluna)
  if(tabuleiro[linha][coluna] == jogador1.dama) then
    return true
  end
  return false
end

function verDamaP(linha, coluna)
  if(tabuleiro[linha][coluna] ==  jogador2.dama) then
    return true
  end
  return false
end

function validaPosicaoPeca(linha, coluna, linhaL, colunaL)
  if(verificaVazio(linhaL, colunaL)) then
    if(tabuleiro[linha][coluna] == 'B') then
      if(linha - 1 == linhaL) then
        if(coluna + 1 == colunaL or coluna - 1 == colunaL) then
          return true
        end
      end
    elseif(tabuleiro[linha][coluna] == 'P') then
      if(linha + 1 == linhaL) then
        if(coluna + 1 == colunaL or coluna - 1 == colunaL) then
          return true
        end
      end
    end
  end
  return false
end

function validaposicaoDama(linha, coluna, linhaL, colunaL)
  if(linha > linhaL) then
    distancia = linha - linhaL
  else
    distancia = linhaL - linha
  end

  if(linhaL < linha  and  colunaL < coluna) then
    for i = 1, distancia, 1 do
      if(tabuleiro[linha - i][coluna - i] ~= ' ') then
        return false
      end
      linhaN = linha - i
      colunaN = coluna - i
    end
    if(linhaN == linhaL and colunaN == colunaL) then
      return true
    end
  elseif(linhaL < linha  and  colunaL > coluna) then
    for i = 1, distancia, 1 do
      if(tabuleiro[linha - i][coluna + i] ~= ' ') then
        return false
      end
      linhaN = linha - i
      colunaN = coluna + i
    end
    if(linhaN == linhaL and colunaN == colunaL) then
      return true
    end
  elseif(linhaL > linha  and  colunaL < coluna) then
    for i = 1, distancia, 1 do
      if(tabuleiro[linha + i][coluna - i] ~= ' ') then
        return false
      end
      linhaN = linha + i
      colunaN = coluna - i
    end
    if(linhaN == linhaL and colunaN == colunaL) then
      return true
    end
  elseif(linhaL > linha  and  colunaL > coluna) then
    for i = 1, distancia, 1 do
      if(tabuleiro[linha + i][coluna + i] ~= ' ') then
        return false
      end
      linhaN = linha + i
      colunaN = coluna + i
    end
    if(linhaN == linhaL and colunaN == colunaL) then
      return true
    end
  end
  return false
end

function trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
  subtraiPeca(linhaN,colunaN)
  tabuleiro[linhaL][colunaL] = tabuleiro[linha][coluna]
  tabuleiro[linhaN][colunaN] = ' '
  tabuleiro[linha][coluna] = ' '
  transformaEmDama(linhaL, colunaL)
end

function verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN)
  if(tabuleiro[linha][coluna] == 'B') then
    if(tabuleiro[linhaN][colunaN] == 'P' or tabuleiro[linhaN][colunaN] == 'DP') then
      trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
      return true
    end
  elseif(tabuleiro[linha][coluna] == 'P') then
    if(tabuleiro[linhaN][colunaN] == 'B' or tabuleiro[linhaN][colunaN] == 'DB') then
      trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
      return true
    end
  elseif(tabuleiro[linha][coluna] == 'DB') then
    if(tabuleiro[linhaN][colunaN] == 'P' or tabuleiro[linhaN][colunaN] == 'DP') then
      trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
      return true
    end
  elseif(tabuleiro[linha][coluna] == 'DP') then
    if(tabuleiro[linhaN][colunaN] == 'B' or tabuleiro[linhaN][colunaN] == 'DB') then
      trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
      return true
    end
  end
  return false
end

function capturaPeca(linha, coluna, linhaL, colunaL)
  if(verificaVazio(linhaL, colunaL)) then
    if(linhaL < linha  and  colunaL < coluna) then
      linhaN = linhaL + 1
      colunaN = colunaL + 1
      if(verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN)) then
        return true
      end
    end

    if(linhaL < linha and colunaL > coluna) then
      linhaN = linhaL + 1
      colunaN = colunaL - 1
      if(verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN)) then
        return true
      end
    end

    if(linhaL > linha and colunaL < coluna) then
      linhaN = linhaL - 1
      colunaN = colunaL + 1
      if(verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN)) then
        return true
      end
    end

    if(linhaL > linha and colunaL > coluna) then
      linhaN = linhaL - 1
      colunaN = colunaL - 1
      if(verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN)) then
        return true
      end
    end
  end
  return false
end

function verificaLinhaColuna(linha, coluna)
  if((linha >= 1 and linha <= 8) and (coluna >= 1 and coluna <= 8)) then
    return true
  end
  return false
end

function verificaArea(linhaL, colunaL)
  posicao1 = nil
  posicao2 = nil
  posicao3 = nil
  posicao4 = nil
  if(verificaLinhaColuna(linhaL - 1, colunaL - 1)) then
    posicao1 = tabuleiro[linhaL - 1][colunaL - 1]
  end
  if(verificaLinhaColuna(linhaL + 1, colunaL - 1)) then
    posicao2 = tabuleiro[linhaL + 1][colunaL - 1]
  end
  if(verificaLinhaColuna(linhaL - 1, colunaL + 1)) then
    posicao3 = tabuleiro[linhaL - 1][colunaL + 1]
  end
  if(verificaLinhaColuna(linhaL + 1, colunaL + 1)) then
    posicao4 = tabuleiro[linhaL + 1][colunaL + 1]
  end

  if(tabuleiro[linhaL][colunaL] == 'B' or tabuleiro[linhaL][colunaL] == 'DB') then
    if(posicao1 ~= nill and posicao1 == 'P' or posicao1 == 'DP') then
      if(verificaLinhaColuna(linhaL - 2, colunaL - 2)) then
        if(verificaVazio(linhaL - 2, colunaL - 2)) then
          return true
        end
      end
    end
    if(posicao2 ~= nill and posicao2 == 'P' or posicao2 == 'DP') then
      if(verificaLinhaColuna(linhaL + 2, colunaL - 2)) then
        if(verificaVazio(linhaL + 2, colunaL - 2)) then
          return true
        end
      end
    end
    if(posicao3 ~= nill and posicao3 == 'P' or posicao3 == 'DP') then
      if(verificaLinhaColuna(linhaL - 2, colunaL + 2)) then
        if(verificaVazio(linhaL - 2, colunaL + 2)) then
          return true
        end
      end
    end
    if(posicao4 ~= nill and posicao4 == 'P' or posicao4 == 'DP') then
      if(verificaLinhaColuna(linhaL + 2, colunaL + 2)) then
        if(verificaVazio(linhaL + 2, colunaL + 2)) then
          return true
        end
      end
    end
  elseif(tabuleiro[linhaL][colunaL] == 'P' or tabuleiro[linhaL][colunaL] == 'DP') then
    if(posicao1 ~= nil and posicao1 == 'B' or posicao1 == 'DB') then
      if(verificaLinhaColuna(linhaL - 2, colunaL - 2)) then
        if(verificaVazio(linhaL - 2, colunaL - 2)) then
          return true
        end
      end
    end
    if(posicao2 ~= nil and posicao2 == 'B' or posicao2 == 'DB') then
      if(verificaLinhaColuna(linhaL + 2, colunaL - 2)) then
        if(verificaVazio(linhaL + 2, colunaL - 2)) then
          return true
        end
      end
    end
    if(posicao3 ~= nil and posicao3 == 'B' or posicao3 == 'DB') then
      if(verificaLinhaColuna(linhaL - 2, colunaL + 2)) then
        if(verificaVazio(linhaL - 2, colunaL + 2)) then
          return true
        end
      end
    end
    if(posicao4 ~= nil and posicao4 == 'B' or posicao4 == 'DB') then
      if(verificaLinhaColuna(linhaL + 2, colunaL + 2)) then
        if(verificaVazio(linhaL + 2, colunaL + 2)) then
          return true
        end
      end
    end
  end
  return false
end

function movimentaPecasB(linha, coluna, linhaL, colunaL)
  if(verPecaB(linha, coluna)) then
    if(validaPosicaoPeca(linha, coluna, linhaL, colunaL)) then
      movimentaPecaEDama(linha, coluna, linhaL, colunaL)
      return 1
    elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
      if(verificaArea(linhaL, colunaL)) then
        return 2
      end
      return 1
    end
  elseif(verDamaB(linha, coluna)) then
    if(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
      movimentaPecaEDama(linha, coluna, linhaL, colunaL)
      return 1
    end
  end
  return 0
end

function movimentaPecasP(linha, coluna, linhaL, colunaL)
  if(verPecaP(linha, coluna)) then
    if(validaPosicaoPeca(linha, coluna, linhaL, colunaL)) then
      movimentaPecaEDama(linha, coluna, linhaL, colunaL)
      return 1
    elseif(capturaPeca(linha, coluna, linhaL, colunaL)) then
      if(verificaArea(linhaL, colunaL)) then
        return 2
      end
      return 1
    end
  elseif(verDamaP(linha, coluna)) then
    if(validaposicaoDama(linha, coluna, linhaL, colunaL)) then
      movimentaPecaEDama(linha, coluna, linhaL, colunaL)
      return 1
    end
  end
  return 0
end