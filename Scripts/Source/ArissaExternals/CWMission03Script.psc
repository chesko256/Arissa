Scriptname CWMission03Script extends CWMissionScript  Conditional
{Extends CWMissionScript which extends Quest}

int Property Bribed Auto	Conditional	;see dialogue with Innkeeper


;Registered in stage 10
Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
	setStage(20)

EndEvent
