function jogadores()
  jogador1 = {nome = 'Jogador1', peca = 'B', quantPecas = 12, dama = 'DB', quantDamas = 0}
  jogador2 = {nome = 'Jogador2', peca = 'P', quantPecas = 12, dama = 'DP', quantDamas = 0}
  return jogador1, jogador2
end

function subtraiPeca(linhaN,colunaN)
  if(tabuleiro[linhaN][colunaN] == 'B') then
    jogador1.quantPecas = jogador1.quantPecas - 1
  elseif(tabuleiro[linhaN][colunaN] == 'P') then
    jogador2.quantPecas = jogador2.quantPecas - 1
  elseif(tabuleiro[linhaN][colunaN] == 'DB') then
    jogador1.quantDamas = jogador1.quantDamas - 1
  elseif(tabuleiro[linhaN][colunaN] == 'DP') then
    jogador2.quantDamas = jogador2.quantDamas - 1
  end
end

function adicionaDama(linhaL,colunaL)
  if(tabuleiro[linhaL][colunaL] == 'DB') then
    jogador1.quantDamas = jogador1.quantDamas + 1
    jogador1.quantPecas = jogador1.quantPecas - 1
  elseif(tabuleiro[linhaL][colunaL] == 'BP') then
    jogador2.quantDamas = jogador2.quantDamas + 1
    jogador2.quantPecas = jogador2.quantPecas - 1
  end
end

function transformaEmDama(linhaL, colunaL)
  if(tabuleiro[linhaL][colunaL] == 'B') then
    if(linhaL == 1) then
      if(colunaL == 2 or colunaL == 4 or colunaL == 6 or colunaL == 8) then
        tabuleiro[linhaL][colunaL] = 'DB'
        adicionaDama(linhaL,colunaL)
      end
    end
  elseif(tabuleiro[linhaL][colunaL] == 'P') then
    if(linhaL == 8) then
      if(colunaL == 1 or colunaL == 3 or colunaL == 5 or colunaL == 7) then
        tabuleiro[linhaL][colunaL] = 'DP'
        adicionaDama(linhaL,colunaL)
      end
    end
  end
end

contador = 0
pecas1 = 12
pecas2 = 12
damas1 = 0
damas2 = 0
function alternaJogador()
  parar = false
  while(parar == false) do
    if(parar == false) then
      jogou = false
      while(jogou == false) do
        print(jogador1.nome)
        if(movimentaPecasB()) then
          print()
          mostraTabuleiro()
          jogou = true
        end
      end
      if(jogador2.quantPecas == 0 and jogador2.quantDamas == 0) then
        io.write(jogador1.nome..' você venceu.')
        parar = true
      else
        if(jogador2.quantPecas == pecas2 and jogador2.quantDamas == damas2) then
          contador = contador + 1
          if(contador == 20) then
            io.write('Empate!')
            parar = true
          end
        end
        if(jogador2.quantPecas ~= pecas2 or jogador2.quantDamas ~= damas2) then
          pecas2 = jogador2.quantPecas
          damas2 = jogador2.quantDamas
          contador = 0
        end
      end
    end

    if(parar == false) then
      jogou = false
      while(jogou == false) do
        print(jogador2.nome)
        if(movimentaPecasP()) then
          print()
          mostraTabuleiro()
          jogou = true
        end
      end
      if(jogador1.quantPecas == 0 and jogador1.quantDamas == 0) then
        io.write(jogador2.nome..' você venceu.')
        parar = true
      else
        if(jogador1.quantPecas == pecas1 and jogador1.quantDamas == damas1) then
          contador = contador + 1
          if(contador == 20) then
            io.write('Empate!')
            parar = true
          end
        end
        if(jogador2.quantPecas ~= pecas2 or jogador2.quantDamas ~= damas2) then
          pecas2 = jogador2.quantPecas
          damas2 = jogador2.quantDamas
          contador = 0
        end
      end
    end
  end
end