Scriptname WIGrabNearbyNPCsScript extends Quest  Conditional

;THIS ISN'T REALLY GOING TO WORK... DELETE ME!!!!





;Aliases in "calling" quest that you want to shove aliases found by this quest into.
;MAKE SURESTARTUP STAGE CLEARS THESE
ReferenceAlias Property ExternalAlias1 Auto
ReferenceAlias Property ExternalAlias2 Auto
ReferenceAlias Property ExternalAlias3 Auto
ReferenceAlias Property ExternalAlias4 Auto
ReferenceAlias Property ExternalAlias5 Auto
ReferenceAlias Property ExternalAlias6 Auto
ReferenceAlias Property ExternalAlias7 Auto
ReferenceAlias Property ExternalAlias8 Auto
ReferenceAlias Property ExternalAlias9 Auto
ReferenceAlias Property ExternalAlias10 Auto

;MAKE SURESTARTUP STAGE CLEARS THIS
int property NextAlias auto


function RegisterExternalAlias(ReferenceAlias ExternalAlias)
		ReferenceAlias AliasToFill
	
	if NextAlias == 0
		 ExternalAlias1 = ExternalAlias
	ElseIf NextAlias == 1
		ExternalAlias2 = ExternalAlias
	ElseIf NextAlias == 2
		ExternalAlias3 = ExternalAlias
	ElseIf NextAlias == 3
		ExternalAlias4 = ExternalAlias
	ElseIf NextAlias == 4
		ExternalAlias5 = ExternalAlias
	ElseIf NextAlias == 5
		ExternalAlias6 = ExternalAlias
	ElseIf NextAlias == 6
		ExternalAlias7 = ExternalAlias
	ElseIf NextAlias == 7
		ExternalAlias8 = ExternalAlias
	ElseIf NextAlias == 8
		ExternalAlias9 = ExternalAlias
	ElseIf !NextAlias == 9
		ExternalAlias10 = ExternalAlias
			
	EndIf

		NextAlias += 1

; 		debug.trace("WIGrabNearbyNPCsScript RegisterExternalAlias() Registering: " + ExternalAlias)

EndFunction


