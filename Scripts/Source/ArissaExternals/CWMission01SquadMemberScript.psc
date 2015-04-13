Scriptname CWMission01SquadMemberScript extends ReferenceAlias  

Event OnLoad()
	RegisterForUpdate(2)
EndEvent

Event OnUpdate()
	If GetOwningQuest().GetStage() < 11 ; can be set elsewhere like another soldier's script
		If GetReference().GetDistance(Game.GetPlayer()) < 300
			GetOwningQuest().setStage(11)
			UnRegisterForUpdate() 
		EndIf
	
	Else
	
		UnRegisterForUpdate() 
		
	EndIf

EndEvent


Event OnActivate(ObjectReference akActionRef)
	if (GetOwningQuest() as CWMission01Script).foundRendezvous == 0
		GetOwningQuest().setStage(11)
	endif

EndEvent
