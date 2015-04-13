Scriptname V02DomnaDeathScript extends ReferenceAlias  
{Looks for two different stages and sets the stage appropriately based on those.}
import game
import debug



int property SetPlayerHasInfo auto
{ stage to set}

int property SetPlayerNoInfo auto
{ stage to set}

int property PlayerHasInfoStage auto

int testState	; for debugging

Event OnDeath(Actor akKiller)
	;;Player has no info
	if GetOwningQuest().GetCurrentStageID() == 150
		GetOwningQuest().setStage(SetPlayerNoInfo)
	ElseIf GetOwningQuest().GetCurrentStageID() == PlayerHasInfoStage
		GetOwningQuest().setStage(SetPlayerHasInfo)
	endif
endEvent


