Scriptname CWResolution02SoldierFriendlyScript extends ReferenceAlias  

Event OnLoad()
	RegisterForUpdate(10)
EndEvent

Event OnUpdate()
	If GetOwningQuest().GetStage() < 20 ; can be set elsewhere like another soldier's script
		If GetReference().GetDistance(Game.GetPlayer()) < 300
			GetOwningQuest().setStage(20)
			UnRegisterForUpdate() 
		EndIf
	
	Else
	
		UnRegisterForUpdate() 
		
	EndIf

EndEvent


Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if (GetOwningQuest() as CWResolution02Script).playerFoundArmy == 0
			GetOwningQuest().SetStage(20)
		EndIf
	EndIf
	
EndEvent
