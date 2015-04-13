Scriptname MQ201PartyDoorBlockActivationScript extends ReferenceAlias  

Event OnLoad()
	If GetOwningQuest().GetStageDone(140) && !GetOwningQuest().GetStageDone(230)
		GetRef().BlockActivation(true)
	else
		GetRef().BlockActivation(false)
	endif
EndEvent

