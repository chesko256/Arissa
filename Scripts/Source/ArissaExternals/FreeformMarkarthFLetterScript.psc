ScriptName FreeformMarkarthFLetterScript extends ReferenceAlias Conditional

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer() && (GetOwningQuest() as FreeformMarkarthFScript).PlayerReadLetter == 0
		(GetOwningQuest() as FreeformMarkarthFScript).PlayerReadLetter = 1
	EndIf
	
EndEvent
	
Event OnEquipped(Actor akActor)

	If akActor == Game.GetPlayer() && (GetOwningQuest() as FreeformMarkarthFScript).PlayerReadLetter == 0
		(GetOwningQuest() as FreeformMarkarthFScript).PlayerReadLetter = 1
	EndIf
	
EndEvent
