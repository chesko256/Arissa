Scriptname MS12bBHWScript extends ReferenceAlias  

Ingredient Property HeartObj auto

Event OnDeath(Actor akKiller)
; 	Debug.Trace("MS12b: Boss forsworn dying.")
	if (GetOwningQuest().GetStage() >= 30)
		int hearts = GetReference().GetItemCount(HeartObj)
		if (hearts == 0)
			GetReference().AddItem(HeartObj, 1)
		endif
	endif
EndEvent
