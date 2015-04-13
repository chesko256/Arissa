ScriptName CidhnaMineDoorBScript extends ReferenceAlias

Quest Property CidhnaMineJailEventScene Auto

Event OnLoad()

	;Lock the door 
; 	debug.Trace(self + "Closing doors to Cidhna Mine")
	If Self.GetRef().IsLocked() == False
; 		debug.Trace(self + "Closing inside door")
		Self.GetRef().Lock()
	EndIf
	
	;If I have already been through the intro scene, open the inside door
	If CidhnaMineJailEventScene.GetStageDone(25) == 1
		If Self.GetRef().IsLocked() == True
; 			debug.Trace(self + "Opening inside door")
			Self.GetRef().SetOpen()
		EndIf
	EndIf
	
EndEvent