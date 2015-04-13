Scriptname WITavernScript extends Quest Conditional

LocationAlias Property myLocation Auto

Scene Property WITavernGreeting Auto

Scene Property WITavernPlayerSits Auto

Int Property ServerGreeted Auto Hidden Conditional		;used to control behavior of Server aliases asking the player if he wants anything
int Property PlayerSatDown Auto Hidden Conditional		;used to control behavior of Server aliases asking the player if he wants anything


Function PlayerSatDown()

	if ServerGreeted == 0

		PlayerSatDown = 1
		WITavernPlayerSits.start()
	
	EndIf

EndFunction

Function PlayerChangedLocation()
	if Game.GetPlayer().IsInLocation(myLocation.GetLocation()) == False
; 		debug.trace("WITavernScript player left tavern, stopping quest.")
		
		stop()
	
	EndIf


EndFunction
