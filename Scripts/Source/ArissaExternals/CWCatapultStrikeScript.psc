Scriptname CWCatapultStrikeScript extends ObjectReference  

;This script handles the "fallout 3 artillary" style catapult strike for use when the actual projectile firing catapults unload.


Explosion Property ExplosionObject	Auto
{BASEOBJECT: the explosion to use -> CWCatapultExp}

int deleteAfterTime = 10
bool dead = false ; If true, then we are dead and we shouldn't try to register for stuff

Event OnInit()
	Cell parentCell = GetParentCell()
	if !parentCell || !parentCell.IsAttached()
		dead = true
		Delete()
	EndIf
EndEvent

Event OnLoad()
	if !dead
		bool Registered = RegisterForAnimationEvent(self, "end")
; 		debug.trace(self + "OnLoad() successfully registered for event?:" + Registered)	
		
		RegisterForSingleUpdate(deleteAfterTime)
	EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.trace(self + "OnAnimationEvent(:" + asEventName )
	
	if asEventName == "end"
		PlaceAtMe(ExplosionObject)
		UnregisterForAnimationEvent(self, "end")
		deleteMe()
	EndIf
EndEvent

Event OnUpdate()
	deleteMe()
EndEvent

Event OnAnimationEventUnregistered(ObjectReference akSource, string asEventName)
	deleteMe()
EndEvent 

Event deleteMe()
	dead = true
	UnregisterforUpdate()
	UnregisterForAnimationEvent(self, "end")
	Disable()
	Delete()
EndEvent
