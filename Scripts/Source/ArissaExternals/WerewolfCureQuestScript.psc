Scriptname WerewolfCureQuestScript extends Quest conditional

bool Property PlayerIsWerewolf auto conditional
bool Property PlayerHasBeenCuredBefore auto conditional
Quest Property SilverHandPursuit auto

Ingredient Property Ingredient1 auto
Ingredient Property Ingredient2 auto

Keyword Property DebugKeyword auto

Event OnUpdate()
	if (GetStage() == 30)
		if ( (Game.GetPlayer().GetItemCount(Ingredient1) > 0) && (Game.GetPlayer().GetItemCount(Ingredient2) > 0) )
			SetStage(40)
		endif
	endif
endEvent