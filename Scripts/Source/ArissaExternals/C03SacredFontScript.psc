Scriptname C03SacredFontScript extends ReferenceAlias  

Message property InductionMessage auto
ReferenceAlias property Aela auto
Quest Property RampageQuest auto


Event OnActivate(ObjectReference akActivator)
	if (20 == GetOwningQuest().GetStage())
		Utility.Wait(1.5)
		RampageQuest.Start()
		; InductionMessage.Show()
		(GetOwningQuest() as C03QuestScript).PoorSkjor()
		(GetOwningQuest() as C03QuestScript).AelaGreetPostTransform = True
		; Aela.GetActorReference().EvaluatePackage()
	endif
EndEvent

Function DoIt()
	
EndFunction
