scriptname MS13QuestScript extends Quest conditional

;Variable to track where the player is in the scene where Camilla volunteers to escort the player
int property SceneTriggers auto conditional
	;0 - scene hasn't played yet
	;1 - scene is playing, player can't interrupt
	;2 - player can now interrupt the scene

;variables to track Lucan's packages
int property LucanForceGreet auto conditional

;variables to track Camilla's packages
int property CamillaForceGreet auto conditional
int property CamillaEscort auto conditional
	;0 - not escorting the player
	;1 - escorting the player
	;2 - finished the escort

;variable to track when Arvel has shouted at the player
int property ArvelShouted auto conditional

;variable to track Arvel's forcegreet
int property ArvelGreet auto conditional

;variable to track when Arvel stops ignoring combat
int property ArvelCombat auto conditional

MiscObject Property GoldenClaw  Auto  

GlobalVariable Property FavorRewardLarge  Auto  

Quest Property MS13FIN  Auto 

Scene Property MS13ArvelStuck  Auto  

Scene Property CamillaEscortScene Auto

Location Property pRiverwoodLocation Auto

Location Property pRiverwoodRiverwoodTraderLocation Auto

Event OnUpdate()

	If (CamillaEscortScene.IsPlaying() == True) && (Game.GetPlayer().IsInLocation(pRiverwoodLocation) == False)
		CamillaEscortScene.Stop()
		UnregisterForUpdate()
	EndIf

	If (CamillaEscortScene.IsPlaying() == True) && (Game.GetPlayer().IsInInterior()) && (Game.GetPlayer().IsInLocation(pRiverwoodRiverwoodTraderLocation) == False)
		CamillaEscortScene.Stop()
		UnregisterForUpdate()
	EndIf

	;Loop Arvel's scene
	If ((MS13.GetStage() == 20) || (MS13.GetStage() == 30))
		If ((MS13ArvelStuck.IsPlaying() == False) && (Arvel.GetActorReference().IsInDialogueWithPlayer() == False) && (Arvel.GetActorReference().GetDistance(Game.GetPlayer()) > 500))
			MS13ArvelStuck.Start()
		EndIf
	EndIf

EndEvent


Quest Property MS13  Auto  

ReferenceAlias Property Arvel  Auto  

int Property MS13Intro  Auto  
