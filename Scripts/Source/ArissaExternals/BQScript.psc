Scriptname BQScript extends Quest  Conditional
{Script on BQ quests, has common properties and functions.}

MiscObject Property Gold001 Auto
Int Property RewardAmount = 100 Auto
{Default = 100; How much gold to reward player.}

Keyword Property BQActiveQuest Auto

LocationAlias Property Alias_Location Auto
LocationAlias Property Hold Auto

function RewardPlayer()
	Game.GetPlayer().AddItem(Gold001, RewardAmount)

EndFunction

function PlayerChangedLocation()

	if getStage() < 10
		if Game.GetPlayer().IsInLocation(Alias_Location.GetLocation()) == False
; 			debug.trace(self + " player is no longer in location and hasn't picked up quest, so shutting down quest so it can happen elsewhere.")
			Hold.GetLocation().setKeywordData(BQActiveQuest, 0)
			stop()
		
		EndIf
	
	EndIf

EndFunction
