ScriptName dunDeadMensRespiteSealedDoor extends ReferenceAlias  
{Handles VFX for the sealed door.}

ReferenceAlias property Bard Auto
EffectShader property DoorVFX Auto
Sound property RumbleSFX Auto
Quest property dunDeadMensRespiteQST Auto
Message property sealedMSG Auto
bool isSealed

Function SetupSealedDoor()
	if (Self.GetOwningQuest().GetStage() < 95)
		Self.GetReference().BlockActivation(True)
		isSealed = True
		Utility.Wait(0.5)
		DoorVFX.Play(Self.GetReference())
	EndIf
EndFunction

Function UnsealDoor()
	Self.GetReference().BlockActivation(False)
	isSealed = False
	Game.GetPlayer().RampRumble(0.15, 1, 1600)
	RumbleSFX.Play(Game.GetPlayer())
	DoorVFX.Stop(Self.GetReference())
	Self.GetReference().SetOpen(True)
	dunDeadMensRespiteQST.SetStage(95)
EndFunction

Event OnActivate(ObjectReference obj)
	if (isSealed)
		sealedMSG.Show()
	EndIf
EndEvent