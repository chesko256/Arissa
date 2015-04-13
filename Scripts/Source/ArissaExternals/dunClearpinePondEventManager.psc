scriptName dunClearpinePondEventManager extends ObjectReference
{Activates a level-appropriate number of spriggans when triggered.}

ObjectReference property Spriggan01 Auto
ObjectReference property Spriggan02 Auto
ObjectReference property Spriggan03 Auto

Event OnReset()
	Spriggan01.Enable()
	Spriggan02.Enable()
	Spriggan03.Enable()
EndEvent

Event OnLoad()
; 	;Debug.Trace("Clearpine Pond Event Manager")
; 	;Debug.Trace((Spriggan01 as Actor).IsDead() + " " + (Spriggan02 as Actor).IsDead() + " " +(Spriggan03 as Actor).IsDead())
	if (Game.GetPlayer().GetLevel() < 24)
		(Spriggan03 as Actor).Kill()
		Spriggan03.Disable()
	EndIf
	If (Game.GetPlayer().GetLevel() < 12)
		(Spriggan02 as Actor).Kill()
		Spriggan02.Disable()
	EndIf
; 	;Debug.Trace((Spriggan01 as Actor).IsDead() + " " + (Spriggan02 as Actor).IsDead() + " " +(Spriggan03 as Actor).IsDead())
EndEvent

Event OnActivate(ObjectReference obj)
	Spriggan01.Activate(obj)
	Spriggan02.Activate(obj)
	Spriggan03.Activate(obj)
EndEvent
