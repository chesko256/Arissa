ScriptName CidhnaMineDoorAScript extends ReferenceAlias

Event OnLoad()

	;Lock the door 
; 	debug.Trace(self + "Closing doors to Cidhna Mine")
	If Self.GetRef().IsLocked() == False
; 		debug.Trace(self + "Closing outisde door")
		Self.GetRef().Lock()
	EndIf
	
EndEvent