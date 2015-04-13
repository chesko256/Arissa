Scriptname MQ203EsbernScript extends ReferenceAlias  

; detect when Esbern enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	debug.trace(self + ": OnLocationChange - akoldloc=" + akoldloc + ", aknewloc=" + aknewloc)
	MQ203QuestScript myQuest = GetOwningQuest() as MQ203QuestScript 

	if myQuest.GetStageDone(20) == 0 && akNewLoc == myQuest.Riverwood
		myQuest.SetStage(20)
	endif

	; update quest when Esbern arrives at inn
	if myQuest.GetStageDone(30) == 0 && akNewLoc == myQuest.InnLocation
		myQuest.SetStage(30)
	endif

	; update quest when Esbern arrives at Karthspire
	if myQuest.GetStageDone(60) == 1 && myQuest.GetStageDone(80) == 0 && akNewLoc == myQuest.KarthspireLocation
		myQuest.SetStage(80)
	endif

endEvent



; make sure Esbern stays registered for book animation event

; watch for Esbern's book event
Event OnLoad()
	Quest MQ203 = GetOwningQuest()
	if MQ203.GetStage() >= 40 && MQ203.GetStage() < 48
; 		debug.trace(self + " OnLoad - reregister for AnimObjectUnequip event")
		MQ203.RegisterForAnimationEvent(GetRef(), "AnimObjectUnequip")
	endif
endEvent
