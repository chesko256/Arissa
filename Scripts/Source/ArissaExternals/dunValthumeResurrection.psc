scriptName dunValthumeResurrection extends ObjectReference
{
Controller script for events when player reaches boss chamber in Valthume
}

import game
import debug
import utility

int property itemplaced auto hidden

;Bool Property ContainerEyes Auto
;Bool Property ContainerHeart Auto
;Bool Property ContainerBrain Auto


objectReference Property controllerScript auto
scene property BossScene auto
dunValthumeControllerScript mainScript

EVENT onInit ()
	mainScript = controllerScript as dunValthumeControllerScript
	;mainscript.itemplaced==0 
endevent




objectReference property OnlyActor auto      
{By default, this property is set to the player}

;if the player has none of the three required items in inventory, then consider all items placed
;Bool function playerPlacedAll ()
;	if (mainScript.itemplaced==3 && game.getPlayer().getItemCount(mainScript.eyes)==0 && game.getPlayer().getItemCount(mainScript.brain)==0 && game.getPlayer().getItemCount(mainScript.heart)==0)
;		return true
;	else 
;		return false
;	endif
;endFunction


;when player activates urn
EVENT onActivate (objectReference triggerRef)
	mainScript = controllerScript as dunValthumeControllerScript
	if mainscript.dunValthumeQST.getstage() == 15  && (game.getPlayer().getItemCount(mainScript.eyes)==0 && game.getPlayer().getItemCount(mainScript.brain)==0 && game.getPlayer().getItemCount(mainScript.heart)==0)
			wait(4)
			mainScript.lightningSpell.cast(mainScript.caster01,mainScript.caster02)
			wait(1)
			mainScript.lightningSpell.cast(mainScript.caster02,mainScript.caster03)
			wait(2)
			mainScript.lightningSpell.cast(mainScript.caster03,mainScript.caster01)
			mainScript.lightningSpell.cast(mainScript.caster01,mainScript.caster02)
			mainScript.fire01.enable()	
			mainScript.firelight01.enable()
			mainScript.fire02.enable()	
			wait(0.5)
			;mainScript.fire03.enable()	 
			mainScript.firelight02.enable()
			;mainScript.fire04.enable()	
			wait(0.5)
			mainScript.fire05.enable()	
			;mainScript.firelight03.enable()
			mainScript.gorvaal.enable()
			mainScript.gorvaal.activate(mainScript.gorvaal)
			mainScript.dunValthumeQST.setstage(40)
			bossScene.start()
			gotoState("allDone")
	endif 
endEvent

State allDone
	;do nothing
endState
	


