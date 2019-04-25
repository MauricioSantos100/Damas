local tabuleiro = require 'Tabuleiro'
local pecas = require 'Pecas'
local jogadores = require 'Jogador'

io.write("Jogador 1 (Peças Brancas) digite seu nome ")
nome = io.read()
atribuiNome(nome, 1)
io.write("Jogador 2 (Peças Pretas) digite seu nome ")
nome = io.read()
atribuiNome(nome, 2)
print()

criaTabuleiro()
posicionaPecas()
mostraTabuleiro()
AlternaJogador()