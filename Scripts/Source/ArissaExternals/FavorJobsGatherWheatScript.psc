ScriptName FavorJobsGatherWheatScript extends Quest

Ingredient Property Wheat Auto
Potion Property Gourd Auto
Ingredient Property Nirnroot Auto
Potion Property FoodPotato Auto
Potion Property FoodCabbage Auto
Potion Property FoodLeek Auto
Int Property PlayerCropCount Auto
Int Property PlayerGoldReward Auto
MiscObject Property pGold Auto

Function SellWheat(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(Wheat)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (PlayerCropCount * (Wheat.GetGoldValue()))
		
	Game.GetPlayer().RemoveItem(Wheat, PlayerCropCount)
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellPotato(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(FoodPotato)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (PlayerCropCount * (FoodPotato.GetGoldValue()))
		
	Game.GetPlayer().RemoveItem(FoodPotato, PlayerCropCount)
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellLeek(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(FoodLeek)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (PlayerCropCount * (FoodLeek.GetGoldValue()))
		
	Game.GetPlayer().RemoveItem(FoodLeek, PlayerCropCount)
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellGourd(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(Gourd)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (PlayerCropCount * (Gourd.GetGoldValue()))
		
	Game.GetPlayer().RemoveItem(Gourd, PlayerCropCount)
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellCabbage(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(FoodCabbage)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (PlayerCropCount * (FoodCabbage.GetGoldValue()))
		
	Game.GetPlayer().RemoveItem(FoodCabbage, PlayerCropCount)
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellNirnroot(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(Nirnroot)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (PlayerCropCount * (Nirnroot.GetGoldValue()))
		
	Game.GetPlayer().RemoveItem(Nirnroot, PlayerCropCount)
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction