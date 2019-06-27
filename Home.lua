local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 function newGame()
    composer.gotoScene("Jogo", {effect = "fromBottom", time = 1000})
 end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
    local myImage = display.newImage(sceneGroup, "Tabuleiro.jpg",display.contentCenterX, display.contentCenterY)
    myImage:scale(1.4,1.4)
    local texto = 
    {
        parent = sceneGroup,
        text = "Damas",
        x = display.contentCenterX,
        y = 155,
        font = native.systemFont,
        fontSize = 40
    }
    local titulo = display.newText(texto)
    titulo:setFillColor(70/255,130/255,180/255)


    local myImage1 = display.newImage(sceneGroup, "PecaPreta.png", 125, 236)
    myImage1:scale(0.3,0.3)
    local myImage2 = display.newImage(sceneGroup, "PecaBranca.png", 125, 244)
    myImage2:scale(0.3,0.3)
    local myImage1 = display.newImage(sceneGroup, "PecaBranca.png", 195, 238)
    myImage1:scale(0.3,0.3)
    local myImage2 = display.newImage(sceneGroup, "PecaPreta.png", 195, 246)
    myImage2:scale(0.3,0.3)
    local texto =
    {
        parent = sceneGroup,
        text = "Jogar",
        x = display.contentCenterX,
        y = 240,
        font = native.systemFont,
        fontSize = 18
    }
    local game = display.newText(texto)
    game:setFillColor(60/255,179/255,113/255)
    game: addEventListener("touch", newGame)
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