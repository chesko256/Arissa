Scriptname MQ106InnRoomTriggerScript extends Trigger  
{
This script keeps track of the player entering and leaving trigger.
}


import debug
import utility

Quest Property MQ106 auto

function fireTriggerEvent()
	if IsTargetInTrigger()
		(MQ106 as MQ106Script).playerInRoom = true
		MQ106.SetStage(20)
	else
		(MQ106 as MQ106Script).playerInRoom = false
	endif
	Alias_Delphine.GetActorRef().EvaluatePackage()
endFunction

ReferenceAlias Property Alias_Delphine  Auto  
{Delphine, to EVP her when the player leaves the trigger}
