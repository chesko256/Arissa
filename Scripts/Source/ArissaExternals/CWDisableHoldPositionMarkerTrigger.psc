Scriptname CWDisableHoldPositionMarkerTrigger extends ObjectReference  
{Defending soldiers have hold position combat interupts that are conditioned on corresponding "Defender Markers" being enabled. This trigger box script makes it so that if an attacker gets behind them, or enters a sensitive area, they stop holding position so they can puruse.}

;REMINDER: Make sure you ENABLE these markers in the start of the CWAttackCity quest

CWScript property CWs Auto
{BASEOBJECT - pointer to CWScipt on CW quest}

ObjectReference Property HoldPosMarker1 Auto
{REFERENCE - pointer to Hold Position Marker to disable when an attacker enters this trigger box.}
ObjectReference Property HoldPosMarker2 Auto
{REFERENCE - optional pointer to another Hold Position Marker to disable when an attacker enters this trigger box.}
ObjectReference Property HoldPosMarker3 Auto
{REFERENCE - optional pointer to another Hold Position Marker to disable when an attacker enters this trigger box.}
ObjectReference Property HoldPosMarker4 Auto
{REFERENCE - optional pointer to another Hold Position Marker to disable when an attacker enters this trigger box.}
ObjectReference Property HoldPosMarker5 Auto
{REFERENCE - optional pointer to another Hold Position Marker to disable when an attacker enters this trigger box.}


ObjectReference LinkedRef

Event OnLoad()
	if HoldPosMarker1 == None
; 		CWScript.Log("CWDisableHoldPositionMarkerTrigger", self + " WARNING: OnLoad() HoldPosMarker1 == NONE, there should be at least one marker that this trigger box is controlling.", 2, true, true)
	
	EndIf


EndEvent


Event OnTriggerEnter(ObjectReference akActionRef)
	actor actorRef = akActionRef as Actor
	
; 	CWScript.Log("CWDisableHoldPositionMarkerTrigger", self + "OnTriggerEnter([" + akActionRef + "])")
	
	if CWs.IsActorAttacker(actorRef, GetEditorLocation())
		DisableIfSet(HoldPosMarker1, actorRef)
		DisableIfSet(HoldPosMarker2, actorRef)
		DisableIfSet(HoldPosMarker3, actorRef)
		DisableIfSet(HoldPosMarker4, actorRef)
		DisableIfSet(HoldPosMarker5, actorRef)
	endif


EndEvent

Function DisableIfSet(ObjectReference ObjectToDisable, actor triggeringActor)
	if ObjectToDisable
; 		CWScript.Log("CWDisableHoldPositionMarkerTrigger", self + "OnTriggerEnter()->DisableIfSet() is disabling " + ObjectToDisable + " because akActionRef [" + triggeringActor + "] is attacker.")
		ObjectToDisable.disable()

	EndIf

EndFunction
