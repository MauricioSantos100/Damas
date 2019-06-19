-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local tabuleiro = require 'Tabuleiro'
local pecas = require 'Pecas'
local jogador = require 'Jogador'


local background = display.newRect(display.contentCenterX, display.contentCenterY, 800, 800):setFillColor(238/255,232/255,170/255)

local tabuleiro = criaTabuleiro()
local jogador1, jogador2 = jogadores()
posicionaPecas()

posXR, posYR = -20, 100
coresTabuleiro = {{176/255, 224/255, 230/255}, {0.73, 0.67, 0.62}}

function newRect(x, y, color)
    rect = display.newRect(x, y, 40, 40)
	rect.fill = color
	return rect
end

function montarTabuleiro()
	for i = 1, 8 do
		for j = 1, 8 do
			local rect = newRect(posXR+40*j, posYR, getCorRet(i,j))
			rect.id = {i,j}
			criarEventoDeToqueRect(rect)
		end
		posYR = posYR + 40
	end
	posXR, posYR = -20, 100
end

function getCorRet(i, j)
	if(i % 2 == 0) then
		if(j % 2 == 0 and i % 2 == 0) then
			cor = coresTabuleiro[1]
        else
			cor = coresTabuleiro[2]
		end
	else
		if(j % 2 == 0) then
			cor = coresTabuleiro[2]
		else
			cor = coresTabuleiro[1]
		end
	end
	return cor
end

posXC, posYC = -20, 100

function novaPeca1(x, y)
	circ = display.newCircle(x, y, 15, 15)
	circ:setFillColor(1,1,1)
	return circ
end

function novaPeca2(x, y)
	circ = display.newCircle(x, y, 15, 15)
	circ:setFillColor(0,0,0)
	return circ
end

function mostrarPecas()
	for i = 1, 8 do
		for j = 1, 8 do
			if(tabuleiro[i][j] == jogador1.peca) then
				local peca = novaPeca1(posXC+40*j, posYC)
			elseif(tabuleiro[i][j] == jogador2.peca) then
				local peca = novaPeca2(posXC+40*j, posYC)
			end
		end
		posYC = posYC + 40
	end
	posXC, posYC = -20, 100
end

posicaoClicada = nil
pecaClicada = nil
player = 1

function jogar()
	if(player == 1) then
		if(movimentaPecasB(pecaClicada[1], pecaClicada[2], posicaoClicada[1], posicaoClicada[2])) then
			player = 2
		end
	elseif(player == 2) then
		if(movimentaPecasB(pecaClicada[1], pecaClicada[2], posicaoClicada[1], posicaoClicada[2])) then
			player = 1
		end
	end

	posicaoClicada = nil
	pecaClicada = nil
	montarTabuleiro()
	mostrarPecas()
end

function selecionarPecaLocal(event)
	click = event.target.id
	if(event.phase == "began") then
		if(player == 1 and tabuleiro[click[1]][click[2]] == "B" or tabuleiro[click[1]][click[2]] == "DB") then
			if(pecaClicada == nil) then
				pecaClicada = click
				print("Jogador 1")
			end
		elseif(player == 2 and tabuleiro[click[1]][click[2]] == "P" or tabuleiro[click[1]][click[2]] == "DP") then
			if(pecaClicada == nil) then
				pecaClicada = click
				print("Jogador 2")
			end
		elseif(pecaClicada ~= nil) then
			posicaoClicada = click
			print("local")
			jogar()
		end
	end
end

function criarEventoDeToqueRect(rect)
	rect: addEventListener("touch", selecionarPecaLocal)
end

montarTabuleiro()
mostrarPecas()
































local circ = display.newCircle(100, 50, 15, 15)
circ:setFillColor(1,1,1)
local circ1 = display.newCircle(100, 50, 10, 10)
circ1:setFillColor(192/255,192/255,192/255)
local circ2 = display.newCircle(100, 50, 5, 5)
circ2:setFillColor(1,1,1)


local circ = display.newCircle(200, 50, 15, 15)
circ:setFillColor(0,0,0)
local circ1 = display.newCircle(200, 50, 10, 10)
circ1:setFillColor(169/255,169/255,169/255)
local circ2 = display.newCircle(200, 50, 5, 5)
circ2:setFillColor(0,0,0)