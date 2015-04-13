Scriptname CWMission08CowOfferingScript extends ReferenceAlias  

message property CWMission08FeedCowMsg auto
Ingredient Property Apple01  Auto  

int DistanceFromCow = 2000				;how close does the player need to be to make the giant non-hostile (until he recieves the cow)
int StopCheckingDistanceAtStage	= 20	;what quest stage to stop checking distance to cow (ie the player gave the cow to the giant)

Event OnDeath(Actor akKiller)
	if GetOwningQuest().GetStageDone(20) == False	;player hasn't delivered it yet
		GetOwningQuest().setStage(205) ;fail quest
	
	
	EndIf

EndEvent

Event OnUpdate()
	if GetOwningQuest().getStage() < StopCheckingDistanceAtStage

		if  GetReference().GetDistance(Game.GetPlayer()) <= DistanceFromCow
; 			CWScript.Log("CWMission08CowOfferingScript", "Player close to cow, adding player to CWMission08AllGiantsPlayerFriendFaction")
			Game.GetPlayer().AddToFaction((GetOwningQuest() as CWMission08Script).CWMission08AllGiantsPlayerFriendFaction)
			
		Else
; 			CWScript.Log("CWMission08CowOfferingScript", "Player far from cow, removing player to CWMission08AllGiantsPlayerFriendFaction")
			Game.GetPlayer().RemoveFromFaction((GetOwningQuest() as CWMission08Script).CWMission08AllGiantsPlayerFriendFaction)
					
		EndIf
	
	Else
		UnRegisterForUpdate()
	
	EndIf
		
EndEvent


Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer() && GetOwningQuest().GetStage() < 15
		if CWMission08FeedCowMsg.show() == 1
			;Note: I'm assuming the player has an apple because I give him one in the quest and I don't really care if he doesn't have one... it's not that important.
			Game.GetPlayer().removeItem(Apple01, 1)
			GetOwningQuest().setStage(15)
			RegisterForUpdate(3)
			
		endif

	endif

EndEvent

