scriptName dunHarmugstahlCageSpiders extends objectReference
import Debug
import Utility

;Warlock
objectReference Property dunHarmWarlock  Auto  

;Spiders in Cage
objectReference Property SpiderCage01  Auto  
objectReference Property SpiderCage02  Auto  
objectReference Property SpiderCage03  Auto  

actor Spider01
actor Spider02
actor Spider03
actor Warlock

;Factions
faction Property SpidersDocile  Auto  
faction Property SpidersMad Auto
faction Property Warlockfaction01 Auto
faction Property WarlockFaction02 Auto

;the Quest
quest Property myQuest Auto
int Property stage auto

;Trigger to disable
;objectReference Property SceneTrigger Auto

;internal Variables
Event onLoad() 
endEvent

Event onActivate(objectReference TriggerRef)
	;Notification("ACTIVATED")
	
	;disable Trigger so ForceGreet never happens
	;Scenetrigger.Disable()
	
	;set up Spiders and Warlock as Actors
	Spider01 = SpiderCage01 as Actor
	Spider02 = SpiderCage02 as Actor
	Spider03 = SpiderCage03 as Actor
	Warlock = dunHarmWarlock as Actor
	
	;Remove from nice Faction
	Spider01.removeFromFaction(SpidersDocile)
	Spider02.removeFromFaction(SpidersDocile)
	Spider03.removeFromFaction(SpidersDocile)
	
	;Remove Warlock from Warlock faction, meaning he is no longer a friend of the spiders and they should attack each other
	Warlock.removeFromFaction(WarlockFaction01)
	Warlock.addToFaction(WarlockFaction02)
	
	;Put into angry faction which should now attack the player
	Spider01.addToFaction(SpidersMad)
	Spider02.addToFaction(SpidersMad)
	Spider03.addToFaction(SpidersMad)
	
	;move quest to end
	myQuest.setstage(stage)
endEvent

