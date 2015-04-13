Scriptname DA02PillarTriggerScript extends ObjectReference  

DA02Script Property DA02 Auto

ObjectReference Property DA02PillarRef Auto
ObjectReference Property ShrineOfBoethiahRef Auto
ObjectReference Property BoethiahBluePulseLightRef auto	

int countIn

int AnimState
;0 off
;1 on

bool AnimBusy

string PowUp = "PowUp"
string PowDown = "PowDown"

Event OnCellAttach()
	RegisterForAnimationEvent(ShrineOfBoethiahRef, powup)
	RegisterForAnimationEvent(ShrineOfBoethiahRef, powdown)

EndEvent

Event OnCellDetach()
	UnregisterForAnimationEvent(ShrineOfBoethiahRef, powup)
	UnregisterForAnimationEvent(ShrineOfBoethiahRef, powdown)

EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef as Actor
		CheckCountPlayEffect(1)
	
	EndIf

EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef as Actor
		CheckCountPlayEffect(-1)
	
	EndIf

EndEvent	

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == PowUp || asEventName == PowDown
; 		debug.trace("DA02PillarTriggerScript OnAnimationEvent(" + akSource +", " + asEventName)
	
		CheckCountPlayEffect(0)
	EndIf
	
EndEvent

function CheckCountPlayEffect(int val)
	countIn += val
	
; 	debug.trace("DA02PillarTriggerScript Count() countIn = " + countIn + ", AnimState:" + AnimState)
	
	
	
	if countIn >= 1 && AnimState != 1
		TurnOn()
		
	Elseif countIn <= 0 && AnimState != 0
		TurnOff()
		
	EndIf


	 
EndFunction

Function TurnOn()
; 	debug.trace("DA02PillarTriggerScript TurnOn()")
	
	(DA02PillarRef as DefaultSoundControlScript).playSoundByName("ShrineActivate")
	
	BoethiahBluePulseLightRef.enable()
	DA02PillarRef.playAnimation("playanim01")
	ShrineOfBoethiahRef.playAnimationAndWait("playanim01", PowUp)	;swirl
	AnimState = 1
	
EndFunction

Function TurnOff()
; 	debug.trace("DA02PillarTriggerScript TurnOff()")
	
	(DA02PillarRef as DefaultSoundControlScript).stopSoundByName("ShrineActivate")
	
	BoethiahBluePulseLightRef.disable()
	DA02PillarRef.playAnimation("reset")
	ShrineOfBoethiahRef.playAnimationAndWait("reset", PowDown)
	AnimState = 0
	
EndFunction
