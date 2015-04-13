Scriptname DA04SeptimusScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	DA04QuestScript da04 = GetOwningQuest() as DA04QuestScript
	if     (da04.SeptimusVanished)
		; do nothing, handled in scene
	elseif ( !da04.BoxOpened)
		; fail the quest
; 		Debug.Trace("DA04: Failing quest in Septimus script.")
		da04.SetStage(105)
	else
		; player killed septimus between opening the box and him disappearing, just move along
		da04.SetStage(55)
	endif
EndEvent
