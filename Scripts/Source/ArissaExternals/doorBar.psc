scriptName doorBar extends objectReference
{script lives on objects that bar a door from one side}

;======================================================================================;
;	PROPERTIES  /
;=============/
bool property startOpen = false auto
{Start open? Default: false}
message property BarredMSG auto
{set the "door is barred from the other side" message here"}
keyword Property BarredDoorNavCutKeyword auto
{keyword for the NavCut collision linked ref}

;Only do the onCellLoad block once per reset.
bool initialized = false

;======================================================================================;
;	VARIABLES   /
;=============/
; store the door I am barring
objectReference myLink
objectReference myNavCutLink
; need to control the script on companion door
barredDoor doorScript

;======================================================================================;
;	EVENTS	     /
;=============/
EVENT onCellLoad()
	myLink = self.getLinkedRef()	
	myNavCutLink = self.getLinkedRef(BarredDoorNavCutKeyword)
	doorScript = myLink as barredDoor
; 	Debug.Trace("Door Bar Load: " + initialized)
	if (!initialized)
		initialized = True
		if startOpen == true
			gotostate("down")
			onActivate(Self)
		else
			myLink.blockActivation(true)	
			gotoState("down")
		endif
	endif
endEVENT

STATE down
	EVENT onActivate(objectReference actronaut)
		doorScript.busy = true
		gotoState("busy")
		myNavCutLink.Disable()
		playAnimationAndWait("up","done")
		doorScript.barred = false
		myLink.blockActivation(false)
		gotoState("up")
		doorScript.busy = false
	endEVENT
	
	EVENT SetBarPosition(bool setBarUp)
; 		;Debug.Trace("Setting Bar Up")
		if (setBarUp)
			onActivate(Self)
		EndIf
	endEVENT
endSTATE

STATE up
EVENT onActivate(objectReference actronaut)
		if myLink.getOpenState() != 3
			; can't drop a bar when the corresponding door is open
		else
			doorScript.busy = true
			gotoState("busy")
			myNavCutLink.Enable()
			playAnimationAndWait("down","done")
			doorScript.barred = true
			myLink.blockActivation(true)	
			gotoState("down")
			doorScript.busy = false
		endif
	endEVENT
		
	EVENT SetBarPosition(bool setBarUp)
		if (!setBarUp)
			if (myLink.getOpenState() == 1)
				myLink.Activate(Self)
				Utility.Wait(0.5)
				SetBarPosition(setBarUp)
			ElseIf (myLink.getOpenState() == 2 || myLink.getOpenState() == 4)
				Utility.Wait(0.5)
				SetBarPosition(setBarUp)
			Else
				onActivate(Self)
			EndIf
		EndIf
	endEVENT
endSTATE

STATE busy
	; allow nothing here.
endSTATE

EVENT SetBarPosition(bool setBarUp)
	;Until we're in either the Up or Down position, don't do anything.
endEVENT
