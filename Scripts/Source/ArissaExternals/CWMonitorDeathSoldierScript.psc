Scriptname CWMonitorDeathSoldierScript extends ReferenceAlias  
{Script attached to soldier aliases in quests where the player has objective to kill all the enemy soldiers in a garrison (ex: CWMission01)}

bool MonitorDeath			;when true I should start monitoring for my death, if false I don't care if I die yet

Event OnDeath(Actor akKiller)
	if MonitorDeath == True
; 		CWScript.Log("CWMonitorDeathSoldierScript", Self + "OnDeath() MonitorDeath = True, calling DecrementCount on my owning quest, and setting my variable MonitorDeath = false")
	
		(GetOwningQuest() as CWMonitorDeathQuestScript).DecrementCount()
		MonitorDeath = False	;this is largely irrelevant, but just incase player resurrects and kills again or something
		
	EndIf

EndEvent

function StartMonitoringForDeath(bool ResetRef = True)

	if ResetRef
; 		CWScript.Log("CWMonitorDeathSoldierScript", Self + "StartMonitoringForDeath() ResetRef == true, calling TryToReset()")
		TryToReset()
	EndIf

	if GetReference() ;If I'm not an empty alias	
; 		CWScript.Log("CWMonitorDeathSoldierScript", Self + "StartMonitoringForDeath() calling IncrementCount() on my owning quest, and setting my variable MonitorDeath = true")
		(GetOwningQuest() as CWMonitorDeathQuestScript).IncrementCount()
		MonitorDeath = True
	
	EndIf

EndFunction
