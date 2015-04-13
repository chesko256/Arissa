ScriptName defaultSealedDoor extends ObjectReference  
{Script for 'sealing' a door with a visual effect until the seal is removed by script.}

EffectShader property DoorVFX Auto

Event OnLoad()
	Self.BlockActivation(True)
; 	Debug.Trace("Sealed!")
	Utility.Wait(0.5)
	DoorVFX.Play(Self)
EndEvent

Function RemoveSeal()
	Self.BlockActivation(False)
	DoorVFX.Stop(Self)
EndFunction