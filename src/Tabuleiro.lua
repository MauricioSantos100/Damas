tabuleiro = {}
function criaTabuleiro()
    for i = 1, 8, 1 do
        tabuleiro[i] = {}
        for j = 1, 8, 1 do
            tabuleiro[i][j] = ' '
        end
    end
end

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

function mostraTabuleiro()
  for i = 1, 8, 1 do
    for j = 1, 8, 1 do
      if(tabuleiro[i][j] == ' ') then
        io.write('[  ]')
      elseif(tabuleiro[i][j] == 'B' or tabuleiro[i][j] == 'P') then
        io.write('['..tabuleiro[i][j]..' ]')
      else
        io.write('['..tabuleiro[i][j]..']')
      end
    end
    print()
  end
end

--vejo se a casa digitada contem uma peca branca
function verPecaB(linha, coluna)
  if(tabuleiro[linha][coluna] == jogador1.peca or tabuleiro[linha][coluna] == jogador1.dama) then
    return true
  end
  return false
end

--vejo se a casa digitada contem uma peca preta
function verPecaP(linha, coluna)
  if(tabuleiro[linha][coluna] == jogador2.peca or tabuleiro[linha][coluna] == jogador2.dama) then
    return true
  end
  return false
end

--vejo se a casa para onde vai ser movida esta Fazia
function verificaVazio(linhaL, colunaL)
  if(tabuleiro[linhaL][colunaL] == ' ') then
    return true
  end
  return false
end

--faz a mudanca no tabuleiro apois uma dama andar
function PecasDamas(linha, coluna, linhaL, colunaL)
  tabuleiro[linhaL][colunaL] = tabuleiro[linha][coluna]
  tabuleiro[linha][coluna] = ' '
  transformaEmDama(linhaL, colunaL)
end

--vejo se o local para onde vai ser movida é Valida/Possivel
function validaPosicao(linha, coluna, linhaL, colunaL)
  if((tabuleiro[linha][coluna] == 'B') and (linha - 1 == linhaL and coluna + 1 == colunaL) or (linha - 1 == linhaL and coluna - 1 == colunaL)) then
      PecasDamas(linha, coluna, linhaL, colunaL)
    return true
  elseif((tabuleiro[linha][coluna] == 'P') and (linha + 1 == linhaL and coluna - 1 == colunaL) or (linha + 1 == linhaL and coluna + 1 == colunaL)) then
    PecasDamas(linha, coluna, linhaL, colunaL)
    return true
  end
  return false
end

--faz a verificacao para movimentar a dama
function validaposicaoDama(linha, coluna, linhaL, colunaL)
  if(linha > linhaL) then
    distancia = linha - linhaL
  elseif(linha < linhaL) then
    distancia = linhaL - linha
  end

  if(tabuleiro[linha][coluna] == 'DB' or tabuleiro[linha][coluna] == 'DP') then
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

--faz a mudanca no tabuleiro apois uma peca ser capturada
function trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
  tabuleiro[linhaL][colunaL] = tabuleiro[linha][coluna]
  tabuleiro[linhaN][colunaN] = ' '
  tabuleiro[linha][coluna] = ' '
  transformaEmDama(linhaL, colunaL)
end

--valida a posicao atual da peca e a posicao da peca inimiga
function verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN)
  if (tabuleiro[linha][coluna] == 'B' and tabuleiro[linhaN][colunaN] == 'P' or tabuleiro[linha][coluna] == 'P' and tabuleiro[linhaN][colunaN] == 'B') then
    subtraiPeca(linhaN,colunaN)
    trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
    return true
  elseif(tabuleiro[linha][coluna] == 'B' and tabuleiro[linhaN][colunaN] == 'DP' or tabuleiro[linha][coluna] == 'P' and tabuleiro[linhaN][colunaN] == 'DB') then
    subtraiPeca(linhaN,colunaN)
    trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
    return true
  elseif(tabuleiro[linha][coluna] == 'DB' and tabuleiro[linhaN][colunaN] == 'P' or tabuleiro[linha][coluna] == 'DP' and tabuleiro[linhaN][colunaN] == 'B') then
    subtraiPeca(linhaN,colunaN)
    trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
    return true
  elseif(tabuleiro[linha][coluna] == 'DB' and tabuleiro[linhaN][colunaN] == 'DP' or tabuleiro[linha][coluna] == 'DP' and tabuleiro[linhaN][colunaN] == 'DB') then
    subtraiPeca(linhaN,colunaN)
    trocaPecas(linha, coluna, linhaL, colunaL, linhaN, colunaN)
    return true
  end
  return false
end

--vejo se é possivel comer uma peca
function capturaPeca(linha, coluna, linhaL, colunaL)
  if(verificaVazio(linhaL, colunaL) == true) then
    if(linhaL < linha  and  colunaL < coluna) then
      linhaN = linhaL + 1
      colunaN = colunaL + 1
      if(verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN) == true) then
        return true
      end
    end

    if(linhaL < linha and colunaL > coluna) then
      linhaN = linhaL + 1
      colunaN = colunaL - 1
      if(verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN) == true) then
        return true
      end
    end

    if(linhaL > linha and colunaL < coluna) then
      linhaN = linhaL - 1
      colunaN = colunaL + 1
      if(verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN) == true) then
        return true
      end
    end

    if(linhaL > linha and colunaL > coluna) then
      linhaN = linhaL - 1
      colunaN = colunaL - 1
      if(verificaNovaLinha(linha, coluna, linhaL, colunaL, linhaN, colunaN) == true) then
        return true
      end
    end
  end
  return false
end

--verifica se tem uma peca inimiga proxima
function verificaArea(linhaL, colunaL)
  posicao1 = tabuleiro[linhaL - 1][colunaL - 1]
  posicao2 = tabuleiro[linhaL - 1][colunaL + 1]
  posicao3 = tabuleiro[linhaL + 1][colunaL - 1]
  posicao4 = tabuleiro[linhaL + 1][colunaL + 1]

  if(posicao1 ~= tabuleiro[linhaL][colunaL] and posicao1 ~= ' ') then
    return true
  elseif(posicao2 ~= tabuleiro[linhaL][colunaL] and posicao1 ~= ' ') then
    return true
  elseif(posicao3 ~= tabuleiro[linhaL][colunaL] and posicao1 ~= ' ') then
    return true
  elseif(posicao4 ~= tabuleiro[linhaL][colunaL] and posicao1 ~= ' ') then
    return true
  end
  return false
end

--continua a captura de pecas em uma mesma jogada
function novaCaptura(linha, coluna)
  continuar = verificaArea(linha, coluna)
  while(continuar) do
    linhaL, colunaL = selecionaLocal()
    if(capturaPeca(linha, coluna, linhaL, colunaL)) then
      linha = linhaL
      coluna = colunaL
      novaCaptura(linha, coluna)
    end
  end
end