ScriptName FavorJobsChopWoodScript extends Quest

MiscObject	Property pFirewood Auto
Int Property PlayerFirewoodCount Auto
Int Property PlayerGoldReward Auto
MiscObject Property pGold Auto
GlobalVariable Property JobsWoodValue Auto

Function SellWood(Actor Foreman)

	;Count the amount of wood the player has
	PlayerFirewoodCount = Game.GetPlayer().GetItemCount(pFirewood)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (PlayerFirewoodCount * (JobsWoodValue.GetValueInt()))
		
	Game.GetPlayer().RemoveItem(pFirewood, PlayerFirewoodCount)
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction