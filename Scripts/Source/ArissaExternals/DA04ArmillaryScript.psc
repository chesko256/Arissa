Scriptname DA04ArmillaryScript extends ObjectReference  

ObjectReference Property ForwardLever auto
ObjectReference Property ReverseLever auto

ObjectReference Property Lens auto
ReferenceAlias Property LexiconStand auto

int maxPos = 6
int minPos = 1

int Property currentPos = -1 auto

bool __initted = false

Event OnLoad()
	if (!__initted)
		__initted = true
		PlayAnimationandWait("Engage", "Trans00")
		currentPos = 1
		GoToState("ready")
	endif
EndEvent

State ready
	Event OnActivate(ObjectReference TriggerRef)
		int nextPos = currentPos
		if     (TriggerRef == ForwardLever)
			nextPos += 1
		elseif (TriggerRef == ReverseLever)
			nextPos -= 1
		endif
		if (nextPos == 5)
; 			Debug.Trace("DA04: Opening lexicon stand.")
			(LexiconStand as DA04LexiconStand).OpenUp()
		else
; 			Debug.Trace("DA04: Closing lexicon stand.")
			(LexiconStand as DA04LexiconStand).CloseDown()
		endif

		if     (TriggerRef == ForwardLever)
			RotateForward()
		elseif (TriggerRef == ReverseLever)
			RotateReverse()
		endif
	EndEvent
EndState

State busy
EndState

Function RotateForward()
	GotoState("busy")
	if (currentPos < maxPos)
		int nextPos = currentPos + 1
		PlayAnimationandWait("Pos0" + nextPos, "Trans0" + nextPos)
		currentPos = nextPos
	endif
	GoToState("ready")
EndFunction

Function RotateReverse()
	GotoState("busy")
	if (currentPos > minPos)
		int nextPos = currentPos - 1
		PlayAnimationandWait("Rev0" + nextPos, "TransRev0" + nextPos)
		currentPos = nextPos
	endif
	GoToState("ready")
EndFunction
