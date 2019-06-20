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
  tabuleiro[1][2] = jogador2.peca
  tabuleiro[1][4] = jogador2.peca
  tabuleiro[1][6] = jogador2.peca
  tabuleiro[1][8] = jogador2.peca
  tabuleiro[2][1] = jogador2.peca
  tabuleiro[2][3] = jogador2.peca
  tabuleiro[2][5] = jogador2.peca
  tabuleiro[2][7] = jogador2.peca
  tabuleiro[3][2] = jogador2.peca
  tabuleiro[3][4] = jogador2.peca
  tabuleiro[3][6] = jogador2.peca
  tabuleiro[3][8] = jogador2.peca

  tabuleiro[6][1] = jogador1.peca
  tabuleiro[6][3] = jogador1.peca
  tabuleiro[6][5] = jogador1.peca
  tabuleiro[6][7] = jogador1.peca
  tabuleiro[7][2] = jogador1.peca
  tabuleiro[7][4] = jogador1.peca
  tabuleiro[7][6] = jogador1.peca
  tabuleiro[7][8] = jogador1.peca
  tabuleiro[8][1] = jogador1.peca
  tabuleiro[8][3] = jogador1.peca
  tabuleiro[8][5] = jogador1.peca
  tabuleiro[8][7] = jogador1.peca
end

function movimentaPecaEDama(linha, coluna, linhaL, colunaL)
  tabuleiro[linhaL][colunaL] = tabuleiro[linha][coluna]
  tabuleiro[linha][coluna] = ' '
  if(linhaL == 1 or linhaL == 8) then
    transformaEmDama(linhaL, colunaL)
  end
end

function verDama(linha, coluna)
  if(tabuleiro[linha][coluna] == 'DB' or tabuleiro[linha][coluna] == 'DP') then
    return true
  end
  return false
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

function validaPosicaoPeca(linha, coluna, linhaL, colunaL)
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
  return false
end

function validaposicaoDama(linha, coluna, linhaL, colunaL)
  if(verDama(linha, coluna)) then
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
  end
  return false
end

function validaPosicao(linha, coluna, linhaL, colunaL)
  if(tabuleiro[linha][coluna] == 'B' or tabuleiro[linha][coluna] == 'P') then
    if(validaPosicaoPeca(linha, coluna, linhaL, colunaL)) then
      return true
    end
  end
  if(tabuleiro[linha][coluna] == 'DB' or tabuleiro[linha][coluna] == 'DP') then
    if(validaPosicaoDama(linha, coluna, linhaL, colunaL)) then
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

function verificaArea(linhaL, colunaL)
  posicao1 = tabuleiro[linhaL - 1][colunaL - 1]
  posicao2 = tabuleiro[linhaL + 1][colunaL - 1]
  posicao3 = tabuleiro[linhaL - 1][colunaL + 1]
  posicao4 = tabuleiro[linhaL + 1][colunaL + 1]

  if(tabuleiro[linhaL][colunaL] == 'B' or tabuleiro[linhaL][colunaL] == 'DB') then
    if(posicao1 == 'P' or posicao1 == 'DP') then
      if(verificaVazio(linhaL - 2, colunaL - 2)) then
        return true
      end
    end
    if(posicao2 == 'P' or posicao1 == 'DP') then
      if(verificaVazio(linhaL + 2, colunaL - 2)) then
        return true
      end
    end
    if(posicao3 == 'P' or posicao1 == 'DP') then
      if(verificaVazio(linhaL - 2, colunaL + 2)) then
        return true
      end
    end
    if(posicao4 == 'P' or posicao1 == 'DP') then
      if(verificaVazio(linhaL + 2, colunaL + 2)) then
        return true
      end
    end
  elseif(tabuleiro[linhaL][colunaL] == 'P' or tabuleiro[linhaL][colunaL] == 'DP') then
    if(posicao1 == 'B' or posicao1 == 'DB') then
      if(verificaVazio(linhaL - 2, colunaL - 2)) then
        return true
      end
    end
    if(posicao2 == 'B' or posicao1 == 'DB') then
      if(verificaVazio(linhaL + 2, colunaL - 2)) then
        return true
      end
    end
    if(posicao3 == 'B' or posicao1 == 'DB') then
      if(verificaVazio(linhaL - 2, colunaL + 2)) then
        return true
      end
    end
    if(posicao4 == 'B' or posicao1 == 'DB') then
      if(verificaVazio(linhaL + 2, colunaL + 2)) then
        return true
      end
    end
  end
  return false
end
