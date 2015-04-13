Scriptname MQ106DelphineScript extends ReferenceAlias  

; detect when Delhpine enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	debug.trace(self + "OnLocationChange akNewLoc=" + akNewLoc)
	
	Actor delphine = GetActorRef()
	; watch for Delphine to enter burial mound location
	if GetOwningQuest().getStageDone(50) == 1 && GetOwningQuest().getStageDone(80) == 0
		if akNewLoc == (GetOwningQuest() as MQ106Script).KynesgroveBurialMoundLocation
			GetOwningQuest().SetStage(80)
		endif
	endif

	if akNewLoc && GetOwningQuest().GetStage() >= 50 && GetOwningQuest().GetStage() < 65 && delphine.IsInDialogueWithPlayer() == 0 && delphine.IsInCombat() == 0
		if delphine.GetDistance(Game.GetPlayer()) < 1000
; 			debug.trace(self + "OnLocationChange: say chatter")
			delphine.Say(ChatterTopic)
		endif
	else
; 		debug.trace(self + "OnLocationChange: don't speak - didn't pass conditions")
	endif

endEvent


Topic Property ChatterTopic  Auto  
