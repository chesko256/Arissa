Scriptname CWMission04FriendScript extends ReferenceAlias  

int DistanceFromPlayerBeforeWalking = 7000

Event OnLoad()
	if GetOwningQuest().GetStage() < 11
		RegisterForSingleUpdate(1)
	endif
EndEvent


Event OnUpdate()

	bool continueUpdate = GetReference().Is3DLoaded()

	if Game.GetPlayer().GetDistance(GetReference()) <= DistanceFromPlayerBeforeWalking
		continueUpdate = False
		GetOwningQuest().setStage(11)
		GetActorReference().EvaluatePackage()
	
	EndIf
	
	if continueUpdate
		RegisterForSingleUpdate(1)
	
	EndIf
	
EndEvent



