Scriptname MG03BookScript extends ReferenceAlias  

Quest Property MG03  Auto  


Event OnContainerChanged(ObjectReference NewContainer, ObjectReference OldContainer)

;If player picks up the book...

	MG03QuestScript MG03Script = MG03 as MG03QuestScript

	if NewContainer == Game.GetPlayer()

;...and he's been granted permission, update vars and/or quest stage
		
		if MG03Script.MG03CallerPermission >= 10

			;do nothing
		
		else

;...or if he hasn't, swap faction on Caller and have her start combat

			MG03Caller.GetActorReference().SetFactionRank(MG03CallerHostileFaction, 1)
			MG03Caller.GetActorReference().EvaluatePackage()
			MG03Caller.GetActorReference().StartCombat(Game.GetPlayer())

		endif

; and finally call the function to update the objective and/or stage

		MG03Script.VCount()


	endif

EndEvent
ReferenceAlias Property MG03Caller  Auto  

Faction Property MG03CallerHostileFaction  Auto  
