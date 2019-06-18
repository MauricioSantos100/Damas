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

function montarTrabuleiro()
	ID = 1
	for i = 1, 8 do
		for j = 1, 8 do
			local rect = newRect(posXR+40*j, posYR, getCorRet(i,j))
			rect.id = ID
			rect.tipo = "T"
			criarEventoDeToqueRect(rect)
			ID = ID + 1
		end
		posYR = posYR + 40
	end
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

function mostraPecas()
	ID = 1
	for i = 1, 8 do
		for j = 1, 8 do
			if(tabuleiro[i][j] == jogador1.peca) then
				local peca = novaPeca1(posXC+40*j, posYC)
				peca.id = ID
				peca.tipo = "P"
				criarEventoDeToqueCirc(peca)
				ID = ID + 1
			elseif(tabuleiro[i][j] == jogador2.peca) then
				local peca = novaPeca2(posXC+40*j, posYC)
				peca.id = ID
				peca.tipo = "P"
				criarEventoDeToqueCirc(peca)
				ID = ID + 1
			else
				ID = ID + 1
			end
		end
		posYC = posYC + 40
	end
end

posicaoClicada = 0
pecaClicada = 0

function verificacaoDaJogada(pecaClicada, posicaoClicada)
	posicaoPeca = mapearPosicaoTelaTabuleiro(pecaClicada)
	posicaoTabuleiro = mapearPosicaoTelaTabuleiro(posicaoClicada)
	movimentaPecasB(posicaoPeca[1], posicaoPeca[2], posicaoTabuleiro[1], posicaoTabuleiro[2])
	posicaoClicada = 0
	pecaClicada = 0
end

function selecionarLocal(event)
	if(event.phase == "began" and event.target.tipo == "T" and pecaClicada ~= 0) then
		posicaoClicada = event.target.id
		print(posicaoClicada)
		verificacaoDaJogada(pecaClicada, posicaoClicada)
	end
end

function selecionarPeca(event)
	if(event.phase == "began" and event.target.tipo == "P") then
		pecaClicada = event.target.id
		print(pecaClicada)
	end
end

function mapearPosicaoTelaTabuleiro(posicao)
	if(posicao == 1) then
		return {1,1}
	elseif(posicao == 2) then
		return {1,2}
	elseif(posicao == 3) then
		return {1,3}
	elseif(posicao == 4) then
		return {1,4}
	elseif(posicao == 5) then
		return {1,5}
	elseif(posicao == 6) then
		return {1,6}
	elseif(posicao == 7) then
		return {1,7}
	elseif(posicao == 8) then
		return {1,8}
	elseif(posicao == 9) then
		return {2,1}
	elseif(posicao == 10) then
		return {2,2}
	elseif(posicao == 11) then
		return {2,3}
	elseif(posicao == 12) then
		return {2,4}
	elseif(posicao == 13) then
		return {2,5}
	elseif(posicao == 14) then
		return {2,5}
	elseif(posicao == 15) then
		return {2,6}
	elseif(posicao == 16) then
		return {2,7}
	elseif(posicao == 17) then
		return {2,8}
	elseif(posicao == 18) then
		return {3,1}
	elseif(posicao == 19) then
		return {3,2}
	elseif(posicao == 20) then
		return {3,3}
	elseif(posicao == 21) then
		return {3,4}
	elseif(posicao == 22) then
		return {3,5}
	elseif(posicao == 23) then
		return {3,6}
	elseif(posicao == 24) then
		return {3,7}
	elseif(posicao == 25) then
		return {3,8}
	elseif(posicao == 26) then
		return {4,1}
	elseif(posicao == 27) then
		return {4,2}
	elseif(posicao == 28) then
		return {4,3}
	elseif(posicao == 29) then
		return {4,4}
	elseif(posicao == 30) then
		return {4,5}
	elseif(posicao == 31) then
		return {4,6}
	elseif(posicao == 32) then
		return {4,7}
	elseif(posicao == 33) then
		return {4,8}
	elseif(posicao == 34) then
		return {5,1}
	elseif(posicao == 35) then
		return {5,2}
	elseif(posicao == 36) then
		return {5,3}
	elseif(posicao == 37) then
		return {5,4}
	elseif(posicao == 38) then
		return {5,5}
	elseif(posicao == 39) then
		return {5,6}
	elseif(posicao == 40) then
		return {5,7}
	elseif(posicao == 41) then
		return {5,8}
	elseif(posicao == 42) then
		return {6,1}
	elseif(posicao == 43) then
		return {6,2}
	elseif(posicao == 44) then
		return {6,3}
	elseif(posicao == 45) then
		return {6,4}
	elseif(posicao == 46) then
		return {6,5}
	elseif(posicao == 47) then
		return {6,6}
	elseif(posicao == 48) then
		return {6,7}
	elseif(posicao == 49) then
		return {6,8}
	elseif(posicao == 50) then
		return {7,1}
	elseif(posicao == 51) then
		return {7,2}
	elseif(posicao == 52) then
		return {7,3}
	elseif(posicao == 53) then
		return {7,4}
	elseif(posicao == 54) then
		return {7,5}
	elseif(posicao == 55) then
		return {7,6}
	elseif(posicao == 56) then
		return {7,7}
	elseif(posicao == 57) then
		return {7,8}
	elseif(posicao == 58) then
        return {8,1}
    elseif(posicao == 59) then
        return {8,2}
    elseif(posicao == 60) then
        return {8,3}
    elseif(posicao == 61) then
        return {8,4}
    elseif(posicao == 62) then
        return {8,5}
    elseif(posicao == 63) then
        return {8,6}
    elseif(posicao == 64) then
        return {8,7}
    elseif(posicao == 65) then
        return {8,8}
	end
end

function criarEventoDeToqueRect(rect)
	rect: addEventListener("touch", selecionarLocal)
end

function criarEventoDeToqueCirc(peca)
	circ: addEventListener("touch", selecionarPeca)
end

montarTrabuleiro()
mostraPecas()































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