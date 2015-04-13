Scriptname FFR12QuestScript extends Quest  Conditional

Potion Property pHeal01 Auto
Potion Property pHeal02 Auto
Potion Property pHeal03 Auto
Potion Property pHeal04 Auto
Potion Property pHeal05 Auto
Potion Property pHeal06 Auto
ReferenceAlias Property pWujeetaAlias Auto

Function HealMeNow()

	if GetStageDone(25) == 0
		if Game.GetPlayer().GetItemCount(pHeal01) >= 1
			Game.GetPlayer().RemoveItem(pHeal01,1)
			SetStage(25)
		elseif Game.GetPlayer().GetItemCount(pHeal02) >= 1
			Game.GetPlayer().RemoveItem(pHeal02,1)
			SetStage(25)
		elseif Game.GetPlayer().GetItemCount(pHeal03) >= 1
			Game.GetPlayer().RemoveItem(pHeal03,1)
			SetStage(25)
		elseif Game.GetPlayer().GetItemCount(pHeal04) >= 1
			Game.GetPlayer().RemoveItem(pHeal04,1)
			SetStage(25)
		elseif Game.GetPlayer().GetItemCount(pHeal05) >= 1
			Game.GetPlayer().RemoveItem(pHeal05,1)
			SetStage(25)
		elseif Game.GetPlayer().GetItemCount(pHeal06) >= 1
			Game.GetPlayer().RemoveItem(pHeal06,1)
			SetStage(25)
		endif
	endif

endFunction