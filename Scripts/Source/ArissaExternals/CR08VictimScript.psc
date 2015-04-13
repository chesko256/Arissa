Scriptname CR08VictimScript extends ReferenceAlias  

ReferenceAlias Property ProtectedVictim auto

Event OnDeath(Actor akKiller)
	; if I'm currently in the protected alias, the player knows about
	;  the quest, so let the protected alias script do the failing like
	;  it's set up to do. otherwise, just quietly shut this quest down.
; 	Debug.Trace("CRQ CR08: Victim dying.")
	if (GetReference() != ProtectedVictim.GetReference())
; 		Debug.Trace("CRQ CR08: Before the player has accepted the quest.")
		(GetOwningQuest() as CompanionsRadiantQuest).RewardAmount = 0
		(GetOwningQuest() as CompanionsRadiantQuest).Finished(false)
		GetOwningQuest().SetStage(200)
	endif
EndEvent
