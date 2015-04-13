Scriptname DA04HubScript extends ObjectReference  

Quest Property DA04 auto

ObjectReference Property RotateLever auto
ObjectReference Property OpenLever auto

ObjectReference Property Lens auto
ObjectReference Property Armillary auto

ObjectReference Property ElderScroll auto
ReferenceAlias Property LexiconStand auto

int maxPos = 4
int minPos = 1

int currentPos = -1


Event OnLoad()
	currentPos = 1
	GoToState("ready")
EndEvent

bool Function ReadyToOpen()
	return ( (currentPos == 3) && ((Armillary as DA04ArmillaryScript).currentPos == 5) )
EndFunction

State ready
	Event OnActivate(ObjectReference TriggerRef)
		if     (TriggerRef == RotateLever)
			RotateHub()
			if (ReadyToOpen())
				(OpenLever as DA04ButtonScript).Open()
			else
				(OpenLever as DA04ButtonScript).Close()
			endif
		elseif (TriggerRef == OpenLever)
			if (ReadyToOpen())
				OpenHub()
			endif
		endif
	EndEvent
EndState

State opened
EndState

State busy
EndState

Function RotateHub()
	GoToState("busy")
	int nextPos = currentPos + 1
	if (nextPos > maxPos)
		nextPos = minPos
	endif
	PlayAnimationandWait("Trigger0" + currentPos, "Trans0" + currentPos)
	currentPos = nextPos
	GoToState("ready")
EndFunction

Function OpenHub()
	GoToState("busy")
;	Armillary.PlayAnimationAndWait("Complete", "Done")
; 	Debug.Trace("DA04: Inscribing lexicon stand.")
	(LexiconStand as DA04LexiconStand).Inscribe()
	PlayAnimationAndWait("Complete", "Done")
	Lens.PlayAnimationAndWait("Lower", "Done")
	ElderScroll.Enable()
	(DA04 as DA04QuestScript).AstrolabeOpened = True
	GoToState("opened")
EndFunction
