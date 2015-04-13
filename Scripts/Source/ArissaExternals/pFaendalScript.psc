Scriptname pFaendalScript extends ReferenceAlias Conditional 

Event OnUpdate()

;This controls Faendal having an argument with Raevild
	if GetOwningQuest().GetStageDone(20) == 0
		if Game.GetPlayer().GetDistance(Self.GetRef()) <= 800
			GetOwningQuest().SetStage(20)
		endif
	endif

EndEvent



