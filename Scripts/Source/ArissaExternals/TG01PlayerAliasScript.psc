Scriptname TG01PlayerAliasScript extends ReferenceAlias  Conditional

int Property pTG01Go Auto
Quest Property pTG01Quest Auto
Quest Property pTG00SPQuest Auto
Quest Property pTG00Quest Auto
Location Property pRiftenRatway Auto
ReferenceAlias Property pTG01BrynjolfAlias Auto
ObjectReference Property pTG01BrynjolfStartMarker Auto
ObjectReference Property pTG01StallMarker Auto
Faction Property pCrimeFactionRift Auto
Faction Property pCrimeFactionThievesGuild Auto
Outfit Property pTG01BrynjolfArmor Auto
TG01QuestScript Property pTG01QS  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	if pTG01Go == 0

		if pTG01Quest.IsRunning() == 1
			if pTG00SPQuest.IsRunning()	
				pTG00SPQuest.Stop()
				pTG00Quest.Stop()
			endif
		endif

		if pTG01Quest.GetStage() == 10
			if akNewLoc == pRiftenRatway
				pTG01QS.pTG01BrynMoved = 1
				pTG01BrynjolfAlias.GetActorRef().moveto(pTG01BrynjolfStartMarker)
				pTG01BrynjolfAlias.GetActorRef().SetOutFit(pTG01BrynjolfArmor,false)
				pTG01BrynjolfAlias.GetActorRef().AddToFaction(pCrimeFactionThievesGuild)
				pTG01BrynjolfAlias.GetActorRef().SetCrimeFaction(pCrimeFactionThievesGuild)
				pTG01BrynjolfAlias.GetActorRef().RemoveFromFaction(pCrimeFactionRift)
				pTG01BrynjolfAlias.GetActorRef().EvaluatePackage()
				pTG01StallMarker.Disable()
				pTG01Go = 1
			endif
		endif
	endif

endEvent