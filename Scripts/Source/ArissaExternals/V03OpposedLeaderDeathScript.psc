Scriptname V03OpposedLeaderDeathScript extends ReferenceAlias  


int property SetPlayerIsQuarra auto
{ stage to set}

int property SetPlayerIsCronvangr auto
{ stage to set}

ReferenceAlias Property AlliedLeaderAlias auto

ObjectReference Property VlkoslakRef auto

int testState	; for debugging

Event OnDeath(Actor akKiller)
	;;Player has no info
	If AlliedLeaderAlias.GetRef() != VlkoslakRef
		GetOwningQuest().setStage(SetPlayerIsQuarra)
	ElseIf AlliedLeaderAlias.GetRef() == VlkoslakRef
		GetOwningQuest().setStage(SetPlayerIsCronvangr)
	endif
endEvent