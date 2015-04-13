ScriptName PlayerSleepQuestScript extends Quest

Spell Property Rested Auto
Spell Property WellRested Auto
Spell Property MarriageSleepAbility Auto
ReferenceAlias Property LoveInterest Auto
Keyword Property LocTypeInn Auto
Keyword Property LocTypePlayerHouse Auto
Quest Property RelationshipMarriageFIN Auto
Spell Property pDoomLoverAbility Auto
CompanionsHousekeepingScript Property CHScript Auto


Function RemoveRested()

	;remove all previous rested states
	Game.GetPlayer().RemoveSpell(Rested)
	Game.GetPlayer().RemoveSpell(WellRested)
	Game.GetPlayer().RemoveSpell(MarriageSleepAbility)

EndFunction

Event OnSleepStop(bool abInterrupted)

; 	debug.trace(self + "Player is sleeping")
	If CHScript.PlayerHasBeastBlood == 1
; 		Debug.Trace(Self + "Player is werewolf; no restedness on sleep.")
		RemoveRested()
		BeastBloodMessage.Show()
	ElseIf Game.GetPlayer().HasSpell(pDoomLoverAbility) == 0
		;don't run this if player has the Lover sign

		If RelationshipMarriageFIN.IsRunning() == True && RelationshipMarriageFIN.GetStage() >= 10 && Game.GetPlayer().GetCurrentLocation() == LoveInterest.GetActorRef().GetCurrentLocation()
; 			debug.trace(Self + "Giving player the Lover's Comfort spell on Sleep End")
			MarriageRestedMessage.Show()
			RemoveRested()
			Game.GetPlayer().AddSpell(MarriageSleepAbility, abVerbose = false)
		ElseIf Game.GetPlayer().GetCurrentLocation().HasKeyword(LocTypeInn) == True
; 			debug.trace(Self + "Giving player the Well Rested spell for sleeping in an Inn")	
			WellRestedMessage.Show()
			RemoveRested()
			Game.GetPlayer().AddSpell(WellRested, abVerbose = false)
		ElseIf Game.GetPlayer().GetCurrentLocation().HasKeyword(LocTypePlayerHouse) == True
; 			debug.trace(Self + "Giving player the Well Rested spell for sleeping in Player House")	
			Game.GetPlayer().AddSpell(WellRested, abVerbose = false)
		Else
; 			debug.trace(Self + "Giving player the Rested spell for sleeping")	
			RestedMessage.Show()
			RemoveRested()
			Game.GetPlayer().AddSpell(Rested, abVerbose = false)
		EndIf

	EndIf
	
EndEvent

Message Property RestedMessage  Auto  

Message Property WellRestedMessage  Auto  

Message Property MarriageRestedMessage  Auto  

Message Property BeastBloodMessage  Auto
