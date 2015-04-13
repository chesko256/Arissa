Scriptname dunAngarvundeQSTDraugrADies extends ReferenceAlias Conditional
import Debug

dunAngarvundeQSTScript  dunAng

GlobalVariable Property dunAngarvundeDraugrKilledCount Auto


Event OnDeath(Actor akKiller)
	;messageBox("Draugr Dies")
	if (getOwningQuest().isStageDone(100) == 0)
		getOwningQuest().ModObjectiveGlobal( 1, dunAngarvundeDraugrKilledCount, 10, 3, true, true )
		;notification(dunAngarvundeDraugrKilledCount)
		if (dunAngarvundeDraugrKilledCount.value >= 3)
			getOwningQuest().setstage(20)
		endif
	;dunAng= GetOwningQuest() as dunAngarvundeQSTScript  
	;dunAng.upDeathToll()
	endif
EndEvent


