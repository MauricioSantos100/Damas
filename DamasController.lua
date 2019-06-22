local T = require 'Tabuleiro'
local J = require 'Jogador'

local background = display.newRect(display.contentCenterX, display.contentCenterY, 800, 800):setFillColor(20/255,40/255,60/255)

coresTabuleiro = {{1, 1, 1}, {0, 0, 0}}

function newRect(x, y, color)
    rect = display.newRect(x, y, 40, 40)
	rect.fill = color
	return rect
end

function montarTabuleiro()
	posXR, posYR = -20, 100
	for i = 1, 8 do
		for j = 1, 8 do
			local rect = newRect(posXR+40*j, posYR, getCorRet(i,j))
			rect.id = {i,j}
			criarEventoDeToqueRect(rect)
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

function mostrarPecas()
	posXC, posYC = -20, 100
	for i = 1, 8 do
		for j = 1, 8 do
			if(tabuleiro[i][j] == jogador1.peca) then
				local myImage = display.newImage("PecaBranca.png", posXC+40*j, posYC)
				myImage:scale(0.6,0.6)
			elseif(tabuleiro[i][j] == jogador2.peca) then
				local myImage = display.newImage("PecaPreta.png", posXC+40*j, posYC)
				myImage:scale(0.6,0.6)
			elseif(tabuleiro[i][j] == jogador1.dama) then
				local myImage = display.newImage("DamaBranca.png", posXC+40*j, posYC)
				myImage:scale(0.6,0.6)
			elseif(tabuleiro[i][j] == jogador2.dama) then
				local myImage = display.newImage("DamaPreta.png", posXC+40*j, posYC)
				myImage:scale(0.6,0.6)
			end
		end
		posYC = posYC + 40
	end
end

function criarEventoDeToqueRect(rect)
	rect: addEventListener("touch", selecionarPecaLocal)
end

posicaoClicada = nil
pecaClicada = nil
player = 1

function jogar()
	if(player == 1) then
		if(movimentaPecasB(pecaClicada[1], pecaClicada[2], posicaoClicada[1], posicaoClicada[2]) == 1) then
			player = 2
			posicaoClicada = nil
			pecaClicada = nil
		elseif(movimentaPecasB(pecaClicada[1], pecaClicada[2], posicaoClicada[1], posicaoClicada[2]) == 2) then
			pecaClicada = posicaoClicada
			posicaoClicada = nil
		elseif(movimentaPecasB(pecaClicada[1], pecaClicada[2], posicaoClicada[1], posicaoClicada[2]) == 0) then
			posicaoClicada = nil
			pecaClicada = nil
		end
	elseif(player == 2) then
		if(movimentaPecasP(pecaClicada[1], pecaClicada[2], posicaoClicada[1], posicaoClicada[2]) == 1) then
			player = 1
			posicaoClicada = nil
			pecaClicada = nil
		elseif(movimentaPecasP(pecaClicada[1], pecaClicada[2], posicaoClicada[1], posicaoClicada[2]) == 2) then
			pecaClicada = posicaoClicada
			posicaoClicada = nil
		elseif(movimentaPecasP(pecaClicada[1], pecaClicada[2], posicaoClicada[1], posicaoClicada[2]) == 0) then
			posicaoClicada = nil
			pecaClicada = nil
		end
	end
	montarTabuleiro()
	mostrarPecas()
end

function selecionarPecaLocal(event)
    if(event.phase == "began") then
		click = event.target.id
		if(player == 1 and tabuleiro[click[1]][click[2]] == "B" or tabuleiro[click[1]][click[2]] == "DB") then
			if(pecaClicada == nil) then
				pecaClicada = click
			end
		elseif(player == 2 and tabuleiro[click[1]][click[2]] == "P" or tabuleiro[click[1]][click[2]] == "DP") then
			if(pecaClicada == nil) then
				pecaClicada = click
			end
		elseif(pecaClicada ~= nil) then
			posicaoClicada = click
			jogar()
		end
	end
end

function novoJogo()
	local tabuleiro = criaTabuleiro()
	local jogador1, jogador2 = jogadores()
	local pecas = posicionaPecas()
    local background = display.newRect(display.contentCenterX, display.contentCenterY, 800, 800):setFillColor(51/255,51/255,51/255)
	local myImage = display.newImage("Girar.png", 280, 10)
	myImage:scale(0.7,0.7)
	myImage: addEventListener("touch", novoJogo)
	montarTabuleiro()
	mostrarPecas()
	posicaoClicada = nil
	pecaClicada = nil
	player = 1
end

function inicio()
	local myImage = display.newImage("Tabuleiro.jpg",display.contentCenterX, display.contentCenterY)
	myImage:scale(1.4,1.4)
	local texto = 
	{
		text = "Damas",
		x = display.contentCenterX,
		y = 155,
		font = native.systemFont,
		fontSize = 50
	}
	local titulo = display.newText(texto)
	titulo:setFillColor(70/255,130/255,180/255)


	local myImage1 = display.newImage("PecaBranca.png", 105, 240)
	myImage1:scale(0.4,0.4)
	local myImage2 = display.newImage("PecaPreta.png", 215, 240)
	myImage2:scale(0.4,0.4)
	local texto =
	{
		text = "Novo Jogo",
		x = display.contentCenterX,
		y = 240,
		font = native.systemFont,
		fontSize = 18
	}
	local game = display.newText(texto)
	game:setFillColor(60/255,179/255,113/255)
	game: addEventListener("touch", novoJogo)
end
inicio()