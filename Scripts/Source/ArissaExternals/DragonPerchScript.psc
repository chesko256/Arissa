Scriptname DragonPerchScript extends ObjectReference  
{Script attached to all dragon perches. ASSUMES THE ONLY THING ABLE TO ACTIVATE THE PERCH IS A DRAGON!}

WIFunctionsScript Property WI Auto		;added by jduvall
{Pointer to WIFunctionsScript on WI quest.}

;Primary use at the moment, is to register a dragon attack on towns, should a dragon perch somewhere in a town -jduvall

Event OnActivate(ObjectReference akActionRef)

	;*** !!! ASSUMES THE ONLY THING ABLE TO ACTIVATE THE PERCH IS A DRAGON !!!! ***
	
; 	debug.trace(self + "OnActivate(" + akActionRef + ") calling WI.RegisterDragonAttack()")

	;SEE ALSO: DragonActorScript
	WI.RegisterDragonAttack(GetEditorLocation(), akActionRef as Actor)
	
	
EndEvent
