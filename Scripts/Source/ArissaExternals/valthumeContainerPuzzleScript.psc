Scriptname valthumeContainerPuzzleScript extends ObjectReference  
{The container puzzle in which the player must deposit the organs of the dragon priest into the correct urn.}
import debug
import utility

objectReference Property controllerScript auto
valthumeControllerScript mainScript

MiscObject Property Eyes Auto 
MiscObject Property Heart Auto 
MiscObject Property Brain Auto

Bool Property ContainerEyes Auto
Bool Property ContainerHeart Auto
Bool Property ContainerBrain Auto

Message Property urnMessage Auto
int property button Auto hidden

;return all items to the player and set main variables to zero
function returnitems()
	game.getplayer().additem(brain)
	game.getplayer().additem(eyes)
	game.getplayer().additem(heart)
	mainscript.eyesmain=0
	mainscript.brainmain=0
	mainscript.heartmain=0
	
endfunction

;if the player has none of the three required items in inventory, then consider all items placed
Bool function playerPlacedAll ()
	if (game.getPlayer().getItemCount(eyes)==0 && game.getPlayer().getItemCount(brain)==0 && game.getPlayer().getItemCount(heart)==0)
		return true
	else 
		return false
	endif
endFunction

;remove part corresponding to the button pressed in message box
function removepart(int i)
	if (i == 1)
		game.getplayer().removeitem(Brain)
	elseif (i == 2)
		game.getplayer().removeitem(Heart)
	elseif (i == 3)
		game.getplayer().removeitem(Eyes)
	endif
endfunction


;set controller script which stores main variables
EVENT onInit ()
	mainScript = controllerScript as valthumeControllerScript
endevent

;when player activates urn
EVENT onActivate (objectReference triggerRef)
	mainScript = controllerScript as valthumeControllerScript

	button=urnMessage.show()
	;check to see which container the player has activated, then set main variable depending on player choice
	;0=Empty
	;1=wrong 2= correct
	if (containerEyes==true)
		if(button==3)
			mainScript.eyesmain = 2
		else
			mainScript.eyesmain = 1
		endif
			
	elseif (containerHeart==true)
		if(button==2)
			mainScript.heartmain = 2
		else
			mainScript.heartmain = 1
		endif
	elseif(containerBrain==true)
		if(button==1)
			mainScript.brainmain = 2
		else
			mainScript.brainmain = 1
		endif
	endif
	
	removePart(button)
	
	;when player has none of the items in inventory, check correctness of placement
	if (playerplacedall())
		if (mainscript.eyesmain==2 && mainscript.brainmain==2 && mainscript.heartmain==2)
			;If the puzzle is solved, disable all the urns and show a quick fire effect, and open passageway
			;messagebox("Puzzle is correct")
			mainScript.brainContainer.Disable()
			mainScript.eyesContainer.Disable()
			mainScript.heartContainer.Disable()
			mainScript.containerFire1.Enable()
			mainScript.containerFire2.Enable()
			mainScript.containerFire3.Enable()
			mainScript.puzzledoor.activate(mainScript.puzzledooractivator)
			wait(1)
			mainScript.containerFire1.Disable()
			mainScript.containerFire2.Disable()
			mainScript.containerFire3.Disable()
		else
			;If the wrong items are placed in the wrong containers, return the items to the player 
			;messagebox("Puzzle is incorrect eyesmain" + mainscript.eyesmain + "brainmain" + mainscript.brainmain + "heartmain" + mainscript.heartmain)
			if (mainscript.eyesmain!=0 && mainscript.brainmain!=0 && mainscript.heartmain!=0)
				returnitems()
			endif
		endif
	endif
			
endEvent  