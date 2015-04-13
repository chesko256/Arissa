ScriptName FavorJobsMineOreScript extends Quest

MiscObject Property OreCorundum Auto
MiscObject Property OreEbony Auto
MiscObject Property OreGold Auto
MiscObject Property OreIron Auto
MiscObject Property OreMalachite Auto
MiscObject Property OreMoonstone Auto
MiscObject Property OreOrichalcum Auto
MiscObject Property OreQuicksilver Auto
MiscObject Property OreSilver Auto

Keyword Property MinerCorundum Auto
Keyword Property MinerEbony Auto
Keyword Property MinerGold Auto
Keyword Property MinerIron Auto
Keyword Property MinerMalachite Auto
Keyword Property MinerMoonstone Auto
Keyword Property MinerOrichalcum Auto
Keyword Property MinerQuicksilver Auto
Keyword Property MinerSilver Auto

Int Property PlayerOreCount Auto
Int Property PlayerGoldReward Auto
MiscObject Property pGold001 Auto

GlobalVariable Property JobsOreCorundumValue Auto
GlobalVariable Property JobsOreEbonyValue Auto
GlobalVariable Property JobsOreGoldValue Auto
GlobalVariable Property JobsOreIronValue Auto
GlobalVariable Property JobsOreMalachiteValue Auto
GlobalVariable Property JobsOreMoonstoneValue Auto
GlobalVariable Property JobsOreOrichalcumValue Auto
GlobalVariable Property JobsOreQuicksilverValue Auto
GlobalVariable Property JobsOreSilverValue Auto

Function SellOre(Actor Foreman, Keyword OreType)

	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf	

	;Player is selling Corundum
	If OreType == MinerCorundum
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreCorundum)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreCorundumValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreCorundum, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)
		
	;Player is selling Ebony
	ElseIf OreType == MinerEbony
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreEbony)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreEbonyValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreEbony, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)
	
	;Player is selling Gold
	ElseIf OreType == MinerGold
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreGold)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreGoldValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreGold, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)

	;Player is selling Iron
	ElseIf OreType == MinerIron
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreIron)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreIronValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreIron, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)		

	;Player is selling Malachite
	ElseIf OreType == MinerMalachite
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreMalachite)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreMalachiteValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreMalachite, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)	

	;Player is selling Moonstone
	ElseIf OreType == MinerMoonstone
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreMoonstone)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreMoonstoneValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreMoonstone, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)		

	;Player is selling Orichalcum
	ElseIf OreType == MinerOrichalcum
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreOrichalcum)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreOrichalcumValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreOrichalcum, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)

	;Player is selling Quicksilver
	ElseIf OreType == MinerQuicksilver
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreQuicksilver)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreQuicksilverValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreQuicksilver, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)

	;Player is selling Silver
	ElseIf OreType == MinerSilver
		;Count the amount of ore the player has
		PlayerOreCount = Game.GetPlayer().GetItemCount(OreSilver)
		
		;Calculate the amount of gold to give the player
		PlayerGoldReward = PlayerOreCount * (JobsOreSilverValue.GetValueInt())
		
		Game.GetPlayer().RemoveItem(OreSilver, PlayerOreCount)
		Game.GetPlayer().AddItem(pGold001, PlayerGoldReward)	
	EndIf
EndFunction