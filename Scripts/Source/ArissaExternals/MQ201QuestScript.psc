Scriptname MQ201QuestScript extends Quest  Conditional

import utility
import debug

; starts the specified scene, stops other scenes
function StartDistractionScene (Scene pNewScene)
; 	debug.trace(self + " StartDistractionScene " + pNewScene)
	; stop all other party scenes
	PartyDistractionDrunkScene.Stop()
	PartyDistractionFriendScene.Stop()
	PartyErikurIntroScene.Stop()
	PartyVittoriaIntroScene.Stop()

	; start new scene
	LeavePartyScene.Start()
	pNewScene.Start()
endFunction


; call this when a distraction scene ends, to put party back to correct state
function EndDistractionScene ( Scene pScene )
; 	debug.trace(self + " EndDistractionScene " + pScene)
	; if player didn't exit, reset variable and end Leave scene
	if GetStageDone(140) == 0
		PartyDistractionState = 0
		LeavePartyScene.Stop()
		ReturnToPartyScene.Start()
	endif

	; reset particular scene variables
	if pScene == PartyDistractionDrunkScene
		PartyDistractionDrunkState = 0
		PartyDistractionDrunkSceneDone = true
	else
		; TODO
	endif

endFunction

function OpenExitDoor(bool bOpen, bool bWaitForPlayerToExitTrigger = true)
	; Malborn opens/closes door
; 	debug.trace(self + " OpenExitDoor " + bOpen)
	if !bOpen && bWaitForPlayerToExitTrigger
		; make sure player isn't locked inside
		while PlayerInExitPartyTrigger == true && PlayerInPartyTrigger == false
; 			debug.trace(self + " OpenExitDoor: waiting for player to return to party")
			wait(1)
		endWhile
	endif
	Alias_PartyExitDoor.GetReference().Lock(!bOpen)
	Alias_PartyExitDoor.GetReference().SetOpen(bOpen)
; 	debug.trace(self + " OpenExitDoor DONE")
endFunction

event OnUpdate()
	; watch for Malborn to be in kitchen and for player to NOT be in kitchen
	if GetStageDone(160) == 1 && GetStageDone(165) == 0
		if MQ201MalbornInKitchenTrigger.bAllTargetsInTrigger == true &&  MQ201PlayerInKitchenTrigger.bAllTargetsInTrigger == false
			setstage(165)
		endif
	endif
	if !GetStageDone(165)
		RegisterForSingleUpdate(2)
	endif
endEvent

function GivePlayerDrink()
; 	debug.trace(self + " GivePlayerDrink")
	; give the player what's in the ColovianBrandy alias
	Game.GetPlayer().AddItem(ColovianBrandy.GetRef())
endFunction

function RemoveDrinkFromPlayer()
; 	debug.trace(self + " RemoveDrinkFromPlayer")
	; remove drink from player
	; first, check if player has some other drink - if so, remove that
	Actor player = Game.GetPlayer()
	if player.GetItemCount(Drink1) > 0
		player.RemoveItem(Drink1, 1)
	elseif player.GetItemCount(Drink2) > 0
		player.RemoveItem(Drink2, 1)
	elseif player.GetItemCount(Drink3) > 0
		player.RemoveItem(Drink3, 1)
	elseif player.GetItemCount(Drink4) > 0
		player.RemoveItem(Drink4, 1)
	else
		; otherwise, remove quest item drink
		player.RemoveItem(MQ201Drink, 99)
		; create new drink and force into alias (when player drinks the brandy or gives it away)
		ObjectReference newDrink = PartyDrinkMarker.GetRef().PlaceAtMe(MQ201Drink)
		ColovianBrandy.ForceRefTo(newDrink)
	endif
endFunction

Potion Property MQ201Drink  Auto  
{Specific drink object that the drunk wants}

int Property PartyDistractionDrunkState = 0 Auto  Conditional
{tracks the state of the "Drunk" distraction in the party scene
0 = base state
1 = brought drink
2 = started scene
}

bool Property PartyDistractionDrunkSceneDone Auto Conditional
{set to true when you've done the drunk scene at least once}

int Property PartyDistractionState = 0 Auto  Conditional
{
0 = no distraction (Malborn returns to base state)
1 = Malborn waiting by door for distraction
2 = guards are distracted (Malborn will open door if you go near him)
}


int Property PrisonerReleased = 0 Auto  Conditional
{
1 = prisoner freed
2 = prisoner escorting player
}


Location Property RiverwoodInnLocation  Auto  

Location Property ThalmorEmbassyLocation  Auto  

ReferenceAlias Property Alias_PartyExitDoor Auto


Scene Property PartyDistractionDrunkScene  Auto  
Scene Property PartyDistractionFriendScene  Auto  


Scene Property LeavePartyScene  Auto  
{scene where Malborn opens the door. Repeatable.
based on PartyDistractionState variable
}

int Property DelphineIntroAlduinAtHelgen  Auto  Conditional
{
1 = Delphine told player she doesn't know about Alduin
2 = player told Delphine about Alduin being at Helgen
}

Scene Property ReturnToPartyScene  Auto  

bool Property OndolemarDistractionFlag  Auto  
{set to true if you ask Ondolemar to help -
he will no longer be your friend after this quest}

bool Property PlayerInExitPartyTrigger  Auto  Conditional
{true when player is in the exit party trigger box}

bool Property PlayerInPartyTrigger  Auto  Conditional
{true when player is in the party trigger box}


Scene Property PartyDistractionErikurBrelasScene  Auto  

bool Property PlayerLiesAboutBrelas  Auto  Conditional
{set to true if player tells Erikur that Brelas is interested}

bool Property NoPartyConversationFlag  Auto  Conditional
{set to true while scenes are running to shut off conversations}


Scene Property PartyVittoriaIntroScene  Auto  

Scene Property PartyErikurIntroScene  Auto  

Cell Property ThalmorDungeonCell  Auto  

DefaultOnEnter Property MQ201MalbornInKitchenTrigger  Auto  

DefaultOnEnter Property MQ201PlayerInKitchenTrigger  Auto  

bool Property BrelasReleased = false Auto  Conditional

ReferenceAlias Property ColovianBrandy  Auto  

ReferenceAlias Property PartyDrinkMarker  Auto  

Potion Property Drink1  Auto  
Potion Property Drink2  Auto  
Potion Property Drink3  Auto  
Potion Property Drink4  Auto  
