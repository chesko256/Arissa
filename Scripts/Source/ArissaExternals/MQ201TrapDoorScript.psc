Scriptname MQ201TrapDoorScript extends ReferenceAlias  
{lock onLoad prior to getting the key - failsafe}

event OnLoad()
	if GetOwningQuest().GetStageDone(stageToCheck) == false
		GetRef().Lock(true)
	endif
endEvent

Int Property stageToCheck = 225 Auto  
