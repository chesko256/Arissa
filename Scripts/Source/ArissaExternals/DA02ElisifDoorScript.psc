Scriptname DA02ElisifDoorScript extends ReferenceAlias  

Scene Property DA02DoorScene Auto

bool Locked

Event OnLoad()
	if GetOwningQuest().GetStage() >= 50
		GetReference().SetOpen(false)
	
	EndIf

EndEvent


Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && locked == True
		DA02DoorScene.start()
	EndIf

EndEvent

function LockDoor()	;called in quest stage 50
	GetReference().SetOpen(false)
	GetReference().BlockActivation(True)
	Locked = True
	
EndFunction

function UnlockDoor()	;called in quest stage 81
	GetReference().BlockActivation(False)
	Locked = false
	
EndFunction
