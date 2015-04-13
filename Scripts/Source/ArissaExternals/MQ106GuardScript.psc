Scriptname MQ106GuardScript extends ReferenceAlias  
{kill me on load}

Event OnLoad()
	if GetOwningQuest().GetStage() >= 50 && GetOwningQuest().GetStage() < 200
		GetActorRef().kill()
	endif
endEvent
