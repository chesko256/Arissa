Scriptname _Arissa_MQ01_Data extends Quest  Conditional

_Arissa_iNPC_Behavior property iNPCSystem auto
Outfit property _Arissa_Town_Outfit auto

int property BackgroundChoice = 0 auto conditional
{Stores the player's dialogue choice of background, so she can recall it later.}
;1 = Dragonborn
;2 = Warrior
;3 = Mage
;4 = Rogue
;5 = Multi-class
;6 = Didn't say

bool property SaveArissaChoice = false auto conditional
{Whether or not the player saved Arissa from going to jail.}

bool property InitiallyTurnedDownQuest = false auto conditional
{Whether or not the player talked to her and didn't accept the quest.}

int property GoldStolenFromPlayer = 0 auto
{The amount of gold stolen from the player.}

bool property JailBreakGuardNotWatching = false auto conditional
{Used for the jail break scene.}

bool property PlayerNearJailCell = false auto conditional
{Is the player near Arissa's jail cell?}

bool property JailBroken = false auto conditional

bool property JailedTogether = false auto conditional
{Did both Arissa and the Player go to jail?}

Quest property _Arissa_MQ01 auto

;Pseudo Start Game Enabled behavior
Event OnInit()
	RegisterForSingleUpdate(1)
endEvent
Event OnUpdate()
	if !_Arissa_MQ01.IsRunning() && !(_Arissa_MQ01.GetStage() >= 200)
		_Arissa_MQ01.SetStage(5)
	endif
	if !(_Arissa_MQ01.IsRunning())
		RegisterForSingleUpdate(1)
	endif
endEvent