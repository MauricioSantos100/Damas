jogador1 = {nome = '', peca = 'B', quantPecas = 12, dama = 'DB', quantDamas = 0}
jogador2 = {nome = '', peca = 'P', quantPecas = 12, dama = 'DP', quantDamas = 0}

function atribuiNome(nome, num)
  if(num == 1) then
    for key,value in pairs(jogador1) do
      jogador1.nome = nome
    end
  elseif(num == 2) then
      for key,value in pairs(jogador1) do
      jogador2.nome = nome
    end
  end
end

--diminua a quantidade pecas dos jogadores
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

--aumenta a quantidade de damas dos jogadores
function adicionaDama(linhaL,colunaL)
  if(tabuleiro[linhaL][colunaL] == 'DB') then
    jogador1.quantDamas = jogador1.quantDamas + 1
    jogador1.quantPecas = jogador1.quantPecas - 1
  elseif(tabuleiro[linhaL][colunaL] == 'BP') then
    jogador2.quantDamas = jogador2.quantDamas + 1
    jogador2.quantPecas = jogador2.quantPecas - 1
  end
end

--muda uma peca para dama
function transformaEmDama(linhaL, colunaL)
  if((linhaL == 1 and colunaL == 2) or (linhaL == 1 and colunaL == 4) or (linhaL == 1 and colunaL == 6) or (linhaL == 1 and colunaL == 8) and tabuleiro[linhaL][colunaL] == 'B') then
    tabuleiro[linhaL][colunaL] = 'DB'
    adicionaDama(linhaL, colunaL)
  elseif((linhaL == 8 and colunaL == 1) or (linhaL == 8 and colunaL == 3) or (linhaL == 8 and colunaL == 5) or (linhaL == 8 and colunaL == 7) and tabuleiro[linhaL][colunaL] == 'P') then
    tabuleiro[linhaL][colunaL] = 'DP'
    adicionaDama(linhaL, colunaL)
  end
end

contador = 0
pecas1 = 12
pecas2 = 12
damas1 = 0
damas2 = 0
--alterna entre os jogadores
function AlternaJogador()
  parar = false
  while (parar == false) do
    mover = false
    while (mover == false) do
      print(jogador1.nome)
      if(movimentaPecasB() == true) then
        mover = true
        print()
        mostraTabuleiro()
      end
    end
    if(jogador2.quantPecas == pecas2 and jogador2.quantDamas == damas2) then
      contador = contador + 1
    elseif(jogador2.quantPecas ~= pecas2 or jogador2.quantDamas ~= damas2) then
      pecas2 = jogador2.quantPecas
      damas2 = jogador2.quantDamas
      contador = 0
    end
    if(jogador2.quantPecas == 0 and jogador2.quantDamas == 0) then
      parar = true
    end
    if(contador == 20) then
      parar = true
    end
    mover = false
    while(mover == false) do
      print(jogador2.nome)
      if(movimentaPecasP() == true) then
        mover = true
        print()
        mostraTabuleiro()
      end
    end
    if(jogador1.quantPecas == pecas1 and jogador1.quantDamas == damas1) then
      contador = contador + 1
    elseif(jogador1.quantPecas ~= pecas1 or jogador1.quantDamas ~= damas1) then
      pecas1 = jogador1.quantPecas
      damas1 = jogador1.quantDamas
      contador = 0
    end
    if(jogador1.quantPecas == 0 and jogador1.quantDamas == 0) then
      parar = true
    end
    if(contador == 20) then
      parar = true
    end
  end
end