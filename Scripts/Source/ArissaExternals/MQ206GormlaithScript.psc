Scriptname MQ206GormlaithScript extends ReferenceAlias  

import game
import debug

auto STATE waitingForAlduin
	Event OnDying(Actor akKiller)
		gotoState("hasBeenHit")
		GetOwningQuest().SetStage(85)
	endEvent
endSTATE

STATE hasBeenHit
	; this state doesn't do anything
endSTATE

ReferenceAlias Property Alias_Alduin  Auto  

