Scriptname MQ203PlayerScript  extends ReferenceAlias  

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; ;	debug.trace(self + ": OnLocationChange - akoldloc=" + akoldloc + ", aknewloc=" + aknewloc)
	MQ203QuestScript myQuest = GetOwningQuest() as MQ203QuestScript 

	; set quest stage when player enters Karthspire
	if myQuest.GetStageDone(60) == 1 && myQuest.GetStageDone(100) == 0
		if akNewLoc == myQuest.KarthspireLocation
			myQuest.setStage(100)
		endif
	endif	

	; set quest stage when player leaves inn (causes Delphine and Esbern to travel on their own)
	if myQuest.GetStageDone(60) == 1 && myQuest.GetStageDone(70) == 0
		if akNewLoc != myQuest.InnLocation
			myQuest.setStage(70)
		endif
	endif	

	; set quest stage when player leaves inn (kills running scene so they pick up follow packages)
	if myQuest.GetStageDone(60) == 1 && myQuest.GetStageDone(65) == 0
		if akNewLoc != myQuest.InnLocation
			myQuest.setStage(65)
		endif
	endif	

	; Delphine and Esbern travel on their own when player enters dungeon
	if myQuest.GetStage() == 70
		if akNewLoc.HasKeyword(LocTypeDungeon)
			myQuest.setStage(75)
			Alias_Delphine.GetActorRef().Say(MQ203MeetAtKarthspireTopic)
		endif
	endif	


	; set quest stage when player enters Sky Haven Temple
	if myQuest.GetStageDone(200) == 1 && myQuest.GetStageDone(210) == 0
		if akNewLoc == myQuest.SkyHavenTemple
			myQuest.setStage(210)
		endif
	endif	
endEvent



Keyword Property LocTypeDungeon  Auto  

Topic Property MQ203MeetAtKarthspireTopic  Auto  

ReferenceAlias Property Alias_Delphine  Auto  
