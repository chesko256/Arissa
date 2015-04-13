Scriptname CWMission08GiantScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
; 	CWScript.Log("CWMission08GiantScript", self + "OnDeath() setting stage 205")
	GetOwningQuest().setStage(205)

EndEvent

Event OnUnload()
; 	CWScript.Log("CWMission08GiantScript", self + "OnUnload()")
	if GetOwningQuest().GetStage() >= 200
; 		CWScript.Log("CWMission08GiantScript", self + "quest stage >= 200, stopping quest.")
		GetOwningQuest().Stop()
	
	EndIf

EndEvent


