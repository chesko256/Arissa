Scriptname T03MauriceScript extends ReferenceAlias  

bool sawPlayerTakeSap = false
ReferenceAlias Property Eldergleam auto

Event OnUpdate()
	if ((GetOwningQuest() as T03QuestScript).playerTookSap && !sawPlayerTakeSap)
		Eldergleam.GetReference().Enable()
		GetActorReference().StartCombat(Game.GetPlayer())
		sawPlayerTakeSap = true
	endif
EndEvent
