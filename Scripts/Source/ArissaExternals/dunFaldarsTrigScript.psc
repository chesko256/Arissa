scriptName dunFaldarsTrigSCRIPT extends TriggerBoxBase
;
;	Trigger Box script used to enable/disable objects linked to this
;
;=============================================================

objectReference property myLever auto
quest property myQuest auto
int property questStage auto

Function fireTriggerEvent ()
	myLever.activate(self)	;TriggerLeverToOpen
; 	debug.Trace("about to start quest faldar")
	myQuest.start() ;Set Quest Stage
; 	debug.Trace("should have started quest faldar")
endFunction
