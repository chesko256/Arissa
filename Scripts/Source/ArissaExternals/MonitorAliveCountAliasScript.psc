Scriptname MonitorAliveCountAliasScript extends ReferenceAlias  
{Used in conjunction with MonitorAliveCountcript to set a stage when the LocRefType alive count hits a threshold (usually 0) for a location, checked every time an alias with this script dies.}

;jduvall -- this is used for DA02. Please don't change it without talking to me. It's fairly generic. Feel free to use it. If you do, add name of quest to the list below so if I make changes I'll consult you.
;It may be of limited use because it's so dependent on everthing you want to count having a specific location ref types.

;Quests using this script system:
;DA02

Event OnLoad()
	LocationRefType LocationRefTypeToCheck = (GetOwningQuest() as MonitorAliveCountScript).LocationRefTypeToMonitor

	ObjectReference selfRef = GetReference()
	
	if selfRef.HasRefType(LocationRefTypeToCheck) == False
; 		debug.trace(self + " WARNING: OnLoad(), my reference[" + selfRef + "] DOES NOT have the expected LocationRefType: " + LocationRefTypeToCheck, 2)

	Else
; 		debug.trace(self + " OnLoad(), my reference[" + selfRef + "] has the correct LocationRefType: " + LocationRefTypeToCheck)

	EndIf
	
EndEvent


Event OnDeath(Actor akKiller)
; 	debug.trace(self + "OnDeath() will call CheckAliveCount() on owning quest")

	(GetOwningQuest() as MonitorAliveCountScript).CheckAliveCount()

EndEvent

