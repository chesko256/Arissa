Scriptname MQ101KeepDoorScript extends ReferenceAlias  
{prevents the player from exiting the keep after entering}

event OnActivate(objectReference triggerREF)
	if triggerRef == game.getPlayer() && GetOwningQuest().GetStageDone(250)
		(GetOwningQuest() as MQ101QuestScript).KeepDoorMessage.Show()
	endif
endEvent

