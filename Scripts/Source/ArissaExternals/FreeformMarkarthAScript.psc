ScriptName FreeformMarkarthAScript extends Quest

MiscObject	Property pDwemerParts Auto
Int Property PlayerPartsCount Auto
Int Property PlayerGoldReward Auto
MiscObject Property pGold Auto

Function SellParts(Actor pCalcelmo)

	;Count the amount of parts the player has
	PlayerPartsCount = Game.GetPlayer().GetItemCount(pDwemerParts)
		
	;Make Calcelmo the player's friend
	If pCalcelmo.GetRelationshipRank(Game.GetPlayer()) == 0
		pCalcelmo.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = PlayerPartsCount * 25
		
	Game.GetPlayer().RemoveItem(pDwemerParts, PlayerPartsCount)
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction