local composer = require( "composer" )
local T = require 'Tabuleiro'
local J = require 'Jogador'

local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 function backHome()
    composer.gotoScene("Home", {effect = "fromTop", time = 1000,})
 end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, 800, 800):setFillColor(20/255,40/255,60/255)

    coresTabuleiro = {{1, 1, 1}, {0, 0, 0}}

    function newRect(x, y, color)
        rect = display.newRect(sceneGroup, x, y, 40, 40)
        rect.fill = color
        return rect
    end

    function montarTabuleiro()
        posXR, posYR = -20, 120
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
        posXC, posYC = -20, 120
        for i = 1, 8 do
            for j = 1, 8 do
                if(tabuleiro[i][j] == jogador1.peca) then
                    local myImage = display.newImage(sceneGroup, "PecaBranca.png", posXC+40*j, posYC)
                    myImage:scale(0.6,0.6)
                elseif(tabuleiro[i][j] == jogador2.peca) then
                    local myImage = display.newImage(sceneGroup, "PecaPreta.png", posXC+40*j, posYC)
                    myImage:scale(0.6,0.6)
                elseif(tabuleiro[i][j] == jogador1.dama) then
                    local myImage = display.newImage(sceneGroup, "DamaBranca.png", posXC+40*j, posYC)
                    myImage:scale(0.6,0.6)
                elseif(tabuleiro[i][j] == jogador2.dama) then
                    local myImage = display.newImage(sceneGroup, "DamaPreta.png", posXC+40*j, posYC)
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
                    print(pecaClicada)
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
        local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, 800, 800):setFillColor(51/255,51/255,51/255)
        local myImage = display.newImage(sceneGroup, "Girar.png", 280, 15)
        myImage:scale(0.7,0.7)
        myImage: addEventListener("touch", novoJogo)
        local myImage = display.newImage(sceneGroup, "Home.png", 40, 15)
        myImage:scale(0.7,0.7)
        myImage: addEventListener("touch", backHome)
        montarTabuleiro()
        mostrarPecas()
        posicaoClicada = nil
        pecaClicada = nil
        player = 1
    end
    novoJogo()
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene