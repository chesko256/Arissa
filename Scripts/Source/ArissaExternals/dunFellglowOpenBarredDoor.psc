scriptName dunFellglowOpenBarredDoor extends ObjectReference

ReferenceAlias property OrthornRef Auto
ObjectReference property bar Auto
ObjectReference property exitDoor Auto

Event OnTrigger(ObjectReference obj)
; 	Debug.Trace("Triggered. " + obj + " " + exitDoor.GetOpenState())
	if (OrthornRef.GetActorRef() == obj && exitDoor.GetOpenState() == 3)
		(bar as doorBar).SetBarPosition(True)
		exitDoor.SetOpen(True)
	EndIf
EndEvent